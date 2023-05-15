//     final AddPTAMemberModel = AddPTAMemberModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AddPTAMemberModel AddPTAMemberModelFromJson(String str) =>
    AddPTAMemberModel.fromJson(json.decode(str));

String AddPTAMemberModelToJson(AddPTAMemberModel data) =>
    json.encode(data.toJson());

class AddPTAMemberModel {
  AddPTAMemberModel({
    required this.id,
    required this.ptaCategory,
    required this.active,
    required this.userName,
    required this.PtaMemberID,
    required this.joinDate,
  });

  String ptaCategory;
  bool active;
  String id;
  String userName;
  String PtaMemberID;
  String joinDate;

  factory AddPTAMemberModel.fromJson(Map<String, dynamic> json) =>
      AddPTAMemberModel(
        id: json["id"] ?? '',
        ptaCategory: json["ptaCategory"] ?? '',
         userName: json["userName"] ?? '',
        active: json["active"] ?? false,
        joinDate: json["joinDate"] ?? '',
        PtaMemberID: json["PtaMemberID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ptaCategory": ptaCategory,
        "active": active,
          "userName": userName,
        "PtaMemberID": PtaMemberID,
        "joinDate": joinDate,
      };
}

class PTAMembersAddToFireBase {
  Future pTAMembersAddController(
      AddPTAMemberModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("PTAMembersCollection")
          .doc(productModel.PtaMemberID)
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
