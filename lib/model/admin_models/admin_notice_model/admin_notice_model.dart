// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminNoticeModel {
  String? publishedDate;
  String? heading;
  String? dateofoccation;
  String? venue;
  String? chiefGuest;
  String? dateOfSubmission;
  String? signedBy;
  String? imageUrl;
  String? signedImageUrl;
  String? noticeId;
  String? customContent;
  String? subject;
  bool? visibleTeacher;
  bool? visibleStudent;
  bool? visibleGuardian;
  AdminNoticeModel({
    this.publishedDate,
    this.heading,
    this.dateofoccation,
    this.venue,
    this.chiefGuest,
    this.dateOfSubmission,
    this.signedBy,
    this.imageUrl,
    this.signedImageUrl,
    this.noticeId,
    this.customContent,
    this.subject,
    this.visibleTeacher,
    this.visibleStudent,
    this.visibleGuardian,
  });

  AdminNoticeModel copyWith({
    String? publishedDate,
    String? heading,
    String? dateofoccation,
    String? venue,
    String? chiefGuest,
    String? dateOfSubmission,
    String? signedBy,
    String? imageUrl,
    String? signedImageUrl,
    String? noticeId,
    String? customContent,
    String? subject,
    bool? visibleTeacher,
    bool? visibleStudent,
    bool? visibleGuardian,
  }) {
    return AdminNoticeModel(
      publishedDate: publishedDate ?? this.publishedDate,
      heading: heading ?? this.heading,
      dateofoccation: dateofoccation ?? this.dateofoccation,
      venue: venue ?? this.venue,
      chiefGuest: chiefGuest ?? this.chiefGuest,
      dateOfSubmission: dateOfSubmission ?? this.dateOfSubmission,
      signedBy: signedBy ?? this.signedBy,
      imageUrl: imageUrl ?? this.imageUrl,
      signedImageUrl: signedImageUrl ?? this.signedImageUrl,
      noticeId: noticeId ?? this.noticeId,
      customContent: customContent ?? this.customContent,
      subject: subject ?? this.subject,
      visibleTeacher: visibleTeacher ?? this.visibleTeacher,
      visibleStudent: visibleStudent ?? this.visibleStudent,
      visibleGuardian: visibleGuardian ?? this.visibleGuardian,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'publishedDate': publishedDate,
      'heading': heading,
      'dateofoccation': dateofoccation,
      'venue': venue,
      'chiefGuest': chiefGuest,
      'dateOfSubmission': dateOfSubmission,
      'signedBy': signedBy,
      'imageUrl': imageUrl,
      'signedImageUrl': signedImageUrl,
      'noticeId': noticeId,
      'customContent': customContent,
      'subject': subject,
      'visibleTeacher': visibleTeacher,
      'visibleStudent': visibleStudent,
      'visibleGuardian': visibleGuardian,
    };
  }

  factory AdminNoticeModel.fromMap(Map<String, dynamic> map) {
    return AdminNoticeModel(
      publishedDate:
          map['publishedDate'] != null ? map['publishedDate'] as String : null,
      heading: map['heading'] != null ? map['heading'] as String : null,
      dateofoccation: map['dateofoccation'] != null
          ? map['dateofoccation'] as String
          : null,
      venue: map['venue'] != null ? map['venue'] as String : null,
      chiefGuest:
          map['chiefGuest'] != null ? map['chiefGuest'] as String : null,
      dateOfSubmission: map['dateOfSubmission'] != null
          ? map['dateOfSubmission'] as String
          : null,
      signedBy: map['signedBy'] != null ? map['signedBy'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      signedImageUrl: map['signedImageUrl'] != null
          ? map['signedImageUrl'] as String
          : null,
      noticeId: map['noticeId'] != null ? map['noticeId'] as String : null,
      customContent:
          map['customContent'] != null ? map['customContent'] as String : null,
      subject: map['subject'] != null ? map['subject'] as String : null,
      visibleTeacher:
          map['visibleTeacher'] != null ? map['visibleTeacher'] as bool : null,
      visibleStudent:
          map['visibleStudent'] != null ? map['visibleStudent'] as bool : null,
      visibleGuardian: map['visibleGuardian'] != null
          ? map['visibleGuardian'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminNoticeModel.fromJson(String source) =>
      AdminNoticeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminNoticeModel(publishedDate: $publishedDate, heading: $heading, dateofoccation: $dateofoccation, venue: $venue, chiefGuest: $chiefGuest, dateOfSubmission: $dateOfSubmission, signedBy: $signedBy, imageUrl: $imageUrl, signedImageUrl: $signedImageUrl, noticeId: $noticeId, customContent: $customContent, subject: $subject, visibleTeacher: $visibleTeacher, visibleStudent: $visibleStudent, visibleGuardian: $visibleGuardian)';
  }

  @override
  bool operator ==(covariant AdminNoticeModel other) {
    if (identical(this, other)) return true;

    return other.publishedDate == publishedDate &&
        other.heading == heading &&
        other.dateofoccation == dateofoccation &&
        other.venue == venue &&
        other.chiefGuest == chiefGuest &&
        other.dateOfSubmission == dateOfSubmission &&
        other.signedBy == signedBy &&
        other.imageUrl == imageUrl &&
        other.signedImageUrl == signedImageUrl &&
        other.noticeId == noticeId &&
        other.customContent == customContent &&
        other.subject == subject &&
        other.visibleTeacher == visibleTeacher &&
        other.visibleStudent == visibleStudent &&
        other.visibleGuardian == visibleGuardian;
  }

  @override
  int get hashCode {
    return publishedDate.hashCode ^
        heading.hashCode ^
        dateofoccation.hashCode ^
        venue.hashCode ^
        chiefGuest.hashCode ^
        dateOfSubmission.hashCode ^
        signedBy.hashCode ^
        imageUrl.hashCode ^
        signedImageUrl.hashCode ^
        noticeId.hashCode ^
        customContent.hashCode ^
        subject.hashCode ^
        visibleTeacher.hashCode ^
        visibleStudent.hashCode ^
        visibleGuardian.hashCode;
  }
}
