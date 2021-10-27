import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:placement_app/components/rounded_button.dart';

import '../constants.dart';

class SubmitExperiencesScreen extends StatefulWidget {
  const SubmitExperiencesScreen({Key? key}) : super(key: key);

  @override
  _SubmitExperiencesScreenState createState() =>
      _SubmitExperiencesScreenState();
}

class _SubmitExperiencesScreenState extends State<SubmitExperiencesScreen> {
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController packageController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController storyController = TextEditingController();

  Future<bool> _submitForm() async {
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

      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Submit Experience",
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Valid name";
                      } else {
                        return null;
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Name",
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: companyNameController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Valid company";
                      } else {
                        return null;
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Company Name",
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: packageController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Package is empty";
                      } else {
                        if (!RegExp(
                          r'^([0-9]+\.?[0-9]*)$',
                        ).hasMatch(value)) {
                          return "At least 1 upper 1 lower 1 special 1 digit. 8 chars min";
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Package (in LPA)",
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: yearController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      BlacklistingTextInputFormatter.singleLineFormatter
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Year is empty";
                      } else {
                        if (!RegExp(
                          r'^\d{4}$',
                        ).hasMatch(value)) {
                          return "Invalid Year";
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Year",
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    minLines: 10,
                    maxLines: 20,
                    controller: storyController,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Valid Story";
                      } else {
                        return null;
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Story",
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  RoundedButton(
                    buttonTitle: "Submit",
                    color: Colors.blue,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      bool status = await _submitForm();
                      setState(() {
                        showSpinner = false;
                      });

                      if (status == true) {
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
                    },
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
