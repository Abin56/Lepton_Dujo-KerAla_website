// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// To parse this JSON data, do
//

class ClassTeacherEventModel {
  String eventName;
  String eventDate;
  String eventDescription;
  String venue;
  String signedBy;
  String docid;
  ClassTeacherEventModel({
    required this.eventName,
    required this.eventDate,
    required this.eventDescription,
    required this.venue,
    required this.signedBy,
    required this.docid,
  });

  ClassTeacherEventModel copyWith({
    String? eventName,
    String? eventDate,
    String? eventDescription,
    String? venue,
    String? signedBy,
    String? docid,
  }) {
    return ClassTeacherEventModel(
      eventName: eventName ?? this.eventName,
      eventDate: eventDate ?? this.eventDate,
      eventDescription: eventDescription ?? this.eventDescription,
      venue: venue ?? this.venue,
      signedBy: signedBy ?? this.signedBy,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventName': eventName,
      'eventDate': eventDate,
      'eventDescription': eventDescription,
      'venue': venue,
      'signedBy': signedBy,
      'docid': docid,
    };
  }

  factory ClassTeacherEventModel.fromMap(Map<String, dynamic> map) {
    return ClassTeacherEventModel(
      eventName: map['eventName'] ?? "",
      eventDate: map['eventDate'] ?? "",
      eventDescription: map['eventDescription'] ?? "",
      venue: map['venue'] ?? "",
      signedBy: map['signedBy'] ?? "",
      docid: map['docid'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassTeacherEventModel.fromJson(String source) =>
      ClassTeacherEventModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassTeacherEventModel(eventName: $eventName, eventDate: $eventDate, eventDescription: $eventDescription, venue: $venue, signedBy: $signedBy, docid: $docid,)';
  }

  @override
  bool operator ==(covariant ClassTeacherEventModel other) {
    if (identical(this, other)) return true;

    return other.eventName == eventName &&
        other.eventDate == eventDate &&
        other.eventDescription == eventDescription &&
        other.venue == venue &&
        other.signedBy == signedBy &&
        other.docid == docid;
  }

  @override
  int get hashCode {
    return eventName.hashCode ^
        eventDate.hashCode ^
        eventDescription.hashCode ^
        venue.hashCode ^
        signedBy.hashCode ^
        docid.hashCode;
  }
}
