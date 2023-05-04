// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubjectModel {
  String subjectName;
  String docid;
  String? teacherId;
  String? teacherName;
  SubjectModel({
    required this.subjectName,
    required this.docid,
    this.teacherId,
    this.teacherName,
  });

  SubjectModel copyWith({
    String? subjectName,
    String? docid,
    String? teacherId,
    String? teacherName,
  }) {
    return SubjectModel(
      subjectName: subjectName ?? this.subjectName,
      docid: docid ?? this.docid,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectName': subjectName,
      'docid': docid,
      'teacherId': teacherId ?? '',
      'teacherName': teacherName ?? '',
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      subjectName: map['subjectName'] as String,
      docid: map['docid'] as String,
      teacherId: map['teacherId'] != null ? map['teacherId'] as String : null,
      teacherName:
          map['teacherName'] != null ? map['teacherName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubjectModel(subjectName: $subjectName, docid: $docid, teacherId: $teacherId, teacherName: $teacherName)';
  }

  @override
  bool operator ==(covariant SubjectModel other) {
    if (identical(this, other)) return true;

    return other.subjectName == subjectName &&
        other.docid == docid &&
        other.teacherId == teacherId &&
        other.teacherName == teacherName;
  }

  @override
  int get hashCode {
    return subjectName.hashCode ^
        docid.hashCode ^
        teacherId.hashCode ^
        teacherName.hashCode;
  }
}
