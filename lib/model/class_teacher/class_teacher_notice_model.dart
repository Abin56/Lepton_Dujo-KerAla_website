// To parse this JSON data, do
//
//     final classTeacherNoticeModel = classTeacherNoticeModelFromJson(jsonString);

import 'dart:convert';

ClassTeacherNoticeModel classTeacherNoticeModelFromJson(String str) =>
    ClassTeacherNoticeModel.fromJson(json.decode(str));

String classTeacherNoticeModelToJson(ClassTeacherNoticeModel data) =>
    json.encode(data.toJson());

class ClassTeacherNoticeModel {
  ClassTeacherNoticeModel({
    required this.heading,
    required this.topic,
    required this.content,
    required this.signedBy,
    required this.date,
    required this.noticeId,
  });

  String heading;
  String topic;
  String content;
  String signedBy;
  String date;
  String noticeId;

  factory ClassTeacherNoticeModel.fromJson(Map<String, dynamic> json) =>
      ClassTeacherNoticeModel(
        heading: json["heading"],
        topic: json["topic"],
        content: json["content"],
        signedBy: json["signedBy"],
        date: json["date"],
        noticeId: json["noticeId"],
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "topic": topic,
        "content": content,
        "signedBy": signedBy,
        "date": date,
        "noticeId": noticeId,
      };
}
