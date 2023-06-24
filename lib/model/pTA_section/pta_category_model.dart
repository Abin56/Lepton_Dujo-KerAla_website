//     final AddPTACategoryModel = AddPTACategoryModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AddPTACategoryModel AddPTACategoryModelFromJson(String str) =>
    AddPTACategoryModel.fromJson(json.decode(str));

String AddPTACategoryModelToJson(AddPTACategoryModel data) =>
    json.encode(data.toJson());

class AddPTACategoryModel {
  AddPTACategoryModel({
    required this.id,
    required this.ptaCategory,
    required this.active,
    required this.PTAID,
    required this.joinDate,
  });

  String ptaCategory;
  bool active;
  String id;
  String PTAID;
  String joinDate;

  factory AddPTACategoryModel.fromJson(Map<String, dynamic> json) =>
      AddPTACategoryModel(
        id: json["id"] ?? '',
        ptaCategory: json["ptaCategory"] ?? '',
        active: json["active"] ?? false,
        joinDate: json["joinDate"] ?? '',
        PTAID: json["PTAID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ptaCategory": ptaCategory,
        "active": active,
        "PTAID": PTAID,
        "joinDate": joinDate,
      };
}

class PTACategoryAddToFireBase {
  Future pTACategoryAddController(
      AddPTACategoryModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("PTACategoryCollection")
          .doc(productModel.PTAID)
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
