import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:placement_app/components/rounded_button.dart';
import 'package:placement_app/models/user_model.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String? _status;

  bool _obscureText = true;
  bool showSpinner = false;

  String? selectedGender;
  List<String> listOfGenders = [
    "Male",
    "Female",
    "Other",
  ];

  String? selectedDegree;
  List<String> listOfDegrees = [
    "B.E.",
    "B.Tech.",
  ];

  String? selectedHistory;
  List<String> listofHistory = [
    "Yes",
    "No",
  ];

  String? selectedBranch;
  List<String> listOfBranches = [
    "Automobile Engineering",
    "Biotechnology",
    "Chemical Engineering",
    "Civil Engineering",
    "Computer Science Engineering",
    "Electrical & Electronics Engineering",
    "Electronics & Communication Engineering",
    "Information Technology",
    "Mechanical Engineering",
    "Marine Engineering"
  ];

  DateTime selectedBirthDate = DateTime(2001, 1, 1);

  _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedBirthDate,
      firstDate: DateTime(DateTime.now().year - 120),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedBirthDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        dateOfBirthController.text = date;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController tenthSchoolController = TextEditingController();
  TextEditingController tenthBoardController = TextEditingController();
  TextEditingController tenthMarksController = TextEditingController();
  TextEditingController tenthStateController = TextEditingController();
  TextEditingController tenthCountryController = TextEditingController();
  TextEditingController tenthYearController = TextEditingController();
  TextEditingController twelfthSchoolController = TextEditingController();
  TextEditingController twelfthBoardController = TextEditingController();
  TextEditingController twelfthMarksController = TextEditingController();
  TextEditingController twelfthStateController = TextEditingController();
  TextEditingController twelfthCountryController = TextEditingController();
  TextEditingController twelfthYearController = TextEditingController();
  TextEditingController diplomaInstituteController = TextEditingController();
  TextEditingController diplomaUniversityController = TextEditingController();
  TextEditingController diplomaBranchController = TextEditingController();
  TextEditingController diplomaMarksController = TextEditingController();
  TextEditingController diplomaStateController = TextEditingController();
  TextEditingController diplomaCountryController = TextEditingController();
  TextEditingController diplomaYearController = TextEditingController();
  TextEditingController collegeNameController = TextEditingController();
  TextEditingController collegeUniversityController = TextEditingController();
  TextEditingController collegeDegreeController = TextEditingController();
  TextEditingController collegeBranchController = TextEditingController();
  TextEditingController collegeMarksController = TextEditingController();
  TextEditingController standingArrearController = TextEditingController();
  TextEditingController historyArrearController = TextEditingController();
  TextEditingController univRollNoController = TextEditingController();
  TextEditingController collegeStateController = TextEditingController();
  TextEditingController collegeCountryController = TextEditingController();
  TextEditingController collegeYearController = TextEditingController();
  TextEditingController resumeLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TypewriterAnimatedTextKit(
                      text: const ["Register"],
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "Auth details (for Login)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is empty";
                        } else {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Email is not valid";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is empty";
                        } else {
                          if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          ).hasMatch(value)) {
                            return "At least 1 upper 1 lower 1 special 1 digit. 8 chars min";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Set Password",
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "Personal Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Full Name",
                        labelText: "Full Name",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      items: listOfGenders
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                          genderController.text = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Gender is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Gender",
                        labelText: "Gender",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      controller: mobileController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                        BlacklistingTextInputFormatter.singleLineFormatter
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile is empty";
                        } else {
                          if (!RegExp(
                            r'^\d{10}$',
                          ).hasMatch(value)) {
                            return "Mobile number should be 10 digits";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Mobile Number",
                        labelText: "Mobile Number",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    GestureDetector(
                      onTap: () => _selectBirthDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: dateOfBirthController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Date of birth is empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Date of Birth",
                            labelText: "Date of Birth",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      minLines: 2,
                      maxLines: 5,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.newline,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Address";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Address",
                        labelText: "Address",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: cityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "City is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "City",
                        labelText: "City",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: stateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "State is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "State",
                        labelText: "State",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: countryController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Country is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Country",
                        labelText: "Country",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: pinCodeController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                        BlacklistingTextInputFormatter.singleLineFormatter
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Pin Code is empty";
                        } else {
                          if (!RegExp(
                            r'^\d{6}$',
                          ).hasMatch(value)) {
                            return "Pin Code should be 6 digits";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Pin Code",
                        labelText: "Pin Code",
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "Previous Academic details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "10th",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: tenthSchoolController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "10th school name is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "10th school name",
                        labelText: "10th school name",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: tenthBoardController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "10th board is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "10th board",
                        labelText: "10th board",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: tenthMarksController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "10th percentage is empty";
                        } else {
                          if (!RegExp(
                                  r'(^100(\.0*)?$)|(^([1-9]([0-9])?|0)(\.[0-9]*)?$)')
                              .hasMatch(value)) {
                            return "Enter valid 10th percentage";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "10th percentage",
                        labelText: "10th percentage",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: tenthStateController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "10th State is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "10th State",
                        labelText: "10th State",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: tenthCountryController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "10th Country is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "10th Country",
                        labelText: "10th Country",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: tenthYearController,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        BlacklistingTextInputFormatter.singleLineFormatter
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "10th year of passing is empty";
                        } else {
                          if (!RegExp(
                            r'^\d{4}$',
                          ).hasMatch(value)) {
                            return "Invalid year of passing";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "10th year of passing",
                        labelText: "10th year of passing",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "12th",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: twelfthSchoolController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "12th school name (if applicable)",
                        labelText: "12th school name (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: twelfthBoardController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "12th board (if applicable)",
                        labelText: "12th board (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: twelfthMarksController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == "") {
                          return null;
                        } else if (!RegExp(
                                r'(^100(\.0*)?$)|(^([1-9]([0-9])?|0)(\.[0-9]*)?$)')
                            .hasMatch(value!)) {
                          return "Enter valid 12th percentage";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "12th percentage (if applicable)",
                        labelText: "12th percentage (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: twelfthStateController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "12th State (if applicable)",
                        labelText: "12th State (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: twelfthCountryController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "12th Country (if applicable)",
                        labelText: "12th Country (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: twelfthYearController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        BlacklistingTextInputFormatter.singleLineFormatter
                      ],
                      validator: (value) {
                        if (value == "") {
                          return null;
                        } else {
                          if (!RegExp(
                            r'^\d{4}$',
                          ).hasMatch(value!)) {
                            return "Invalid year of passing";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "12th year of passing (if applicable)",
                        labelText: "12th year of passing (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Diploma",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: diplomaInstituteController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma institute name (if applicable)",
                        labelText: "Diploma institute name (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: diplomaUniversityController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma University (if applicable)",
                        labelText: "Diploma University (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: diplomaBranchController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma Branch (if applicable)",
                        labelText: "Diploma Branch (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: diplomaMarksController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == "") {
                          return null;
                        } else if (!RegExp(
                                r'(^100(\.0*)?$)|(^([1-9]([0-9])?|0)(\.[0-9]*)?$)')
                            .hasMatch(value!)) {
                          return "Enter valid Diploma percentage";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma percentage (if applicable)",
                        labelText: "Diploma percentage (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: diplomaStateController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma State (if applicable)",
                        labelText: "Diploma State (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: diplomaCountryController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma Country (if applicable)",
                        labelText: "Diploma Country (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: diplomaYearController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        BlacklistingTextInputFormatter.singleLineFormatter
                      ],
                      validator: (value) {
                        if (value == "") {
                          return null;
                        } else {
                          if (!RegExp(
                            r'^\d{4}$',
                          ).hasMatch(value!)) {
                            return "Invalid year of passing";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Diploma year of passing (if applicable)",
                        labelText: "Diploma year of passing (if applicable)",
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "UG details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: collegeNameController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "College Name is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "College Name",
                        labelText: "College Name",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: collegeUniversityController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "College University is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "College University",
                        labelText: "College University",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      value: selectedDegree,
                      items: listOfDegrees
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDegree = value!;
                          collegeDegreeController.text = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Degree is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Degree",
                        labelText: "Degree",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      value: selectedBranch,
                      isExpanded: true,
                      items: listOfBranches
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedBranch = value!;
                          collegeBranchController.text = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Branch is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Branch",
                        labelText: "Branch",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: collegeMarksController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UG percentage is empty";
                        } else {
                          if (!RegExp(
                                  r'(^100(\.0*)?$)|(^([1-9]([0-9])?|0)(\.[0-9]*)?$)')
                              .hasMatch(value)) {
                            return "Enter valid UG percentage";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "UG percentage",
                        labelText: "UG percentage",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      controller: univRollNoController,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "University Roll Number is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "University Roll Number",
                        labelText: "University Roll Number",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: standingArrearController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "No. of Standing arrears is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "No. of Standing arrears",
                        labelText: "No. of Standing arrears",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      value: selectedHistory,
                      isExpanded: true,
                      items: listofHistory
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedHistory = value!;
                          historyArrearController.text = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "History of Arrears is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "History of Arrears",
                        labelText: "History of Arrears",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      controller: collegeStateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "College State is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "College State",
                        labelText: "College State",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      controller: collegeCountryController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "College Country is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "College Country",
                        labelText: "College Country",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: collegeYearController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        BlacklistingTextInputFormatter.singleLineFormatter
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "College year of passing is empty";
                        } else {
                          if (!RegExp(
                            r'^\d{4}$',
                          ).hasMatch(value)) {
                            return "Invalid year of passing";
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "College Year of Passing",
                        labelText: "College Year of Passing",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: resumeLinkController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Resume link is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Resume link",
                        labelText: "Resume link",
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    RoundedButton(
                      color: Colors.blueAccent,
                      buttonTitle: "Register",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            showSpinner = true;
                          });

                          final status = await createAccount(
                            email: emailController.text,
                            pass: passwordController.text,
                          );
                          if (status == "successful") {
                            await postDetailsToFirestore();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Account created",
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushNamed(context, '/register');
                            setState(() {
                              showSpinner = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  status!,
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> createAccount({email, pass}) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (authResult.user != null) {
        _status = "successful";
      } else {
        _status = "Error undefined";
      }
    } on FirebaseAuthException catch (e) {
      _status = e.message.toString();
    }
    return _status;
  }

  Future<void> postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    UserModel userModel = UserModel(
      uid: user!.uid,
      email: user.email,
      name: nameController.text,
      gender: genderController.text,
      mobile: mobileController.text,
      dateOfBirth: dateOfBirthController.text,
      address: addressController.text,
      city: cityController.text,
      state: stateController.text,
      country: countryController.text,
      pinCode: pinCodeController.text,
      tenthSchool: tenthSchoolController.text,
      tenthBoard: tenthBoardController.text,
      tenthMarks: tenthMarksController.text,
      tenthState: tenthStateController.text,
      tenthCountry: tenthCountryController.text,
      tenthYear: tenthYearController.text,
      twelfthSchool: twelfthSchoolController.text,
      twelfthBoard: twelfthBoardController.text,
      twelfthMarks: twelfthMarksController.text,
      twelfthState: twelfthStateController.text,
      twelfthCountry: twelfthCountryController.text,
      twelfthYear: twelfthYearController.text,
      diplomaInstitute: diplomaInstituteController.text,
      diplomaUniversity: diplomaUniversityController.text,
      diplomaBranch: diplomaBranchController.text,
      diplomaMarks: diplomaMarksController.text,
      diplomaState: diplomaStateController.text,
      diplomaCountry: diplomaCountryController.text,
      diplomaYear: diplomaYearController.text,
      collegeName: collegeNameController.text,
      collegeUniversity: collegeUniversityController.text,
      collegeDegree: collegeDegreeController.text,
      collegeBranch: collegeBranchController.text,
      collegeMarks: collegeMarksController.text,
      standingArrear: standingArrearController.text,
      historyArrear: historyArrearController.text,
      univRollNo: univRollNoController.text,
      collegeState: collegeStateController.text,
      collegeCountry: collegeCountryController.text,
      collegeYear: collegeYearController.text,
      resumeLink: resumeLinkController.text,
    );

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}
