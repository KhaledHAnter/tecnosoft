import 'package:tecnosoft_task/Helper/governorates.dart';

class UserDetailsModel {
  String? dropDownValue;
  String hintText;
  List listItems;

  UserDetailsModel({
    this.dropDownValue,
    required this.listItems,
    required this.hintText,
  });
}

final List<UserDetailsModel> userDetailsData = [
  UserDetailsModel(listItems: ['Male', 'Female'], hintText: "Gender"),
  UserDetailsModel(listItems: [
    for (int i = 18; i <= 65; i++) i.toString(),
  ], hintText: "Age"),
  UserDetailsModel(listItems: [
    for (int i = 0; i < egyGovernoratesList.length; i++)
      egyGovernoratesList[i]['governorate_name_en'],
  ], hintText: "Governorate"),
  UserDetailsModel(
      listItems: [for (int i = 140; i <= 220; i++) "${i.toString()} Cm"],
      hintText: "Height"),
  UserDetailsModel(
      listItems: [for (int i = 40; i <= 120; i++) "${i.toString()} Kg"],
      hintText: "Weight"),
];
