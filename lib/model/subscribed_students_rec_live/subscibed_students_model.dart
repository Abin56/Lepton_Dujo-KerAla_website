//     final GetRECandLIVECourseSubScribedUserModel = GetRECandLIVECourseSubScribedUserModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

GetRECandLIVECourseSubScribedUserModel GetRECandLIVECourseSubScribedUserModelFromJson(
        String str) =>
    GetRECandLIVECourseSubScribedUserModel.fromJson(json.decode(str));

String GetRECandLIVECourseSubScribedUserModelToJson(
        GetRECandLIVECourseSubScribedUserModel data) =>
    json.encode(data.toJson());

class GetRECandLIVECourseSubScribedUserModel {
  GetRECandLIVECourseSubScribedUserModel(
      {required this.useremail,
      required this.userName,
      required this.courseid,
      required this.uid,
      required this.courseName,
      required this.inVoiceNumber,
      required this.date,
      required this.time,
      required this.totalprice,
      required this.id,
      required this.joinDate});

  String userName;
  String courseid;
  String useremail;
  String uid;
  String courseName;
  dynamic inVoiceNumber;
  String date;
  String time;
  String totalprice;
  String id;
  String joinDate;

  factory GetRECandLIVECourseSubScribedUserModel.fromJson(
          Map<String, dynamic> json) =>
      GetRECandLIVECourseSubScribedUserModel(
        useremail: json["useremail"] ?? '',
        joinDate: json["joinDate"] ?? '',
        inVoiceNumber: json["inVoiceNumber"] ?? '',
        date: json["date"] ?? '',
        time: json["time"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
        totalprice: json["totalprice"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "inVoiceNumber": inVoiceNumber,
        "courseName": courseName,
        "date": date,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "time": time,
        "joinDate": joinDate,
        "totalprice": totalprice,
        "id": id,
      };
}

