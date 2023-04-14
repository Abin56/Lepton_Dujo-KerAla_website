// To parse this JSON data, do
//
//     final parentDataModel = parentDataModelFromJson(jsonString);

import 'dart:convert';

ParentDataModel parentDataModelFromJson(String str) =>
    ParentDataModel.fromJson(json.decode(str));

String parentDataModelToJson(ParentDataModel data) =>
    json.encode(data.toJson());

class ParentDataModel {
  ParentDataModel({
    required this.fatherImage,
    required this.gender,
    required this.guardianName,
    required this.houseName,
    required this.joinDate,
    required this.nameofFather,
    required this.nameofMother,
    required this.parentEmail,
    required this.parentImage,
    required this.parentName,
    required this.parentPhoneNumber,
    required this.pincode,
    required this.place,
    required this.state,
    required this.wStudent,
  });

  String fatherImage;
  String gender;
  String guardianName;
  String houseName;
  String joinDate;
  String nameofFather;
  String nameofMother;
  String parentEmail;
  String parentImage;
  String parentName;
  String parentPhoneNumber;
  String pincode;
  String place;
  String state;
  String wStudent;

  factory ParentDataModel.fromJson(Map<String, dynamic> json) =>
      ParentDataModel(
        fatherImage: json["fatherImage"] ?? "",
        gender: json["gender"] ?? "",
        guardianName: json["guardianName"] ?? "",
        houseName: json["houseName"] ?? "",
        joinDate: json["joinDate"] ?? "",
        nameofFather: json["nameofFather"] ?? "",
        nameofMother: json["nameofMother"] ?? "",
        parentEmail: json["parentEmail"] ?? "",
        parentImage: json["parentImage"] ?? "",
        parentName: json["parentName"] ?? "",
        parentPhoneNumber: json["parentPhoneNumber"] ?? "",
        pincode: json["pincode"] ?? "",
        place: json["place"] ?? "",
        state: json["state"] ?? "",
        wStudent: json["wStudent"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "fatherImage": fatherImage,
        "gender": gender,
        "guardianName": guardianName,
        "houseName": houseName,
        "joinDate": joinDate,
        "nameofFather": nameofFather,
        "nameofMother": nameofMother,
        "parentEmail": parentEmail,
        "parentImage": parentImage,
        "parentName": parentName,
        "parentPhoneNumber": parentPhoneNumber,
        "pincode": pincode,
        "place": place,
        "state": state,
        "wStudent": wStudent,
      };
}
