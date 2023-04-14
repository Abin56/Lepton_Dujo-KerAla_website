// To parse this JSON data, do
//
//     final guardianDataModel = guardianDataModelFromJson(jsonString);

import 'dart:convert';

GuardianDataModel guardianDataModelFromJson(String str) =>
    GuardianDataModel.fromJson(json.decode(str));

String guardianDataModelToJson(GuardianDataModel data) =>
    json.encode(data.toJson());

class GuardianDataModel {
  GuardianDataModel({
    required this.gender,
    required this.guardianEmail,
    required this.guardianImage,
    required this.guardianName,
    required this.guardianPhoneNumber,
    required this.houseName,
    required this.id,
    required this.joinDate,
    required this.pincode,
    required this.place,
    required this.state,
    required this.wStudent,
  });

  String gender;
  String guardianEmail;
  String guardianImage;
  String guardianName;
  String guardianPhoneNumber;
  String houseName;
  String id;
  String joinDate;
  String pincode;
  String place;
  String state;
  String wStudent;

  factory GuardianDataModel.fromJson(Map<String, dynamic> json) =>
      GuardianDataModel(
        gender: json["gender"],
        guardianEmail: json["guardianEmail"],
        guardianImage: json["guardianImage"],
        guardianName: json["guardianName"],
        guardianPhoneNumber: json["guardianPhoneNumber"],
        houseName: json["houseName"],
        id: json["id"],
        joinDate: json["joinDate"],
        pincode: json["pincode"],
        place: json["place"],
        state: json["state"],
        wStudent: json["wStudent"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "guardianEmail": guardianEmail,
        "guardianImage": guardianImage,
        "guardianName": guardianName,
        "guardianPhoneNumber": guardianPhoneNumber,
        "houseName": houseName,
        "id": id,
        "joinDate": joinDate,
        "pincode": pincode,
        "place": place,
        "state": state,
        "wStudent": wStudent,
      };
}
