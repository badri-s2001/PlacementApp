import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SubmitExperiencesScreen extends StatefulWidget {
  const SubmitExperiencesScreen({Key? key}) : super(key: key);

  @override
  _SubmitExperiencesScreenState createState() =>
      _SubmitExperiencesScreenState();
}

class _SubmitExperiencesScreenState extends State<SubmitExperiencesScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController packageController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController storyController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Map<String, String> body = {
        'name': nameController.text,
        'company_name': companyNameController.text,
        'package': packageController.text,
        'year': yearController.text,
        'story': storyController.text
      };

      var response = await http.post(
        Uri.parse(
            "https://script.google.com/macros/s/AKfycbwjnDc_vI9YD9mExRY0nNvIBiOn8oP27xJEzQA9a9EKSk0kzNFDWl-e-6As0t47NVgD/exec"),
        body: body,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Submitted",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form",
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid name";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextFormField(
                controller: companyNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid company";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Company Name",
                ),
              ),
              TextFormField(
                controller: packageController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid package";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Package",
                ),
              ),
              TextFormField(
                controller: yearController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid Year";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Year",
                ),
              ),
              TextFormField(
                controller: storyController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid Story";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Story",
                ),
              ),
              ElevatedButton(
                child: const Text(
                  "Submit",
                ),
                onPressed: () {
                  _submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
