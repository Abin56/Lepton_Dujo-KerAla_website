// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// To parse this JSON data, do
//
//     final classTeacherEventModel = classTeacherEventModelFromJson(jsonString);

class ClassTeacherEventModel {
  String eventId;
  String eventName;
  String eventDate;
  String description;
  String venue;
  String chiefGuest;
  String participants;
  String imageUrl;
  String imageUid;
  ClassTeacherEventModel({
    required this.eventId,
    required this.eventName,
    required this.eventDate,
    required this.description,
    required this.venue,
    required this.chiefGuest,
    required this.participants,
    required this.imageUrl,
    required this.imageUid,
  });

  ClassTeacherEventModel copyWith({
    String? eventId,
    String? eventName,
    String? eventDate,
    String? description,
    String? venue,
    String? chiefGuest,
    String? participants,
    String? imageUrl,
    String? imageUid,
  }) {
    return ClassTeacherEventModel(
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
      eventDate: eventDate ?? this.eventDate,
      description: description ?? this.description,
      venue: venue ?? this.venue,
      chiefGuest: chiefGuest ?? this.chiefGuest,
      participants: participants ?? this.participants,
      imageUrl: imageUrl ?? this.imageUrl,
      imageUid: imageUid ?? this.imageUid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventId': eventId,
      'eventName': eventName,
      'eventDate': eventDate,
      'description': description,
      'venue': venue,
      'chiefGuest': chiefGuest,
      'participants': participants,
      'imageUrl': imageUrl,
      'imageUid': imageUid,
    };
  }

  factory ClassTeacherEventModel.fromMap(Map<String, dynamic> map) {
    return ClassTeacherEventModel(
      eventId: map['eventId'] ?? "",
      eventName: map['eventName'] ?? "",
      eventDate: map['eventDate'] ?? "",
      description: map['description'] ?? "",
      venue: map['venue'] ?? "",
      chiefGuest: map['chiefGuest'] ?? "",
      participants: map['participants'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      imageUid: map['imageUid'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassTeacherEventModel.fromJson(String source) =>
      ClassTeacherEventModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassTeacherEventModel(eventId: $eventId, eventName: $eventName, eventDate: $eventDate, description: $description, venue: $venue, chiefGuest: $chiefGuest, participants: $participants, imageUrl: $imageUrl, imageUid: $imageUid)';
  }

  @override
  bool operator ==(covariant ClassTeacherEventModel other) {
    if (identical(this, other)) return true;

    return other.eventId == eventId &&
        other.eventName == eventName &&
        other.eventDate == eventDate &&
        other.description == description &&
        other.venue == venue &&
        other.chiefGuest == chiefGuest &&
        other.participants == participants &&
        other.imageUrl == imageUrl &&
        other.imageUid == imageUid;
  }

  @override
  int get hashCode {
    return eventId.hashCode ^
        eventName.hashCode ^
        eventDate.hashCode ^
        description.hashCode ^
        venue.hashCode ^
        chiefGuest.hashCode ^
        participants.hashCode ^
        imageUrl.hashCode ^
        imageUid.hashCode;
  }
}
