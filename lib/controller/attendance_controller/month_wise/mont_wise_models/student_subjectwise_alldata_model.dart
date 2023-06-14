import '../../../../model/student_attendance_model/student_attendance_model.dart';

class StudentSubjectModelAllData {
  String date;
  String docid;
  String subject;
  List<StudentAttendanceModel> present;

  StudentSubjectModelAllData({
    required this.date,
    required this.docid,
    required this.subject,
    required this.present,
  });

  factory StudentSubjectModelAllData.fromJson(Map<String, dynamic> json) =>
      StudentSubjectModelAllData(
        date: json["date"],
        docid: json["docid"],
        subject: json["subject"],
        present: List<StudentAttendanceModel>.from(json["present"] ?? []),
      );

  @override
  String toString() {
    return 'StudentSubjectModelAllData(date: $date, docid: $docid, subject: $subject, present: $present)';
  }

  @override
  bool operator ==(covariant StudentSubjectModelAllData other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.subject == subject;
  }

  @override
  int get hashCode {
    return docid.hashCode ^ subject.hashCode;
  }
}
