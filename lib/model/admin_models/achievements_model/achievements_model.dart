// To parse this JSON data, do
//
//     final adminNoticeModel = adminNoticeModelFromJson(jsonString);

import 'dart:convert';

AchievementModel AchievementModelFromJson(String str) =>
    AchievementModel.fromJson(json.decode(str));

String AchievementModelToJson(AchievementModel data) =>
    json.encode(data.toJson());

class AchievementModel {
  AchievementModel(
      {required this.photoUrl,
      required this.studentName,
      required this.dateofAchievement,
      required this.description,
      required this.achievement,
      required this.admissionNumber, 
      required this.uid,
      required this.studentID
  });

  String photoUrl;
  String studentName;
  String dateofAchievement;
  String description;
  String achievement;
  String admissionNumber; 
  String uid;
  String studentID;

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      AchievementModel(
          photoUrl: json["photoUrl"],
          studentName: json["studentName"],
          dateofAchievement: json["dateofAchievement"],
          description: json["description"],
          achievement: json["achievement"],
          admissionNumber: json["admissionNumber"], 
          uid: json["uid"],
          studentID: json["studentID"],
          
         );

  Map<String, dynamic> toJson() => {
        "photoUrl": photoUrl,
        "studentName": studentName,
        "dateofAchievement": dateofAchievement,
        "description": description,
        "achievement": achievement,
        "admissionNumber" : admissionNumber, 
        "uid":uid,
        "studentID": studentID
      };
}
