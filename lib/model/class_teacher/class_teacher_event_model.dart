// To parse this JSON data, do
//
//     final classTeacherEventModel = classTeacherEventModelFromJson(jsonString);

import 'dart:convert';

ClassTeacherEventModel classTeacherEventModelFromJson(String str) =>
    ClassTeacherEventModel.fromJson(json.decode(str));

String classTeacherEventModelToJson(ClassTeacherEventModel data) =>
    json.encode(data.toJson());

class ClassTeacherEventModel {
  ClassTeacherEventModel(
      {required this.eventId,
      required this.eventName,
      required this.eventDate,
      required this.description,
      required this.venue,
      required this.chiefGuest,
      required this.participants,
      required this.image,
      required this.imageUid});

  String eventId;
  String eventName;
  String eventDate;
  String description;
  String venue;
  String chiefGuest;
  String participants;
  String image;
  String imageUid;

  factory ClassTeacherEventModel.fromJson(Map<String, dynamic> json) =>
      ClassTeacherEventModel(
          eventId: json["eventId"] ?? '',
          eventName: json["eventName"] ?? '',
          eventDate: json["eventDate"] ?? '',
          description: json["description"] ?? '',
          venue: json["venue"] ?? '',
          chiefGuest: json["chiefGuest"] ?? '',
          participants: json["participants"] ?? '',
          image: json["image"] ?? '',
          imageUid: json["imageUid"]);

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "eventDate": eventDate,
        "description": description,
        "venue": venue,
        "chiefGuest": chiefGuest,
        "participants": participants,
        "image": image,
        "imageUid": imageUid
      };
}
