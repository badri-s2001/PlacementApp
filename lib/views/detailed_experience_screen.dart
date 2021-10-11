import 'package:flutter/material.dart';

class DetailedExperienceScreen extends StatelessWidget {
  final String name;
  final String companyName;
  final String package;
  final String year;
  final String story;

  const DetailedExperienceScreen({
    required this.name,
    required this.companyName,
    required this.package,
    required this.year,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) / 30.0,
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    companyName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) / 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Package: " + package.toString() + " lpa",
                          style: const TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "Year: " + year,
                          style: const TextStyle(
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) / 30.0,
                  ),
                  Text(
                    story,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) / 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
