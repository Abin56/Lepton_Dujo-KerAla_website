// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolClassesModel {
  String docid;
  String className;
  String? classTeacherdocid;
  String? classTeacherName;
  SchoolClassesModel({
    required this.docid,
    required this.className,
    this.classTeacherdocid,
    this.classTeacherName,
  });

  SchoolClassesModel copyWith({
    String? docid,
    String? className,
    String? classTeacherdocid,
    String? classTeacherName,
  }) {
    return SchoolClassesModel(
      docid: docid ?? this.docid,
      className: className ?? this.className,
      classTeacherdocid: classTeacherdocid ?? this.classTeacherdocid,
      classTeacherName: classTeacherName ?? this.classTeacherName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'className': className,
      'classTeacherdocid': classTeacherdocid ?? '',
      'classTeacherName': classTeacherName ?? '',
    };
  }

  factory SchoolClassesModel.fromMap(Map<String, dynamic> map) {
    return SchoolClassesModel(
      docid: map['docid'] as String,
      className: map['className'] as String,
      classTeacherdocid: map['classTeacherdocid'] != null
          ? map['classTeacherdocid'] as String
          : null,
      classTeacherName: map['classTeacherName'] != null
          ? map['classTeacherName'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolClassesModel.fromJson(String source) =>
      SchoolClassesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SchoolClassesModel(docid: $docid, className: $className, classTeacherdocid: $classTeacherdocid, classTeacherName: $classTeacherName)';
  }

  @override
  bool operator ==(covariant SchoolClassesModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid &&
        other.className == className &&
        other.classTeacherdocid == classTeacherdocid &&
        other.classTeacherName == classTeacherName;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
        className.hashCode ^
        classTeacherdocid.hashCode ^
        classTeacherName.hashCode;
  }
}
