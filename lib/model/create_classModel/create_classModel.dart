//     final AddClassesModel = AddClassesModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AddClassesModel AddClassesModelFromJson(String str) =>
    AddClassesModel.fromJson(json.decode(str));

String AddClassesModelToJson(AddClassesModel data) =>
    json.encode(data.toJson());

class AddClassesModel {
  AddClassesModel({
    required this.id,
    required this.className,
    required this.classIncharge,
    required this.classID,
    required this.joinDate,
  });

  String className;
  String classIncharge;
  String id;
  String classID;
  String joinDate;

  factory AddClassesModel.fromJson(Map<String, dynamic> json) =>
      AddClassesModel(
        id: json["id"] ?? '',
        className: json["className"] ?? '',
        classIncharge: json["classIncharge"] ?? '',
        joinDate: json["joinDate"] ?? '',
        classID: json["classID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "className": className,
        "classIncharge": classIncharge,
        "classID": classID,
        "joinDate": joinDate,
      };
}

class CreateClassesAddToFireBase {
  Future createClassesController(
      AddClassesModel productModel, context, id, teacherId) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Classes")
          .doc(productModel.classID)
          .set(productModel.toJson())
          .then((value) => {
                firebase
                    .collection("SchoolListCollection")
                    .doc(id)
                    .collection("Teachers")
                    .doc(teacherId)
                    .set({'classIncharge':productModel.classID}, SetOptions(merge: true))
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
