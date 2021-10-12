import 'package:flutter/material.dart';
import 'package:placement_app/components/rounded_button.dart';
import 'package:placement_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailedCompanyScreen extends StatefulWidget {
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

  const DetailedCompanyScreen({
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
  });

  @override
  _DetailedCompanyScreenState createState() => _DetailedCompanyScreenState();
}

class _DetailedCompanyScreenState extends State<DetailedCompanyScreen> {
  bool _loaded = false;
  bool applied = false;

  Future<void> checkIfApplied() async {
    _loaded = false;

    if (mounted) {
      setState(() {});
    }

    var raw = await http.get(
      Uri.parse(widget.apiLink),
    );

    var uidList = convert.jsonDecode(raw.body);

    if (uidList.contains(widget.loggedInUser.uid)) {
      applied = true;
    }

    _loaded = true;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfApplied();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: _loaded
          ? SingleChildScrollView(
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
                          widget.companyName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.ctc + " LPA",
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
                                widget.location,
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
                                    widget.applyBefore,
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
                          height: (MediaQuery.of(context).size.height) / 30.0,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Date of drive",
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                            ),
                            Text(
                              widget.dateOfDrive,
                              style: const TextStyle(
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height) / 30.0,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Selection Process",
                            ),
                            Text(
                              widget.selectionProcess,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height) / 30.0,
                        ),
                        applied
                            ? RoundedButton(
                                color: Colors.red,
                                buttonTitle: "Already Applied",
                                onPressed: () {},
                              )
                            : RoundedButton(
                                color: Colors.green,
                                buttonTitle: "Apply Now",
                                onPressed: () {
                                  applyNow();
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future<void> applyNow() async {
    Map<String, dynamic> body = widget.loggedInUser.toMap();
    var response = await http.post(
      Uri.parse(widget.apiLink),
      body: body,
    );
    checkIfApplied();
  }
}
