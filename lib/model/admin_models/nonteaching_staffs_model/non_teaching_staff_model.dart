// To parse this JSON data, do
//
//     final adminNoticeModel = adminNoticeModelFromJson(jsonString);

import 'dart:convert';

NonTeachingStaffModel NonTeachingStaffModelFromJson(String str) =>
    NonTeachingStaffModel.fromJson(json.decode(str));

String NonTeachingStaffModelToJson(NonTeachingStaffModel data) =>
    json.encode(data.toJson());

class NonTeachingStaffModel {
  NonTeachingStaffModel(
      {required this.staffName,
      required this.designation,
      required this.employeeID,
      required this.houseName,
      required this.houseNumber,
      required this.streetName,
      required this.place,
      required this.district,
      required this.state,
      required this.pincode,
      required this.email,
      required this.phoneNumber,
  });

  String staffName;
  String employeeID;
  String designation;
  String houseName;
  String houseNumber;
  String streetName;
  String place;
  String district;
  String state;
  String pincode;
  String email;
  String phoneNumber;

  factory NonTeachingStaffModel.fromJson(Map<String, dynamic> json) =>
      NonTeachingStaffModel(
          staffName: json["staffName"],
          employeeID: json["employeeID"],
          designation: json["designation"],
          houseName: json["houseName"],
          houseNumber:json["houseNumber"],
          streetName: json["streetName"],
          place: json["place"],
          district: json["district"],
          state: json["state"],
          pincode: json["pincode"],
          email: json["email"],
          phoneNumber: json["phoneNumber"],
         );

  Map<String, dynamic> toJson() => {
        "staffName": staffName,
        "employeeID": employeeID,
        "designation": designation,
        "houseName": houseName,
        "houseNumber" :houseNumber,
        "streetName": streetName,
        "place": place,
        "district": district,
        "state": state,
        "pincode": pincode,
        "email": email,
        "phoneNumber": phoneNumber,
      
      };
}
