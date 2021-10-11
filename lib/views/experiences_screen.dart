import 'package:flutter/material.dart';
import 'package:placement_app/components/experience_tile.dart';
import 'package:placement_app/models/experience_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:placement_app/views/submit_experiences_screen.dart';

class ExperiencesScreen extends StatefulWidget {
  const ExperiencesScreen({Key? key}) : super(key: key);

  @override
  _ExperiencesScreenState createState() => _ExperiencesScreenState();
}

class _ExperiencesScreenState extends State<ExperiencesScreen> {
  bool _loaded = false;

  List<ExperienceModel> experiences = [];

  Future<void> getExperienceFromSheet() async {
    var raw = await http.get(
      Uri.parse(
          "https://script.google.com/macros/s/AKfycbwjnDc_vI9YD9mExRY0nNvIBiOn8oP27xJEzQA9a9EKSk0kzNFDWl-e-6As0t47NVgD/exec"),
    );

    experiences.clear();

    var jsonExperience = convert.jsonDecode(raw.body);

    jsonExperience.forEach((element) {
      ExperienceModel exp = ExperienceModel(
          name: element['name'],
          companyName: element['company_name'],
          package: element['package'].toString(),
          year: element['year'].toString(),
          story: element['story']);

      experiences.add(exp);
    });

    experiences = experiences.reversed.toList();

    _loaded = true;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getExperienceFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Experiences",
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _loaded
          ? RefreshIndicator(
              child: ListView.builder(
                  itemCount: experiences.length,
                  itemBuilder: (context, index) {
                    return ExperienceTile(
                      name: experiences[index].name,
                      companyName: experiences[index].companyName,
                      package: experiences[index].package,
                      year: experiences[index].year,
                      story: experiences[index].story,
                    );
                  }),
              onRefresh: getExperienceFromSheet,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SubmitExperiencesScreen(),
              ),
            ).then(
              (_) => getExperienceFromSheet(),
            );
          }),
    );
  }
}
