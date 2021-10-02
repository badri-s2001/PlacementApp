import 'package:flutter/material.dart';

class ExperienceTile extends StatelessWidget {
  final String name;
  final String companyName;
  final String package;
  final String year;
  final String story;

  const ExperienceTile(
      {required this.name,
      required this.companyName,
      required this.package,
      required this.year,
      required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                name,
              ),
              Text(
                companyName,
              ),
              Text(
                package.toString(),
              ),
              Text(
                year,
              ),
              Text(
                story,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
