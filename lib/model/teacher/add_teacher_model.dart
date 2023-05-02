import 'dart:convert';

AddTeachersModel addTeachersModelFromJson(String str) =>
    AddTeachersModel.fromJson(json.decode(str));

String addTeachersModelToJson(AddTeachersModel data) =>
    json.encode(data.toJson());

class AddTeachersModel {
  AddTeachersModel({
    required this.docid,
    required this.teacherName,
    required this.employeeID,
    required this.createdAt,
    required this.teacherPhNo,
    required this.teacherEmail,
    this.userRole = 'teacher',
  });

  String teacherName;
  String docid;
  String employeeID;
  String createdAt;
  String teacherPhNo;
  String teacherEmail;
  String userRole;

  factory AddTeachersModel.fromJson(Map<String, dynamic> json) =>
      AddTeachersModel(
        docid: json["docid"] ?? '',
        teacherName: json["teacherName"] ?? '',
        createdAt: json["joinDate"] ?? '',
        employeeID: json["employeeID"] ?? '',
        teacherPhNo: json["teacherPhNo"] ?? '',
        teacherEmail: json["teacherEmail"] ?? '',
        userRole: json["userRole"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "docid": docid,
        "teacherName": teacherName,
        "joinDate": createdAt,
        "teacherPhNo": teacherPhNo,
        "employeeID": employeeID,
        "teacherEmail": teacherEmail,
        "userRole": userRole,
      };
}
