// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddExamModel {
  String docid;
  String examName;
  String examLevel;
  String startingDate;
  String endDate;
  String publishDate;
  AddExamModel({
    required this.docid,
    required this.examName,
    required this.examLevel,
    required this.startingDate,
    required this.endDate,
    required this.publishDate,
  });
  

  AddExamModel copyWith({
    String? docid,
    String? examName,
    String? examLevel,
    String? startingDate,
    String? endDate,
    String? publishDate,
  }) {
    return AddExamModel(
      docid: docid ?? this.docid,
      examName: examName ?? this.examName,
      examLevel: examLevel ?? this.examLevel,
      startingDate: startingDate ?? this.startingDate,
      endDate: endDate ?? this.endDate,
      publishDate: publishDate ?? this.publishDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'examName': examName,
      'examLevel': examLevel,
      'startingDate': startingDate,
      'endDate': endDate,
      'publishDate': publishDate,
    };
  }

  factory AddExamModel.fromMap(Map<String, dynamic> map) {
    return AddExamModel(
      docid: map['docid'] as String,
      examName: map['examName'] as String,
      examLevel: map['examLevel'] as String,
      startingDate: map['startingDate'] as String,
      endDate: map['endDate'] as String,
      publishDate: map['publishDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddExamModel.fromJson(String source) => AddExamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddExamModel(docid: $docid, examName: $examName, examLevel: $examLevel, startingDate: $startingDate, endDate: $endDate, publishDate: $publishDate)';
  }

  @override
  bool operator ==(covariant AddExamModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.examName == examName &&
      other.examLevel == examLevel &&
      other.startingDate == startingDate &&
      other.endDate == endDate &&
      other.publishDate == publishDate;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      examName.hashCode ^
      examLevel.hashCode ^
      startingDate.hashCode ^
      endDate.hashCode ^
      publishDate.hashCode;
  }
}
