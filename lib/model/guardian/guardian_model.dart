import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

GuardianModel GuardianModelFromJson(String str) =>
    GuardianModel.fromJson(json.decode(str));

String GuardianModelToJson(GuardianModel data) => json.encode(data.toJson());

class GuardianModel {
  GuardianModel({
    required this.id,
    required this.guardianName,
    required this.joinDate,
    required this.guardianPhoneNumber,
    required this.guardianEmail,
  });

  String guardianName;
  String id;
  String joinDate;
  String guardianPhoneNumber;
  String guardianEmail;

  factory GuardianModel.fromJson(Map<String, dynamic> json) => GuardianModel(
        id: json["id"] ?? '',
        guardianName: json["guardianName"] ?? '',
        joinDate: json["joinDate"] ?? '',
        guardianPhoneNumber: json["guardianPhoneNumber"] ?? '',
        guardianEmail: json["guardianEmail"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guardianName": guardianName,
        "joinDate": joinDate,
        "guardianPhoneNumber": guardianPhoneNumber,
        "guardianEmail": guardianEmail,
      };
}

class CreateGuardiansAddToFireBase {
  Future createSchoolController(GuardianModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Student_Guardian")
          .doc(productModel.guardianEmail)
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
