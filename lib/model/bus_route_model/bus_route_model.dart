// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BusRouteModel {
  String docId;
  String routeNumber;
  String busNumber;
  String driveMobNum;
  String assistantMobNum;
  String staffInCharge;
  BusRouteModel({
    required this.docId,
    required this.routeNumber,
    required this.busNumber,
    required this.driveMobNum,
    required this.assistantMobNum,
    required this.staffInCharge,
  });

  BusRouteModel copyWith({
    String? docId,
    String? routeNumber,
    String? busNumber,
    String? driveMobNum,
    String? assistantMobNum,
    String? staffInCharge,
  }) {
    return BusRouteModel(
      docId: docId ?? this.docId,
      routeNumber: routeNumber ?? this.routeNumber,
      busNumber: busNumber ?? this.busNumber,
      driveMobNum: driveMobNum ?? this.driveMobNum,
      assistantMobNum: assistantMobNum ?? this.assistantMobNum,
      staffInCharge: staffInCharge ?? this.staffInCharge,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'routeNumber': routeNumber,
      'busNumber': busNumber,
      'driveMobNum': driveMobNum,
      'assistantMobNum': assistantMobNum,
      'staffInCharge': staffInCharge,
    };
  }

  factory BusRouteModel.fromMap(Map<String, dynamic> map) {
    return BusRouteModel(
      docId: map['docId'] as String,
      routeNumber: map['routeNumber'] as String,
      busNumber: map['busNumber'] as String,
      driveMobNum: map['driveMobNum'] as String,
      assistantMobNum: map['assistantMobNum'] as String,
      staffInCharge: map['staffInCharge'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusRouteModel.fromJson(String source) =>
      BusRouteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusRouteModel(docId: $docId, routeNumber: $routeNumber, busNumber: $busNumber, driveMobNum: $driveMobNum, assistantMobNum: $assistantMobNum, staffInCharge: $staffInCharge)';
  }

  @override
  bool operator ==(covariant BusRouteModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.routeNumber == routeNumber &&
        other.busNumber == busNumber &&
        other.driveMobNum == driveMobNum &&
        other.assistantMobNum == assistantMobNum &&
        other.staffInCharge == staffInCharge;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        routeNumber.hashCode ^
        busNumber.hashCode ^
        driveMobNum.hashCode ^
        assistantMobNum.hashCode ^
        staffInCharge.hashCode;
  }
}
