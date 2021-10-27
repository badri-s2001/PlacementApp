import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:placement_app/components/company_tile.dart';
import 'package:placement_app/models/company_model.dart';
import 'package:placement_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'detailed_company_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _loaded = false;

  List<CompanyModel> companies = [];

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  Future<void> getCompaniesFromSheet() async {
    _loaded = false;

    if (mounted) {
      setState(() {});
    }

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data()!);
    });

    var raw = await http.get(
      Uri.parse(
          "https://script.google.com/macros/s/AKfycby9STefcAgsu_pnpLvW4UAdqul69HDobpkO04iU1RWlp7Qhhc1YiPKjZrEXuKY0zMXU/exec"),
    );

    companies.clear();

    var jsonCompany = convert.jsonDecode(raw.body);

    jsonCompany.forEach((element) {
      CompanyModel company = CompanyModel(
        companyName: element['company_name'],
        ctc: element['ctc'].toString(),
        location: element['location'],
        dateOfDrive: element['date_of_drive'],
        selectionProcess: element['selection_process'],
        departments: element['departments'],
        maximumStandingArrears: element['maximum_standing_arrears'].toString(),
        historyOfArrears: element['history_of_arrears'],
        minimumPercentage: element['minimum_percentage'].toString(),
        applyBefore: element['apply_before'],
        sheetsLink: element['sheets_link'],
        apiLink: element['api_link'],
      );

      bool eligibility = true;

      if (company.companyName == "" ||
          company.ctc == "" ||
          company.location == "" ||
          company.dateOfDrive == "" ||
          company.selectionProcess == "" ||
          company.departments == "" ||
          company.maximumStandingArrears == "" ||
          company.historyOfArrears == "" ||
          company.minimumPercentage == "" ||
          company.applyBefore == "" ||
          company.apiLink == "") {
        eligibility = false;
        return;
      }

      if (!company.departments.contains(RegExp(loggedInUser.collegeBranch!))) {
        eligibility = false;
      }

      if (!company.historyOfArrears
          .contains(RegExp(loggedInUser.historyArrear!))) {
        eligibility = false;
      }

      if (int.parse(company.maximumStandingArrears) <
          int.parse(loggedInUser.standingArrear!)) {
        eligibility = false;
      }

      if (double.parse(company.minimumPercentage) >
          double.parse(loggedInUser.collegeMarks!)) {
        eligibility = false;
      }

      if (double.parse(company.minimumPercentage) >
          double.parse(loggedInUser.tenthMarks!)) {
        eligibility = false;
      }

      if (eligibility) {
        companies.add(company);
      }
    });

    companies = companies.reversed.toList();

    _loaded = true;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getCompaniesFromSheet();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return logout(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Companies",
          ),
          automaticallyImplyLeading: false,
          leading: null,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {
                //Implement logout functionality
                logout(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: _loaded
            ? RefreshIndicator(
                child: Container(
                  child: ListView.builder(
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        return CompanyTile(
                            companyName: companies[index].companyName,
                            ctc: companies[index].ctc,
                            location: companies[index].location,
                            dateOfDrive: companies[index].dateOfDrive,
                            selectionProcess: companies[index].selectionProcess,
                            departments: companies[index].departments,
                            maximumStandingArrears:
                                companies[index].maximumStandingArrears,
                            historyOfArrears: companies[index].historyOfArrears,
                            minimumPercentage:
                                companies[index].minimumPercentage,
                            applyBefore: companies[index].applyBefore,
                            sheetsLink: companies[index].sheetsLink,
                            apiLink: companies[index].apiLink,
                            loggedInUser: loggedInUser,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailedCompanyScreen(
                                    companyName: companies[index].companyName,
                                    ctc: companies[index].ctc,
                                    location: companies[index].location,
                                    dateOfDrive: companies[index].dateOfDrive,
                                    selectionProcess:
                                        companies[index].selectionProcess,
                                    departments: companies[index].departments,
                                    maximumStandingArrears:
                                        companies[index].maximumStandingArrears,
                                    historyOfArrears:
                                        companies[index].historyOfArrears,
                                    minimumPercentage:
                                        companies[index].minimumPercentage,
                                    applyBefore: companies[index].applyBefore,
                                    sheetsLink: companies[index].sheetsLink,
                                    apiLink: companies[index].apiLink,
                                    loggedInUser: loggedInUser,
                                  ),
                                ),
                              ).then(
                                (_) => getCompaniesFromSheet(),
                              );
                            });
                      }),
                ),
                onRefresh: getCompaniesFromSheet,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }
}
