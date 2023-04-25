// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GuardianAddModel {
  String? guardianName;
  String? docid;
  String? uid;
  String? createdate;
  String? guardianPhoneNumber;
  String? guardianEmail;
  String? wStudent;
  String? houseName;
  String? place;
  String? state;
  String? pincode;
  String? guardianImage;
  String? gender;
  String? profileImageID;
  String? profileImageURL;
  GuardianAddModel({
    this.guardianName,
    this.docid,
    this.uid,
    this.createdate,
    this.guardianPhoneNumber,
    this.guardianEmail,
    this.wStudent,
    this.houseName,
    this.place,
    this.state,
    this.pincode,
    this.guardianImage,
    this.gender,
    this.profileImageID,
    this.profileImageURL,
  });

  GuardianAddModel copyWith({
    String? guardianName,
    String? docid,
    String? uid,
    String? createdate,
    String? guardianPhoneNumber,
    String? guardianEmail,
    String? wStudent,
    String? houseName,
    String? place,
    String? state,
    String? pincode,
    String? guardianImage,
    String? gender,
    String? profileImageID,
    String? profileImageURL,
  }) {
    return GuardianAddModel(
      guardianName: guardianName ?? this.guardianName,
      docid: docid ?? this.docid,
      uid: uid ?? this.uid,
      createdate: createdate ?? this.createdate,
      guardianPhoneNumber: guardianPhoneNumber ?? this.guardianPhoneNumber,
      guardianEmail: guardianEmail ?? this.guardianEmail,
      wStudent: wStudent ?? this.wStudent,
      houseName: houseName ?? this.houseName,
      place: place ?? this.place,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      guardianImage: guardianImage ?? this.guardianImage,
      gender: gender ?? this.gender,
      profileImageID: profileImageID ?? this.profileImageID,
      profileImageURL: profileImageURL ?? this.profileImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'guardianName': guardianName ?? "",
      'docid': docid ?? "",
      'uid': uid ?? "",
      'createdate': createdate ?? "",
      'guardianPhoneNumber': guardianPhoneNumber ?? "",
      'guardianEmail': guardianEmail ?? "",
      'wStudent': wStudent ?? "",
      'houseName': houseName ?? "",
      'place': place ?? "",
      'state': state ?? "",
      'pincode': pincode ?? "",
      'guardianImage': guardianImage ?? "",
      'gender': gender ?? "",
      'profileImageID': profileImageID ?? "",
      'profileImageURL': profileImageURL ?? "",
    };
  }

  factory GuardianAddModel.fromMap(Map<String, dynamic> map) {
    return GuardianAddModel(
      guardianName:
          map['guardianName'] != null ? map['guardianName'] as String : null,
      docid: map['docid'] != null ? map['docid'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      createdate:
          map['createdate'] != null ? map['createdate'] as String : null,
      guardianPhoneNumber: map['guardianPhoneNumber'] != null
          ? map['guardianPhoneNumber'] as String
          : null,
      guardianEmail:
          map['guardianEmail'] != null ? map['guardianEmail'] as String : null,
      wStudent: map['wStudent'] != null ? map['wStudent'] as String : null,
      houseName: map['houseName'] != null ? map['houseName'] as String : null,
      place: map['place'] != null ? map['place'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      guardianImage:
          map['guardianImage'] != null ? map['guardianImage'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      profileImageID: map['profileImageID'] != null
          ? map['profileImageID'] as String
          : null,
      profileImageURL: map['profileImageURL'] != null
          ? map['profileImageURL'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuardianAddModel.fromJson(String source) =>
      GuardianAddModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GuardianAddModel(guardianName: $guardianName, docid: $docid, uid: $uid, createdate: $createdate, guardianPhoneNumber: $guardianPhoneNumber, guardianEmail: $guardianEmail, wStudent: $wStudent, houseName: $houseName, place: $place, state: $state, pincode: $pincode, guardianImage: $guardianImage, gender: $gender, profileImageID: $profileImageID, profileImageURL: $profileImageURL)';
  }

  @override
  bool operator ==(covariant GuardianAddModel other) {
    if (identical(this, other)) return true;

    return other.guardianName == guardianName &&
        other.docid == docid &&
        other.uid == uid &&
        other.createdate == createdate &&
        other.guardianPhoneNumber == guardianPhoneNumber &&
        other.guardianEmail == guardianEmail &&
        other.wStudent == wStudent &&
        other.houseName == houseName &&
        other.place == place &&
        other.state == state &&
        other.pincode == pincode &&
        other.guardianImage == guardianImage &&
        other.gender == gender &&
        other.profileImageID == profileImageID &&
        other.profileImageURL == profileImageURL;
  }

  @override
  int get hashCode {
    return guardianName.hashCode ^
        docid.hashCode ^
        uid.hashCode ^
        createdate.hashCode ^
        guardianPhoneNumber.hashCode ^
        guardianEmail.hashCode ^
        wStudent.hashCode ^
        houseName.hashCode ^
        place.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        guardianImage.hashCode ^
        gender.hashCode ^
        profileImageID.hashCode ^
        profileImageURL.hashCode;
  }
}

class CreateGuardiansAddToFireBase {
  Future createSchoolController(
      GuardianAddModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Student_Guardian")
          .add(productModel.toMap())
          .then((value) {
        firebase
            .collection("SchoolListCollection")
            .doc(id)
            .collection("Student_Guardian")
            .doc(value.id)
            .update({"docid": value.id});
      }).then(
        (value) {
          return showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Message'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Successfully created'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
