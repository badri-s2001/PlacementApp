class UserModel {
  String? uid;
  String? email;
  String? name;
  String? gender;
  String? mobile;
  String? dateOfBirth;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pinCode;
  String? tenthSchool;
  String? tenthBoard;
  String? tenthMarks;
  String? tenthState;
  String? tenthCountry;
  String? tenthYear;
  String? twelfthSchool;
  String? twelfthBoard;
  String? twelfthMarks;
  String? twelfthState;
  String? twelfthCountry;
  String? twelfthYear;
  String? diplomaInstitute;
  String? diplomaUniversity;
  String? diplomaBranch;
  String? diplomaMarks;
  String? diplomaState;
  String? diplomaCountry;
  String? diplomaYear;
  String? collegeName;
  String? collegeUniversity;
  String? collegeDegree;
  String? collegeBranch;
  String? collegeMarks;
  String? univRollNo;
  String? standingArrear;
  String? historyArrear;
  String? collegeState;
  String? collegeCountry;
  String? collegeYear;
  String? resumeLink;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.gender,
    this.mobile,
    this.dateOfBirth,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pinCode,
    this.tenthSchool,
    this.tenthBoard,
    this.tenthMarks,
    this.tenthState,
    this.tenthCountry,
    this.tenthYear,
    this.twelfthSchool,
    this.twelfthBoard,
    this.twelfthMarks,
    this.twelfthState,
    this.twelfthCountry,
    this.twelfthYear,
    this.diplomaInstitute,
    this.diplomaUniversity,
    this.diplomaBranch,
    this.diplomaMarks,
    this.diplomaState,
    this.diplomaCountry,
    this.diplomaYear,
    this.collegeName,
    this.collegeUniversity,
    this.collegeDegree,
    this.collegeBranch,
    this.collegeMarks,
    this.univRollNo,
    this.standingArrear,
    this.historyArrear,
    this.collegeState,
    this.collegeCountry,
    this.collegeYear,
    this.resumeLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'gender': gender,
      'mobile': mobile,
      'dateOfBirth': dateOfBirth,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'pinCode': pinCode,
      'tenthSchool': tenthSchool,
      'tenthBoard': tenthBoard,
      'tenthMarks': tenthMarks,
      'tenthState': tenthState,
      'tenthCountry': tenthCountry,
      'tenthYear': tenthYear,
      'twelfthSchool': twelfthSchool,
      'twelfthBoard': twelfthBoard,
      'twelfthMarks': twelfthMarks,
      'twelfthState': twelfthState,
      'twelfthCountry': twelfthCountry,
      'twelfthYear': twelfthYear,
      'diplomaInstitute': diplomaInstitute,
      'diplomaUniversity': diplomaUniversity,
      'diplomaBranch': diplomaBranch,
      'diplomaMarks': diplomaMarks,
      'diplomaState': diplomaState,
      'diplomaCountry': diplomaCountry,
      'diplomaYear': diplomaYear,
      'collegeName': collegeName,
      'collegeUniversity': collegeUniversity,
      'collegeDegree': collegeDegree,
      'collegeBranch': collegeBranch,
      'collegeMarks': collegeMarks,
      'univRollNo': univRollNo,
      'standingArrear': standingArrear,
      'historyArrear': historyArrear,
      'collegeState': collegeState,
      'collegeCountry': collegeCountry,
      'collegeYear': collegeYear,
      'resumeLink': resumeLink,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      mobile: map['mobile'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      pinCode: map['pinCode'] as String,
      tenthSchool: map['tenthSchool'] as String,
      tenthBoard: map['tenthBoard'] as String,
      tenthMarks: map['tenthMarks'] as String,
      tenthState: map['tenthState'] as String,
      tenthCountry: map['tenthCountry'] as String,
      tenthYear: map['tenthYear'] as String,
      twelfthSchool: map['twelfthSchool'] as String,
      twelfthBoard: map['twelfthBoard'] as String,
      twelfthMarks: map['twelfthMarks'] as String,
      twelfthState: map['twelfthState'] as String,
      twelfthCountry: map['twelfthCountry'] as String,
      twelfthYear: map['twelfthYear'] as String,
      diplomaInstitute: map['diplomaInstitute'] as String,
      diplomaUniversity: map['diplomaUniversity'] as String,
      diplomaBranch: map['diplomaBranch'] as String,
      diplomaMarks: map['diplomaMarks'] as String,
      diplomaState: map['diplomaState'] as String,
      diplomaCountry: map['diplomaCountry'] as String,
      diplomaYear: map['diplomaYear'] as String,
      collegeName: map['collegeName'] as String,
      collegeUniversity: map['collegeUniversity'] as String,
      collegeDegree: map['collegeDegree'] as String,
      collegeBranch: map['collegeBranch'] as String,
      collegeMarks: map['collegeMarks'] as String,
      univRollNo: map['univRollNo'] as String,
      standingArrear: map['standingArrear'] as String,
      historyArrear: map['historyArrear'] as String,
      collegeState: map['collegeState'] as String,
      collegeCountry: map['collegeCountry'] as String,
      collegeYear: map['collegeYear'] as String,
      resumeLink: map['resumeLink'] as String,
    );
  }
}
