// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TempStudent {
  String studentName;
  String admissionNumber;
  String parentName;
  String classId;
  String createdDate;
  String docId;
  String phoneNumber;
  TempStudent({
    required this.studentName,
    required this.admissionNumber,
    required this.parentName,
    required this.classId,
    required this.createdDate,
    required this.docId,
    required this.phoneNumber,
  });

  TempStudent copyWith({
    String? studentName,
    String? admissionNumber,
    String? parentName,
    String? classId,
    String? createdDate,
    String? docId,
    String? phoneNumber,
  }) {
    return TempStudent(
      studentName: studentName ?? this.studentName,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      parentName: parentName ?? this.parentName,
      classId: classId ?? this.classId,
      createdDate: createdDate ?? this.createdDate,
      docId: docId ?? this.docId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentName': studentName,
      'admissionNumber': admissionNumber,
      'parentName': parentName,
      'classId': classId,
      'createdDate': createdDate,
      'docId': docId,
      'phoneNumber': phoneNumber,
    };
  }

  factory TempStudent.fromMap(Map<String, dynamic> map) {
    return TempStudent(
      studentName: map['studentName'] as String,
      admissionNumber: map['admissionNumber'] as String,
      parentName: map['parentName'] as String,
      classId: map['classId'] as String,
      createdDate: map['createdDate'] as String,
      docId: map['docId'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TempStudent.fromJson(String source) =>
      TempStudent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TempStudent(studentName: $studentName, admissionNumber: $admissionNumber, parentName: $parentName, classId: $classId, createdDate: $createdDate, docId: $docId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant TempStudent other) {
    if (identical(this, other)) return true;

    return other.studentName == studentName &&
        other.admissionNumber == admissionNumber &&
        other.parentName == parentName &&
        other.classId == classId &&
        other.createdDate == createdDate &&
        other.docId == docId &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return studentName.hashCode ^
        admissionNumber.hashCode ^
        parentName.hashCode ^
        classId.hashCode ^
        createdDate.hashCode ^
        docId.hashCode ^
        phoneNumber.hashCode;
  }
}
