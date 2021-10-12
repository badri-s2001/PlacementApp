import 'package:flutter/material.dart';
import 'package:placement_app/models/user_model.dart';
import 'package:placement_app/views/detailed_company_screen.dart';

class CompanyTile extends StatelessWidget {
  final String companyName;
  final String ctc;
  final String location;
  final String dateOfDrive;
  final String selectionProcess;
  final String departments;
  final String maximumStandingArrears;
  final String historyOfArrears;
  final String minimumPercentage;
  final String applyBefore;
  final String sheetsLink;
  final String apiLink;
  final UserModel loggedInUser;
  final void Function() onPressed;

  const CompanyTile({
    required this.companyName,
    required this.ctc,
    required this.location,
    required this.dateOfDrive,
    required this.selectionProcess,
    required this.departments,
    required this.maximumStandingArrears,
    required this.historyOfArrears,
    required this.minimumPercentage,
    required this.applyBefore,
    required this.sheetsLink,
    required this.apiLink,
    required this.loggedInUser,
    required this.onPressed,
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
                    companyName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    ctc + " LPA",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 15.0,
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
                          location,
                          style: const TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              "Apply before",
                              style: TextStyle(
                                color: Colors.cyan,
                              ),
                            ),
                            Text(
                              applyBefore,
                              style: const TextStyle(
                                color: Colors.cyan,
                              ),
                            ),
                          ],
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
          onTap: onPressed),
    );
  }
}
