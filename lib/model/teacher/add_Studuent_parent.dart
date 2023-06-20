//     final AddStudentParentModel = AddTeachersModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AddStudentParentModel AddTeachersModelFromJson(String str) =>
    AddStudentParentModel.fromJson(json.decode(str));

String AddTeachersModelToJson(AddStudentParentModel data) =>
    json.encode(data.toJson());

class AddStudentParentModel {
  AddStudentParentModel({
    required this.id,
    required this.teacherName,
    required this.classIncharge,
    required this.employeeID,
    required this.joinDate,
  });

  String teacherName;
  String classIncharge;
  String id;
  String employeeID;
  String joinDate;

  factory AddStudentParentModel.fromJson(Map<String, dynamic> json) =>
      AddStudentParentModel(
        id: json["id"] ?? '',
        teacherName: json["teacherName"] ?? '',
        classIncharge: json["classIncharge"] ?? '',
        joinDate: json["joinDate"] ?? '',
        employeeID: json["employeeID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teacherName": teacherName,
        "classIncharge": classIncharge,
        "employeeID": employeeID,
        "joinDate": joinDate,
      };
}

class CreateParentAddToFireBase {
  Future createParentController(
      AddStudentParentModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Students_Parents")
          .doc(productModel.employeeID)
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
                    children: const <Widget>[
                      Text('Successfully created'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
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
