import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AttendanceSubjectModel {
  String date;
  String docid;
  String exTime;
  bool onSubmit;
  String period;
  String subject;
  AttendanceSubjectModel({
    required this.date,
    required this.docid,
    required this.exTime,
    required this.onSubmit,
    required this.period,
    required this.subject,
  });

  AttendanceSubjectModel copyWith({
    String? date,
    String? docid,
    String? exTime,
    bool? onSubmit,
    String? period,
    String? subject,
  }) {
    return AttendanceSubjectModel(
      date: date ?? this.date,
      docid: docid ?? this.docid,
      exTime: exTime ?? this.exTime,
      onSubmit: onSubmit ?? this.onSubmit,
      period: period ?? this.period,
      subject: subject ?? this.subject,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'docid': docid,
      'exTime': exTime,
      'onSubmit': onSubmit,
      'period': period,
      'subject': subject,
    };
  }

  factory AttendanceSubjectModel.fromMap(Map<String, dynamic> map) {
    return AttendanceSubjectModel(
      date: map['date'] as String,
      docid: map['docid'] as String,
      exTime: map['exTime'] as String,
      onSubmit: map['onSubmit'] as bool,
      period: map['period'] as String,
      subject: map['subject'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceSubjectModel.fromJson(String source) =>
      AttendanceSubjectModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendanceSubjectModel(date: $date, docid: $docid, exTime: $exTime, onSubmit: $onSubmit, period: $period, subject: $subject)';
  }

  @override
  bool operator ==(covariant AttendanceSubjectModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.docid == docid &&
        other.exTime == exTime &&
        other.onSubmit == onSubmit &&
        other.period == period &&
        other.subject == subject;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        docid.hashCode ^
        exTime.hashCode ^
        onSubmit.hashCode ^
        period.hashCode ^
        subject.hashCode;
  }
}
