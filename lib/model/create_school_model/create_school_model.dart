// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CreatedSchoolAddModel {
  String schoolName;
  String schoolID;
  String id;
  String district;
  String place;
  String adminUserName;
  String password;
  String postedDate;
  String email;
  String phoneNumber;
  CreatedSchoolAddModel({
    required this.schoolName,
    required this.schoolID,
    required this.id,
    required this.district,
    required this.place,
    required this.adminUserName,
    required this.password,
    required this.postedDate,
    required this.email,
    required this.phoneNumber,
  });

  CreatedSchoolAddModel copyWith({
    String? schoolName,
    String? schoolID,
    String? id,
    String? district,
    String? place,
    String? adminUserName,
    String? password,
    String? postedDate,
    String? email,
    String? phoneNumber,
  }) {
    return CreatedSchoolAddModel(
      schoolName: schoolName ?? this.schoolName,
      schoolID: schoolID ?? this.schoolID,
      id: id ?? this.id,
      district: district ?? this.district,
      place: place ?? this.place,
      adminUserName: adminUserName ?? this.adminUserName,
      password: password ?? this.password,
      postedDate: postedDate ?? this.postedDate,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolName': schoolName,
      'schoolID': schoolID,
      'id': id,
      'district': district,
      'place': place,
      'adminUserName': adminUserName,
      'password': password,
      'postedDate': postedDate,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory CreatedSchoolAddModel.fromMap(Map<String, dynamic> map) {
    return CreatedSchoolAddModel(
      schoolName: map['schoolName'] as String,
      schoolID: map['schoolID'] as String,
      id: map['id'] as String,
      district: map['district'] as String,
      place: map['place'] as String,
      adminUserName: map['adminUserName'] as String,
      password: map['password'] as String,
      postedDate: map['postedDate'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatedSchoolAddModel.fromJson(String source) =>
      CreatedSchoolAddModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreatedSchoolAddModel(schoolName: $schoolName, schoolID: $schoolID, id: $id, district: $district, place: $place, adminUserName: $adminUserName, password: $password, postedDate: $postedDate, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant CreatedSchoolAddModel other) {
    if (identical(this, other)) return true;

    return other.schoolName == schoolName &&
        other.schoolID == schoolID &&
        other.id == id &&
        other.district == district &&
        other.place == place &&
        other.adminUserName == adminUserName &&
        other.password == password &&
        other.postedDate == postedDate &&
        other.email == email &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return schoolName.hashCode ^
        schoolID.hashCode ^
        id.hashCode ^
        district.hashCode ^
        place.hashCode ^
        adminUserName.hashCode ^
        password.hashCode ^
        postedDate.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode;
  }
}

class CreateSchoolAddToFireBase {
  Future createSchoolController(
      CreatedSchoolAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(productModel.schoolID)
          .set(productModel.toMap());
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
