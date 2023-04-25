// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParentModel {
  String? parentName;
  String? docid;
  String? uid;
  String? createdate;
  String? parentPhoneNumber;
  String? parentEmail;
  String? wStudent;
  String? houseName;
  String? place;
  String? state;
  String? pincode;
  String? parentImage;
  String? gender;
  String? profileImageID;
  String? profileImageURL;
  ParentModel({
    this.parentName,
    this.docid,
    this.uid,
    this.createdate,
    this.parentPhoneNumber,
    this.parentEmail,
    this.wStudent,
    this.houseName,
    this.place,
    this.state,
    this.pincode,
    this.parentImage,
    this.gender,
    this.profileImageID,
    this.profileImageURL,
  });

  ParentModel copyWith({
    String? parentName,
    String? docid,
    String? uid,
    String? createdate,
    String? parentPhoneNumber,
    String? parentEmail,
    String? wStudent,
    String? houseName,
    String? place,
    String? state,
    String? pincode,
    String? parentImage,
    String? gender,
    String? profileImageID,
    String? profileImageURL,
  }) {
    return ParentModel(
      parentName: parentName ?? this.parentName,
      docid: docid ?? this.docid,
      uid: uid ?? this.uid,
      createdate: createdate ?? this.createdate,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
      parentEmail: parentEmail ?? this.parentEmail,
      wStudent: wStudent ?? this.wStudent,
      houseName: houseName ?? this.houseName,
      place: place ?? this.place,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      parentImage: parentImage ?? this.parentImage,
      gender: gender ?? this.gender,
      profileImageID: profileImageID ?? this.profileImageID,
      profileImageURL: profileImageURL ?? this.profileImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parentName': parentName??"",
      'docid': docid??"",
      'uid': uid??"",
      'createdate': createdate??"",
      'parentPhoneNumber': parentPhoneNumber??"",
      'parentEmail': parentEmail??"",
      'wStudent': wStudent??"",
      'houseName': houseName??"",
      'place': place??"",
      'state': state??"",
      'pincode': pincode??"",
      'parentImage': parentImage??"",
      'gender': gender??"",
      'profileImageID': profileImageID??"",
      'profileImageURL': profileImageURL??"",
    };
  }

  factory ParentModel.fromMap(Map<String, dynamic> map) {
    return ParentModel(
      parentName: map['parentName'] != null ? map['parentName'] as String : null,
      docid: map['docid'] != null ? map['docid'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      createdate: map['createdate'] != null ? map['createdate'] as String : null,
      parentPhoneNumber: map['parentPhoneNumber'] != null ? map['parentPhoneNumber'] as String : null,
      parentEmail: map['parentEmail'] != null ? map['parentEmail'] as String : null,
      wStudent: map['wStudent'] != null ? map['wStudent'] as String : null,
      houseName: map['houseName'] != null ? map['houseName'] as String : null,
      place: map['place'] != null ? map['place'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      parentImage: map['parentImage'] != null ? map['parentImage'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      profileImageID: map['profileImageID'] != null ? map['profileImageID'] as String : null,
      profileImageURL: map['profileImageURL'] != null ? map['profileImageURL'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentModel.fromJson(String source) => ParentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParentAddModel(parentName: $parentName, docid: $docid, uid: $uid, createdate: $createdate, parentPhoneNumber: $parentPhoneNumber, parentEmail: $parentEmail, wStudent: $wStudent, houseName: $houseName, place: $place, state: $state, pincode: $pincode, parentImage: $parentImage, gender: $gender, profileImageID: $profileImageID, profileImageURL: $profileImageURL)';
  }

  @override
  bool operator ==(covariant ParentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.parentName == parentName &&
      other.docid == docid &&
      other.uid == uid &&
      other.createdate == createdate &&
      other.parentPhoneNumber == parentPhoneNumber &&
      other.parentEmail == parentEmail &&
      other.wStudent == wStudent &&
      other.houseName == houseName &&
      other.place == place &&
      other.state == state &&
      other.pincode == pincode &&
      other.parentImage == parentImage &&
      other.gender == gender &&
      other.profileImageID == profileImageID &&
      other.profileImageURL == profileImageURL;
  }

  @override
  int get hashCode {
    return parentName.hashCode ^
      docid.hashCode ^
      uid.hashCode ^
      createdate.hashCode ^
      parentPhoneNumber.hashCode ^
      parentEmail.hashCode ^
      wStudent.hashCode ^
      houseName.hashCode ^
      place.hashCode ^
      state.hashCode ^
      pincode.hashCode ^
      parentImage.hashCode ^
      gender.hashCode ^
      profileImageID.hashCode ^
      profileImageURL.hashCode;
  }
}

class CreateParentsAddToFireBase {
  Future createSchoolController(
      ParentModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Students_Parents")
          .add(productModel.toMap()).then((value) {
            firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Students_Parents").doc(value.id).update({"docid":value.id});

          })
          .then(
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