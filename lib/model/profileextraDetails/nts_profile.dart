//     final AddExtraDetailsofTeacherModel = AddExtraDetailsofTeacherModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AddExtraDetailsofTeacherModel AddExtraDetailsofTeacherModelFromJson(
        String str) =>
    AddExtraDetailsofTeacherModel.fromJson(json.decode(str));

String AddExtraDetailsofTeacherModelToJson(
        AddExtraDetailsofTeacherModel data) =>
    json.encode(data.toJson());

class AddExtraDetailsofTeacherModel {
  AddExtraDetailsofTeacherModel({
    required this.id,
    required this.teacherName,
    required this.employeeID,
    required this.joinDate,
    required this.teacherPhNo,
    required this.teacherEmail,
    required this.houseName,
    required this.houseNumber,
    required this.place,
    required this.district,
    required this.state,
    required this.pincode,
    required this.bloodGroup,
    required this.teacherImage,
    required this.classIncharge,
  });

  // String id;
  String houseName;
  String houseNumber;
  String place;
  String district;
  String state;
  String pincode;
  String bloodGroup;
  String teacherImage;
  String teacherName;
  String id;
  String employeeID;
  String joinDate;
  String teacherPhNo;
  String teacherEmail;
  String classIncharge;

  factory AddExtraDetailsofTeacherModel.fromJson(Map<String, dynamic> json) =>
      AddExtraDetailsofTeacherModel(
        id: json["id"] ?? '',
        teacherName: json["teacherName"] ?? '',
        joinDate: json["joinDate"] ?? '',
        employeeID: json["employeeID"] ?? '',
        teacherPhNo: json["teacherPhNo"] ?? '',
        teacherEmail: json["teacherEmail"] ?? '',
        pincode: json["pincode"] ?? '',
        houseName: json["houseName"] ?? '',
        houseNumber: json["houseNumber"] ?? '',
        place: json["place"] ?? '',
        district: json["district"] ?? '',
        state: json["state"] ?? '',
        bloodGroup: json["bloodGroup"] ?? '',
        teacherImage: json["teacherImage"] ?? '',
        classIncharge: json["classIncharge"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teacherName": teacherName,
        "joinDate": joinDate,
        "teacherPhNo": teacherPhNo,
        "employeeID": employeeID,
        "teacherEmail": teacherEmail,
        "houseNumber": houseNumber,
        "houseName": houseName,
        "bloodGroup": bloodGroup,
        "place": place,
        "district": district,
        "state": pincode,
        "teacherImage": teacherImage,
        "classIncharge": classIncharge,
      };
}
