// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttendanceSubjectModel {
  String date;
  String docid;
  String subject;
  AttendanceSubjectModel({
    required this.date,
    required this.docid,
    required this.subject,
  });

  AttendanceSubjectModel copyWith({
    String? date,
    String? docid,
    String? subject,
  }) {
    return AttendanceSubjectModel(
      date: date ?? this.date,
      docid: docid ?? this.docid,
      subject: subject ?? this.subject,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'docid': docid,
      'subject': subject,
    };
  }

  factory AttendanceSubjectModel.fromMap(Map<String, dynamic> map) {
    return AttendanceSubjectModel(
      date: map['date'] as String,
      docid: map['docid'] as String,
      subject: map['subject'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceSubjectModel.fromJson(String source) =>
      AttendanceSubjectModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AttendanceSubjectModel(date: $date, docid: $docid, subject: $subject)';

  @override
  bool operator ==(covariant AttendanceSubjectModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.docid == docid &&
        other.subject == subject;
  }

  @override
  int get hashCode => date.hashCode ^ docid.hashCode ^ subject.hashCode;
}
