// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../controller/get_firebase-data/get_firebase_data.dart';

class AddStudentModel {
  String? uid;
  String? studentName;
  String? gender;
  String? admissionNumber;
  String? studentemail;
  String? parentPhoneNumber;
  String? whichClass;
  String? houseName;
  String? place;
  String? district;
  String? alPhoneNumber;
  String? profileImageId;
  String? profileImageUrl;
  String? createDate;
  String? bloodgroup;
  String? dateofBirth;
  String? docid;
  AddStudentModel({
    this.uid,
    this.studentName,
    this.gender,
    this.admissionNumber,
    this.studentemail,
    this.parentPhoneNumber,
    this.whichClass,
    this.houseName,
    this.place,
    this.district,
    this.alPhoneNumber,
    this.profileImageId,
    this.profileImageUrl,
    this.createDate,
    this.bloodgroup,
    this.dateofBirth,
    this.docid,
  });

  AddStudentModel copyWith({
    String? uid,
    String? studentName,
    String? gender,
    String? admissionNumber,
    String? studentemail,
    String? parentPhoneNumber,
    String? whichClass,
    String? houseName,
    String? place,
    String? district,
    String? alPhoneNumber,
    String? profileImageId,
    String? profileImageUrl,
    String? createDate,
    String? bloodgroup,
    String? dateofBirth,
    String? docid,
  }) {
    return AddStudentModel(
      uid: uid ?? this.uid,
      studentName: studentName ?? this.studentName,
      gender: gender ?? this.gender,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      studentemail: studentemail ?? this.studentemail,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
      whichClass: whichClass ?? this.whichClass,
      houseName: houseName ?? this.houseName,
      place: place ?? this.place,
      district: district ?? this.district,
      alPhoneNumber: alPhoneNumber ?? this.alPhoneNumber,
      profileImageId: profileImageId ?? this.profileImageId,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createDate: createDate ?? this.createDate,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      dateofBirth: dateofBirth ?? this.dateofBirth,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'studentName': studentName,
      'gender': gender,
      'admissionNumber': admissionNumber,
      'studentemail': studentemail,
      'parentPhoneNumber': parentPhoneNumber,
      'whichClass': whichClass,
      'houseName': houseName,
      'place': place,
      'district': district,
      'alPhoneNumber': alPhoneNumber,
      'profileImageId': profileImageId,
      'profileImageUrl': profileImageUrl,
      'createDate': createDate,
      'bloodgroup': bloodgroup,
      'dateofBirth': dateofBirth,
      'docid': docid,
    };
  }

  factory AddStudentModel.fromMap(Map<String, dynamic> map) {
    return AddStudentModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      studentName:
          map['studentName'] != null ? map['studentName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      admissionNumber: map['admissionNumber'] != null
          ? map['admissionNumber'] as String
          : null,
      studentemail:
          map['studentemail'] != null ? map['studentemail'] as String : null,
      parentPhoneNumber: map['parentPhoneNumber'] != null
          ? map['parentPhoneNumber'] as String
          : null,
      whichClass:
          map['whichClass'] != null ? map['whichClass'] as String : null,
      houseName: map['houseName'] != null ? map['houseName'] as String : null,
      place: map['place'] != null ? map['place'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      alPhoneNumber:
          map['alPhoneNumber'] != null ? map['alPhoneNumber'] as String : null,
      profileImageId: map['profileImageId'] != null
          ? map['profileImageId'] as String
          : null,
      profileImageUrl: map['profileImageUrl'] != null
          ? map['profileImageUrl'] as String
          : null,
      createDate:
          map['createDate'] != null ? map['createDate'] as String : null,
      bloodgroup:
          map['bloodgroup'] != null ? map['bloodgroup'] as String : null,
      dateofBirth:
          map['dateofBirth'] != null ? map['dateofBirth'] as String : null,
      docid: map['docid'] != null ? map['docid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStudentModel.fromJson(String source) =>
      AddStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddStudentModel(uid: $uid, studentName: $studentName, gender: $gender, admissionNumber: $admissionNumber, studentemail: $studentemail, parentPhoneNumber: $parentPhoneNumber, whichClass: $whichClass, houseName: $houseName, place: $place, district: $district, alPhoneNumber: $alPhoneNumber, profileImageId: $profileImageId, profileImageUrl: $profileImageUrl, createDate: $createDate, bloodgroup: $bloodgroup, dateofBirth: $dateofBirth, docid: $docid)';
  }

  @override
  bool operator ==(covariant AddStudentModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.studentName == studentName &&
        other.gender == gender &&
        other.admissionNumber == admissionNumber &&
        other.studentemail == studentemail &&
        other.parentPhoneNumber == parentPhoneNumber &&
        other.whichClass == whichClass &&
        other.houseName == houseName &&
        other.place == place &&
        other.district == district &&
        other.alPhoneNumber == alPhoneNumber &&
        other.profileImageId == profileImageId &&
        other.profileImageUrl == profileImageUrl &&
        other.createDate == createDate &&
        other.bloodgroup == bloodgroup &&
        other.dateofBirth == dateofBirth &&
        other.docid == docid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        studentName.hashCode ^
        gender.hashCode ^
        admissionNumber.hashCode ^
        studentemail.hashCode ^
        parentPhoneNumber.hashCode ^
        whichClass.hashCode ^
        houseName.hashCode ^
        place.hashCode ^
        district.hashCode ^
        alPhoneNumber.hashCode ^
        profileImageId.hashCode ^
        profileImageUrl.hashCode ^
        createDate.hashCode ^
        bloodgroup.hashCode ^
        dateofBirth.hashCode ^
        docid.hashCode;
  }
}

class AddStudentsToFireBase {
  Future addStudentsController(AddStudentModel productModel, context, schoolid,
      classId, batchYear) async {
    try {
      final firebase = FirebaseFirestore.instance;

      String studentId = "";
      firebase
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("Classes")
          .doc(classId)
          .collection('Students')
          .add(productModel.toMap())
          .then((value) {
        studentId = value.id;
        firebase
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("Classes")
            .doc(classId)
            .collection('Students')
            .doc(value.id)
            .update({"docid": value.id});
      }).then((value) {
        firebase
            .collection("SchoolListCollection")
            .doc(schoolid)
            .collection("AllStudents")
            .doc(studentId)
            .set(productModel.toMap())
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
                      children: const <Widget>[
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
      });
      // .collection(classId)
      // .doc(productModel.admissionNumber)
      // .set(productModel.toJson())
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
