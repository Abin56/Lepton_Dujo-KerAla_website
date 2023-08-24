// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TempStudent {
  String studentName;
  String admissionNumber;
  String parentName;
  String classID;
  String createDate;
  String docid;
  String parentPhoneNumber;
  TempStudent({
    required this.studentName,
    required this.admissionNumber,
    required this.parentName,
    required this.classID,
    required this.createDate,
    required this.docid,
    required this.parentPhoneNumber,
  });

  TempStudent copyWith({
    String? studentName,
    String? admissionNumber,
    String? parentName,
    String? classID,
    String? createDate,
    String? docid,
    String? parentPhoneNumber,
  }) {
    return TempStudent(
      studentName: studentName ?? this.studentName,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      parentName: parentName ?? this.parentName,
      classID: classID ?? this.classID,
      createDate: createDate ?? this.createDate,
      docid: docid ?? this.docid,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentName': studentName,
      'admissionNumber': admissionNumber,
      'parentName': parentName,
      'classID': classID,
      'createDate': createDate,
      'docid': docid,
      'parentPhoneNumber': parentPhoneNumber,
    };
  }

  factory TempStudent.fromMap(Map<String, dynamic> map) {
    return TempStudent(
      studentName: map['studentName'] as String,
      admissionNumber: map['admissionNumber'] as String,
      parentName: map['parentName'] as String,
      classID: map['classID'] as String,
      createDate: map['createDate'] as String,
      docid: map['docid'] as String,
      parentPhoneNumber: map['parentPhoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TempStudent.fromJson(String source) =>
      TempStudent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TempStudent(studentName: $studentName, admissionNumber: $admissionNumber, parentName: $parentName, classID: $classID, createDate: $createDate, docid: $docid, parentPhoneNumber: $parentPhoneNumber)';
  }

  @override
  bool operator ==(covariant TempStudent other) {
    if (identical(this, other)) return true;

    return other.studentName == studentName &&
        other.admissionNumber == admissionNumber &&
        other.parentName == parentName &&
        other.classID == classID &&
        other.createDate == createDate &&
        other.docid == docid &&
        other.parentPhoneNumber == parentPhoneNumber;
  }

  @override
  int get hashCode {
    return studentName.hashCode ^
        admissionNumber.hashCode ^
        parentName.hashCode ^
        classID.hashCode ^
        createDate.hashCode ^
        docid.hashCode ^
        parentPhoneNumber.hashCode;
  }
}
