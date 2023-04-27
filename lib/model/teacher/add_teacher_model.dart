//     final AddTeachersModel = AddTeachersModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';

AddTeachersModel AddTeachersModelFromJson(String str) =>
    AddTeachersModel.fromJson(json.decode(str));

String AddTeachersModelToJson(AddTeachersModel data) =>
    json.encode(data.toJson());

class AddTeachersModel {
  AddTeachersModel(
      {required this.id,
      required this.teacherName,
      required this.employeeID,
      required this.joinDate,
      required this.teacherPhNo,
      required this.teacherEmail,
      this.userRole = 'teacher'});

  String teacherName;
  String id;
  String employeeID;
  String joinDate;
  String teacherPhNo;
  String teacherEmail;
  String userRole;

  factory AddTeachersModel.fromJson(Map<String, dynamic> json) =>
      AddTeachersModel(
        id: json["id"] ?? '',
        teacherName: json["teacherName"] ?? '',
        joinDate: json["joinDate"] ?? '',
        employeeID: json["employeeID"] ?? '',
        teacherPhNo: json["teacherPhNo"] ?? '',
        teacherEmail: json["teacherEmail"] ?? '',
        userRole: json["userRole"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teacherName": teacherName,
        "joinDate": joinDate,
        "teacherPhNo": teacherPhNo,
        "employeeID": employeeID,
        "teacherEmail": teacherEmail,
        "userRole": userRole,
      };
}

class CreateTeachersAddToFireBase {
  Future createSchoolController(
      AddTeachersModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = await firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Teachers")
          .doc(productModel.teacherEmail)
          .set(productModel.toJson())
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
