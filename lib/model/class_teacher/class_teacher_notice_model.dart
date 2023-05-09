// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassTeacherNoticeModel {
  String heading;
  String topic;
  String content;
  String signedBy;
  String date;
  String docid;
  ClassTeacherNoticeModel({
    required this.heading,
    required this.topic,
    required this.content,
    required this.signedBy,
    required this.date,
    required this.docid,
  });

  ClassTeacherNoticeModel copyWith({
    String? heading,
    String? topic,
    String? content,
    String? signedBy,
    String? date,
    String? docid,
  }) {
    return ClassTeacherNoticeModel(
      heading: heading ?? this.heading,
      topic: topic ?? this.topic,
      content: content ?? this.content,
      signedBy: signedBy ?? this.signedBy,
      date: date ?? this.date,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'heading': heading,
      'topic': topic,
      'content': content,
      'signedBy': signedBy,
      'date': date,
      'docid': docid,
    };
  }

  factory ClassTeacherNoticeModel.fromMap(Map<String, dynamic> map) {
    return ClassTeacherNoticeModel(
      heading: map['heading'] ?? "",
      topic: map['topic'] ?? "",
      content: map['content'] ?? "",
      signedBy: map['signedBy'] ?? "",
      date: map['date'] ?? "",
      docid: map['docid'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassTeacherNoticeModel.fromJson(String source) =>
      ClassTeacherNoticeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassTeacherNoticeModel(heading: $heading, topic: $topic, content: $content, signedBy: $signedBy, date: $date, docid: $docid)';
  }

  @override
  bool operator ==(covariant ClassTeacherNoticeModel other) {
    if (identical(this, other)) return true;

    return other.heading == heading &&
        other.topic == topic &&
        other.content == content &&
        other.signedBy == signedBy &&
        other.date == date &&
        other.docid == docid;
  }

  @override
  int get hashCode {
    return heading.hashCode ^
        topic.hashCode ^
        content.hashCode ^
        signedBy.hashCode ^
        date.hashCode ^
        docid.hashCode;
  }
}
