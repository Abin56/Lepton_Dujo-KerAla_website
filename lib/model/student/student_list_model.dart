// To parse this JSON data, do
//
//     final studentData = studentDataFromJson(jsonString);

import 'dart:convert';

StudentData studentDataFromJson(String str) =>
    StudentData.fromJson(json.decode(str));

String studentDataToJson(StudentData data) => json.encode(data.toJson());

class StudentData {
  StudentData(
      {required this.address,
      required this.admissionNumber,
      required this.bloodGroup,
      required this.gurdianName,
      required this.id,
      required this.joinDate,
      required this.parentName,
      required this.parentPhNo,
      required this.rollNo,
      required this.studentClass,
      required this.studentImage,
      required this.studentName,
      required this.studentemailController,
      required this.wclass,
      required this.deactivate});

  String address;
  String admissionNumber;
  String bloodGroup;
  String gurdianName;
  String id;
  String joinDate;
  String parentName;
  String parentPhNo;
  String rollNo;
  String studentClass;
  String studentImage;
  String studentName;
  String studentemailController;
  String wclass;
  bool deactivate;

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
      address: json["address"] ?? "",
      admissionNumber: json["admissionNumber"] ?? "",
      bloodGroup: json["bloodGroup"] ?? "",
      gurdianName: json["gurdianName"] ?? "",
      id: json["id"] ?? "",
      joinDate: json["joinDate"] ?? "",
      parentName: json["parentName"] ?? "",
      parentPhNo: json["parentPhNo"] ?? "",
      rollNo: json["rollNo"] ?? "",
      studentClass: json["studentClass"] ?? "",
      studentImage: json["studentImage"] ?? "",
      studentName: json["studentName"] ?? "",
      studentemailController: json["studentemailController"] ?? "",
      wclass: json["wclass"] ?? "",
      deactivate: json["deactivate"] ?? "");

  Map<String, dynamic> toJson() => {
        "address": address,
        "admissionNumber": admissionNumber,
        "bloodGroup": bloodGroup,
        "gurdianName": gurdianName,
        "id": id,
        "joinDate": joinDate,
        "parentName": parentName,
        "parentPhNo": parentPhNo,
        "rollNo": rollNo,
        "studentClass": studentClass,
        "studentImage": studentImage,
        "studentName": studentName,
        "studentemailController": studentemailController,
        "wclass": wclass,
        "deactivate": deactivate
      };
}
