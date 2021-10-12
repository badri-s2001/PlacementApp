import 'package:flutter/material.dart';
import 'package:placement_app/views/detailed_experience_screen.dart';

class ExperienceTile extends StatelessWidget {
  final String name;
  final String companyName;
  final String package;
  final String year;
  final String story;

  const ExperienceTile({
    required this.name,
    required this.companyName,
    required this.package,
    required this.year,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                  height: (MediaQuery.of(context).size.height) / 70.0,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedExperienceScreen(
                name: name,
                companyName: companyName,
                package: package,
                year: year,
                story: story,
              ),
            ),
          );
        },
      ),
    );
  }
}
