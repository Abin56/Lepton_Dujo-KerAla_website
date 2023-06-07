// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentAttendanceModel {
  String Date;
  String present;
  String studentName;
  String uid;
  StudentAttendanceModel({
    required this.Date,
    required this.present,
    required this.studentName,
    required this.uid,
  });

  StudentAttendanceModel copyWith({
    String? Date,
    String? present,
    String? studentName,
    String? uid,
  }) {
    return StudentAttendanceModel(
      Date: Date ?? this.Date,
      present: present ?? this.present,
      studentName: studentName ?? this.studentName,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Date': Date,
      'present': present,
      'studentName': studentName,
      'uid': uid,
    };
  }

  factory StudentAttendanceModel.fromMap(Map<String, dynamic> map) {
    return StudentAttendanceModel(
      Date: map['Date'] as String,
      present: map['present'] as String,
      studentName: map['studentName'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentAttendanceModel.fromJson(String source) => StudentAttendanceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentAttendanceModel(Date: $Date, present: $present, studentName: $studentName, uid: $uid)';
  }

  @override
  bool operator ==(covariant StudentAttendanceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.Date == Date &&
      other.present == present &&
      other.studentName == studentName &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return Date.hashCode ^
      present.hashCode ^
      studentName.hashCode ^
      uid.hashCode;
  }
}
