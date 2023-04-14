// To parse this JSON data, do
//
//     final adminNoticeModel = adminNoticeModelFromJson(jsonString);

import 'dart:convert';

ScholarshipModel ScholarshipModelFromJson(String str) =>
    ScholarshipModel.fromJson(json.decode(str));

String ScholarshipModelToJson(ScholarshipModel data) =>
    json.encode(data.toJson());

class ScholarshipModel {
  ScholarshipModel(
      {required this.photoUrl,
      required this.studentName,
      required this.admissionNumber,
      required this.scholarshipName,
      required this.date, 
      required this.description, 
      required this.document
  });

  String photoUrl;
  String studentName;
  String admissionNumber;
  String description;
  String scholarshipName;
  String date; 
  String document;

  factory ScholarshipModel.fromJson(Map<String, dynamic> json) =>
      ScholarshipModel(
          photoUrl: json["photoUrl"],
          studentName: json["studentName"],
          admissionNumber: json["admissionNumber"],
          description: json["description"],
          scholarshipName : json["scholarshipName"],
          date: json["date"],
          document: json["document"]
         );

  Map<String, dynamic> toJson() => {
        "photoUrl": photoUrl,
        "studentName": studentName,
        "admissionNumber": admissionNumber,
        "description": description,
        "scholarshipName": scholarshipName,
        "date" : date, 
        "document": document
      };
}
