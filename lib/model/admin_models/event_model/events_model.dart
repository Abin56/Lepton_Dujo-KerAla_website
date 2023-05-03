// To parse this JSON data, do
//
//     final adminNoticeModel = adminNoticeModelFromJson(jsonString);

import 'dart:convert';

EventModel EventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String AchievementModelToJson(EventModel data) =>
    json.encode(data.toJson());

class EventModel {
  EventModel(
      {required this.eventName,
      required this.eventDate,
      required this.eventDescription,
      required this.venue,
      required this.signedBy,
      required this.id
  });

  String eventName;
  String eventDate;
  String eventDescription;
  String venue;
  String signedBy;
  String id;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      EventModel(
          eventName: json["eventName"],
          eventDate: json["eventDate"],
          eventDescription: json["eventDescription"],
          venue: json["venue"],
          signedBy: json["signedBy"],
          id: json["id"]
         );

  Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "eventDate": eventDate,
        "eventDescription": eventDescription,
        "venue": venue,
        "signedBy": signedBy,
        "id" : id

        
      };
}
