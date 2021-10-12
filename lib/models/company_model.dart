class CompanyModel {
  String companyName;
  String ctc;
  String location;
  String dateOfDrive;
  String selectionProcess;
  String departments;
  String maximumStandingArrears;
  String historyOfArrears;
  String minimumPercentage;
  String applyBefore;
  String sheetsLink;
  String apiLink;

  CompanyModel({
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
  });
}
