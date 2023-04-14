// To parse this JSON data, do
//
//     final adminNoticeModel = adminNoticeModelFromJson(jsonString);

import 'dart:convert';

AdminNoticeModel adminNoticeModelFromJson(String str) =>
    AdminNoticeModel.fromJson(json.decode(str));

String adminNoticeModelToJson(AdminNoticeModel data) =>
    json.encode(data.toJson());

class AdminNoticeModel {
  AdminNoticeModel(
      {required this.publishedDate,
      required this.heading,
      required this.dateofoccation,
      required this.venue,
      required this.chiefGuest,
      required this.dateOfSubmission,
      required this.signedBy,
      required this.imageUrl,
      required this.signedImageUrl,
      required this.imageId,
      required this.signedImageId,
      required this.noticeId,
      required this.customContent,
      required this.visibleGuardian,
      required this.visibleStudent,
      required this.visibleTeacher});

  String publishedDate;
  String heading;
  String dateofoccation;
  String venue;
  String chiefGuest;
  String dateOfSubmission;
  String signedBy;
  String imageUrl;
  String signedImageUrl;
  String imageId;
  String signedImageId;
  String noticeId;
  String customContent;
  bool visibleTeacher;
  bool visibleStudent;
  bool visibleGuardian;

  factory AdminNoticeModel.fromJson(Map<String, dynamic> json) =>
      AdminNoticeModel(
          publishedDate: json["publishedDate"],
          heading: json["heading"],
          dateofoccation: json["dateofoccation"],
          venue: json["venue"],
          chiefGuest: json["chiefGuest"],
          dateOfSubmission: json["dateOfSubmission"],
          signedBy: json["signedBy"],
          imageUrl: json["imageUrl"],
          signedImageUrl: json["signedImageUrl"],
          imageId: json["imageId"],
          signedImageId: json["signedImageId"],
          noticeId: json["noticeId"],
          customContent: json["customContent"],
          visibleGuardian: json["visibleGuardian"],
          visibleStudent: json["visibleStudent"],
          visibleTeacher: json["visibleTeacher"]);

  Map<String, dynamic> toJson() => {
        "publishedDate": publishedDate,
        "heading": heading,
        "dateofoccation": dateofoccation,
        "venue": venue,
        "chiefGuest": chiefGuest,
        "dateOfSubmission": dateOfSubmission,
        "signedBy": signedBy,
        "imageUrl": imageUrl,
        "signedImageUrl": signedImageUrl,
        "imageId": imageId,
        "signedImageId": signedImageId,
        "noticeId": noticeId,
        "customContent": customContent,
        "visibleGuardian": visibleGuardian,
        "visibleStudent": visibleStudent,
        "visibleTeacher": visibleTeacher
      };
}
