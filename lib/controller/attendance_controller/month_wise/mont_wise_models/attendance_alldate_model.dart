import 'package:flutter/foundation.dart';

import 'student_subjectwise_alldata_model.dart';

class AttendanceDateModelAllData {
  String dDate;
  String day;
  String docid;
  List<StudentSubjectModelAllData>? subjects;

  AttendanceDateModelAllData({
    required this.dDate,
    required this.day,
    required this.docid,
    this.subjects,
  });

  factory AttendanceDateModelAllData.fromJson(Map<String, dynamic> json) =>
      AttendanceDateModelAllData(
        dDate: json["dDate"] ?? "",
        day: json["day"] ?? "",
        docid: json["docid"] ?? "",
        subjects: List<StudentSubjectModelAllData>.from(json["subjects"] ?? []),
      );

  @override
  String toString() {
    return 'AttendanceDateModelAllData(dDate: $dDate, day: $day, docid: $docid, subjects: $subjects)';
  }

  @override
  bool operator ==(covariant AttendanceDateModelAllData other) {
    if (identical(this, other)) return true;

    return other.dDate == dDate &&
        other.day == day &&
        other.docid == docid &&
        listEquals(other.subjects, subjects);
  }

  @override
  int get hashCode {
    return dDate.hashCode ^ day.hashCode ^ docid.hashCode ^ subjects.hashCode;
  }
}
