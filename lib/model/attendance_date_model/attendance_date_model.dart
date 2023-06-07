// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttendanceDateModel {
  String dDate;
  String day;
  String docid;
  AttendanceDateModel({
    required this.dDate,
    required this.day,
    required this.docid,
  });

  AttendanceDateModel copyWith({
    String? dDate,
    String? day,
    String? docid,
  }) {
    return AttendanceDateModel(
      dDate: dDate ?? this.dDate,
      day: day ?? this.day,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dDate': dDate,
      'day': day,
      'docid': docid,
    };
  }

  factory AttendanceDateModel.fromMap(Map<String, dynamic> map) {
    return AttendanceDateModel(
      dDate: map['dDate'] as String,
      day: map['day'] as String,
      docid: map['docid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceDateModel.fromJson(String source) => AttendanceDateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AttendanceDateModel(dDate: $dDate, day: $day, docid: $docid)';

  @override
  bool operator ==(covariant AttendanceDateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.dDate == dDate &&
      other.day == day &&
      other.docid == docid;
  }

  @override
  int get hashCode => dDate.hashCode ^ day.hashCode ^ docid.hashCode;
}
