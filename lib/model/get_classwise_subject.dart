//     final GetClassWiseSubjectModel = GetClassWiseSubjectModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

GetClassWiseSubjectModel GetClassWiseSubjectModelFromJson(String str) =>
    GetClassWiseSubjectModel.fromJson(json.decode(str));

String GetClassWiseSubjectModelToJson(GetClassWiseSubjectModel data) =>
    json.encode(data.toJson());

class GetClassWiseSubjectModel {
  GetClassWiseSubjectModel({
    required this.id,
    required this.subject,
    required this.classIncharge,
    required this.classID,
    required this.joinDate,
  });

  String subject;
  String classIncharge;
  String id;
  String classID;
  String joinDate;

  factory GetClassWiseSubjectModel.fromJson(Map<String, dynamic> json) =>
      GetClassWiseSubjectModel(
        id: json["id"] ?? '',
        subject: json["subject"] ?? '',
        classIncharge: json["classIncharge"] ?? '',
        joinDate: json["joinDate"] ?? '',
        classID: json["classID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "classIncharge": classIncharge,
        "classID": classID,
        "joinDate": joinDate,
      };
}