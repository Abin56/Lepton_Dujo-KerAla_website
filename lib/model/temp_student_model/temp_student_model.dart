// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TempStudent {
  String studentName;
  String admissionNumber;
  String parentName;
  String classid;
  String createdDate;
  String docid;
  String parentPhoneNumber;
  TempStudent({
    required this.studentName,
    required this.admissionNumber,
    required this.parentName,
    required this.classid,
    required this.createdDate,
    required this.docid,
    required this.parentPhoneNumber,
  });

  TempStudent copyWith({
    String? studentName,
    String? admissionNumber,
    String? parentName,
    String? classid,
    String? createdDate,
    String? docid,
    String? parentPhoneNumber,
  }) {
    return TempStudent(
      studentName: studentName ?? this.studentName,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      parentName: parentName ?? this.parentName,
      classid: classid ?? this.classid,
      createdDate: createdDate ?? this.createdDate,
      docid: docid ?? this.docid,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentName': studentName,
      'admissionNumber': admissionNumber,
      'parentName': parentName,
      'classid': classid,
      'createdDate': createdDate,
      'docid': docid,
      'parentPhoneNumber': parentPhoneNumber,
    };
  }

  factory TempStudent.fromMap(Map<String, dynamic> map) {
    return TempStudent(
      studentName: map['studentName'] as String,
      admissionNumber: map['admissionNumber'] as String,
      parentName: map['parentName'] as String,
      classid: map['classid'] as String,
      createdDate: map['createdDate'] as String,
      docid: map['docid'] as String,
      parentPhoneNumber: map['parentPhoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TempStudent.fromJson(String source) =>
      TempStudent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TempStudent(studentName: $studentName, admissionNumber: $admissionNumber, parentName: $parentName, classid: $classid, createdDate: $createdDate, docid: $docid, parentPhoneNumber: $parentPhoneNumber)';
  }

  @override
  bool operator ==(covariant TempStudent other) {
    if (identical(this, other)) return true;
  
    return 
      other.studentName == studentName &&
      other.admissionNumber == admissionNumber &&
      other.parentName == parentName &&
      other.classid == classid &&
      other.createdDate == createdDate &&
      other.docid == docid &&
      other.parentPhoneNumber == parentPhoneNumber;
  }

  @override
  int get hashCode {
    return studentName.hashCode ^
      admissionNumber.hashCode ^
      parentName.hashCode ^
      classid.hashCode ^
      createdDate.hashCode ^
      docid.hashCode ^
      parentPhoneNumber.hashCode;
  }
}
