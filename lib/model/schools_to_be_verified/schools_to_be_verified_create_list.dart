// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SchoolsToBeVerified {
  String schoolName;
  String docid;
  String district;
  String place;
  String adminUserName;
  String password;
  String phoneNumber;
  String email;
  String postedDate;
  String schoolCode;
  String? batchYear;
  bool verified;
  SchoolsToBeVerified({
    required this.schoolName,
    required this.docid,
    required this.district,
    required this.place,
    required this.adminUserName,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.postedDate,
    required this.schoolCode,
    this.batchYear,
    required this.verified,
  });

  SchoolsToBeVerified copyWith({
    String? schoolName,
    String? docid,
    String? district,
    String? place,
    String? adminUserName,
    String? password,
    String? phoneNumber,
    String? email,
    String? postedDate,
    String? schoolCode,
    String? batchYear,
    bool? verified,
  }) {
    return SchoolsToBeVerified(
      schoolName: schoolName ?? this.schoolName,
      docid: docid ?? this.docid,
      district: district ?? this.district,
      place: place ?? this.place,
      adminUserName: adminUserName ?? this.adminUserName,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      postedDate: postedDate ?? this.postedDate,
      schoolCode: schoolCode ?? this.schoolCode,
      batchYear: batchYear ?? this.batchYear,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schoolName': schoolName,
      'docid': docid,
      'district': district,
      'place': place,
      'adminUserName': adminUserName,
      'password': password,
      'phoneNumber': phoneNumber,
      'email': email,
      'postedDate': postedDate,
      'schoolCode': schoolCode,
      'batchYear': batchYear??'',
      'verified': verified,
    };
  }

  factory SchoolsToBeVerified.fromMap(Map<String, dynamic> map) {
    return SchoolsToBeVerified(
      schoolName: map['schoolName'] as String,
      docid: map['docid'] as String,
      district: map['district'] as String,
      place: map['place'] as String,
      adminUserName: map['adminUserName'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      postedDate: map['postedDate'] as String,
      schoolCode: map['schoolCode'] as String,
      batchYear: map['batchYear'] != null ? map['batchYear'] as String : null,
      verified: map['verified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolsToBeVerified.fromJson(String source) => SchoolsToBeVerified.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SchoolsToBeVerified(schoolName: $schoolName, docid: $docid, district: $district, place: $place, adminUserName: $adminUserName, password: $password, phoneNumber: $phoneNumber, email: $email, postedDate: $postedDate, schoolCode: $schoolCode, batchYear: $batchYear, verified: $verified)';
  }

  @override
  bool operator ==(covariant SchoolsToBeVerified other) {
    if (identical(this, other)) return true;
  
    return 
      other.schoolName == schoolName &&
      other.docid == docid &&
      other.district == district &&
      other.place == place &&
      other.adminUserName == adminUserName &&
      other.password == password &&
      other.phoneNumber == phoneNumber &&
      other.email == email &&
      other.postedDate == postedDate &&
      other.schoolCode == schoolCode &&
      other.batchYear == batchYear &&
      other.verified == verified;
  }

  @override
  int get hashCode {
    return schoolName.hashCode ^
      docid.hashCode ^
      district.hashCode ^
      place.hashCode ^
      adminUserName.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      postedDate.hashCode ^
      schoolCode.hashCode ^
      batchYear.hashCode ^
      verified.hashCode;
  }
}


class AddRequestedSchoolsToFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRequestedSchools(
      SchoolsToBeVerified schoolModel, context) async {
    try {
      _firestore
          .collection('RequestedSchools')
          .doc(schoolModel.docid)
          .set(schoolModel.toMap())
          .then((value) {
        return showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Message'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text(
                        'Thank you for applying for an account. Your account is currently pending approval by the site administrator.In the meantime, a welcome message with further instructions has been sent to your e-mail address.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    html.window.location.reload();


                  },
                ),
              ],
            );
          },
        );
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error ${e.message.toString()}');
      }
    }
  }

  Future<bool> checkSchoolIsCreated(String schoolName, String place) async {
    final schoolListCollection =
        await _firestore.collection('SchoolListCollection').get();
    if (schoolListCollection.docs.isEmpty) {
      return false;
    }

    for (var element in schoolListCollection.docs) {
      if (element.data()["schoolName"] == schoolName &&
          element.data()["place"] == place) {
        return true;
      }
    }
    return false;
  }
}
