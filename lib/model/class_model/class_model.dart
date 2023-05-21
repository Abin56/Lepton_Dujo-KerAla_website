// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassModel {
  String className;
  String classTeacherName;
  String classTeacherdocid;
  String docid;
  ClassModel({
    required this.className,
    required this.classTeacherName,
    required this.classTeacherdocid,
    required this.docid,
  });

  ClassModel copyWith({
    String? className,
    String? classTeacherName,
    String? classTeacherdocid,
    String? docid,
  }) {
    return ClassModel(
      className: className ?? this.className,
      classTeacherName: classTeacherName ?? this.classTeacherName,
      classTeacherdocid: classTeacherdocid ?? this.classTeacherdocid,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'className': className,
      'classTeacherName': classTeacherName,
      'classTeacherdocid': classTeacherdocid,
      'docid': docid,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      className: map['className'] as String,
      classTeacherName: map['classTeacherName'] as String,
      classTeacherdocid: map['classTeacherdocid'] as String,
      docid: map['docid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassModel(className: $className, classTeacherName: $classTeacherName, classTeacherdocid: $classTeacherdocid, docid: $docid)';
  }

  @override
  bool operator ==(covariant ClassModel other) {
    if (identical(this, other)) return true;

    return other.className == className &&
        other.classTeacherName == classTeacherName &&
        other.classTeacherdocid == classTeacherdocid &&
        other.docid == docid;
  }

  @override
  int get hashCode {
    return className.hashCode ^
        classTeacherName.hashCode ^
        classTeacherdocid.hashCode ^
        docid.hashCode;
  }
}
