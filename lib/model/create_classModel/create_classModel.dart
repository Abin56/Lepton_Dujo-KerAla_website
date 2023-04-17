//     final AddClassesModel = AddClassesModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../loginHistory_model/login_history_model.dart';

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
    log("school id >>>>${Get.find<AdminLoginScreenController>().schoolID}");
    log("batch id >>>>${Get.find<GetFireBaseData>().bYear.value}");
    try {
      final firebase = FirebaseFirestore.instance;
      firebase
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("Classes")
          .doc(productModel.classID)
          .set(productModel.toJson())
          .then((value) => {
                firebase
                    .collection("SchoolListCollection")
                    .doc(Get.find<AdminLoginScreenController>().schoolID)
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection("Teachers")
                    .doc(teacherId)
                    .set({'classIncharge': productModel.classID},
                        SetOptions(merge: true))
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
