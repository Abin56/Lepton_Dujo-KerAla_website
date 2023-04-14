//     final RecordedCourseAddModel = RecordedCourseAddModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names, avoid_print
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

RecordedCourseAddModel RecordedCourseAddModelFromJson(String str) =>
    RecordedCourseAddModel.fromJson(json.decode(str));

String RecordedCourseAddModelToJson(RecordedCourseAddModel data) =>
    json.encode(data.toJson());

class RecordedCourseAddModel {
  RecordedCourseAddModel({
    required this.courseTitle,
    required this.facultyName,
    required this.courseFee,
    required this.id,
    required this.duration,
    required this.courseID,
    required this.postedDate,
    required this.postedTime,
  });

  String facultyName;
  String courseFee;
  String courseTitle;
  String id;
  String duration;
  String courseID;
  String postedDate;
  String postedTime;

  factory RecordedCourseAddModel.fromJson(Map<String, dynamic> json) =>
      RecordedCourseAddModel(
        courseTitle: json["courseTitle"] ?? '',
        facultyName: json["facultyName"] ?? '',
        courseFee: json["courseFee"] ?? '',
        id: json["id"] ?? '',
        duration: json["duration"] ?? '',
        courseID: json["courseID"] ?? '',
        postedDate: json["postedDate"] ?? '',
        postedTime: json["postedTime"] ?? '',
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
      };
}

class RecordedCourseAddToFireBase {
  Future RecordedCourseController(
      RecordedCourseAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("RecordedCourselist").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) => Navigator.pop(context));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
