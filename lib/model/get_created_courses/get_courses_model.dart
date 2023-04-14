//     final GetCreatedCourseAddModel = GetCreatedCourseAddModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

GetCreatedCourseAddModel GetCreatedCourseAddModelFromJson(String str) =>
    GetCreatedCourseAddModel.fromJson(json.decode(str));

String GetCreatedCourseAddModelToJson(GetCreatedCourseAddModel data) =>
    json.encode(data.toJson());

class GetCreatedCourseAddModel {
  GetCreatedCourseAddModel(
      {required this.courseTitle,
      required this.facultyName,
      required this.courseFee,
      required this.id,
      required this.duration,
      required this.courseID,
      required this.postedDate,
      required this.postedTime,
      required this.roomID,
      required this.password,
      required this.message});

  String facultyName;
  String courseFee;
  String courseTitle;
  String id;
  String duration;
  String courseID;
  String postedDate;
  String postedTime;
  String roomID;
  String password;
  String message;

  factory GetCreatedCourseAddModel.fromJson(Map<String, dynamic> json) =>
      GetCreatedCourseAddModel(
        courseTitle: json["courseTitle"] ?? '',
        facultyName: json["facultyName"] ?? '',
        courseFee: json["courseFee"] ?? '',
        id: json["id"] ?? '',
        duration: json["duration"] ?? '',
        courseID: json["courseID"] ?? '',
        postedDate: json["postedDate"] ?? '',
        postedTime: json["postedTime"] ?? '',
        roomID: json["roomID"] ?? '',
        password: json["password"] ?? '',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "courseTitle": courseTitle,
        "facultyName": facultyName,
        "courseFee": courseFee,
        "id": id,
        "duration": duration,
        "courseID": courseID,
        "postedDate": postedDate,
        "postedTime": postedTime,
        "roomID": roomID,
        "password": password,
        "message": message,
      };
}


