// //     final AddTeachersModel = AddTeachersModelFromJson(jsonString);

// // ignore_for_file: file_names, non_constant_identifier_names

// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// AddTeachersModel AddTeachersModelFromJson(String str) =>
//     AddTeachersModel.fromJson(json.decode(str));

// String AddTeachersModelToJson(AddTeachersModel data) =>
//     json.encode(data.toJson());

// class AddTeachersModel {
//   AddTeachersModel({
//     required this.id,
//     required this.teacherName,
//     required this.classIncharge,
//     required this.employeeID,
//     required this.joinDate,
//   });

//   String teacherName;
//   String classIncharge;
//   String id;
//   String employeeID;
//   String joinDate;

//   factory AddTeachersModel.fromJson(Map<String, dynamic> json) =>
//       AddTeachersModel(
//         id: json["id"] ?? '',
//         teacherName: json["teacherName"] ?? '',
//         classIncharge: json["classIncharge"] ?? '',
//         joinDate: json["joinDate"] ?? '',
//         employeeID: json["employeeID"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "teacherName": teacherName,
//         "classIncharge": classIncharge,
//         "employeeID": employeeID,
//         "joinDate": joinDate,
//       };
// }

// class CreateTeachersAddToFireBase {
//   Future createSchoolController(
//       AddTeachersModel productModel, context, id) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase
//           .collection("SchoolListCollection")
//           .doc(id)
//           .collection("Teachers")
//           .doc(productModel.employeeID)
//           .set(productModel.toJson())
//           .then(
//         (value) {
//           return showDialog(
//             context: context,
//             barrierDismissible: false, // user must tap button!
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Message'),
//                 content: SingleChildScrollView(
//                   child: ListBody(
//                     children: <Widget>[
//                       Text('Successfully created'),
//                     ],
//                   ),
//                 ),
//                 actions: <Widget>[
//                   TextButton(
//                     child: const Text('ok'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       );
//     } on FirebaseException catch (e) {
//       print('Error ${e.message.toString()}');
//     }
//   }
// }
