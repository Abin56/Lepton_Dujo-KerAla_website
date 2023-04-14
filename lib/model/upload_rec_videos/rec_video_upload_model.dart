//     final VideoUploadModel = VideoUploadModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

VideoUploadModel VideoUploadModelFromJson(String str) =>
    VideoUploadModel.fromJson(json.decode(str));

String VideoUploadModelToJson(VideoUploadModel data) =>
    json.encode(data.toJson());

class VideoUploadModel {
  VideoUploadModel({
    required this.videoImage,
    required this.course,
    this.id,
    required this.videoPath,
    required this.videoName,
    required this.dateTime,
  });

  String? id;
  String course;
  String videoPath;
  String videoName;
  String videoImage;
  DateTime dateTime;

  factory VideoUploadModel.fromJson(Map<String, dynamic> json) =>
      VideoUploadModel(
        id: json["id"] ?? '',
        course: json["course"] ?? '',
        videoPath: json["videoPath"] ?? '',
        videoName: json["videoName"] ?? '',
        videoImage: json["videoImage"] ?? '',
        dateTime: json["dateTime"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course": course,
        "videoPath": videoPath,
        "videoName": videoName,
        "videoImage": videoImage,
        "dateTime": dateTime,
      };
}

class VideoUploadToFireBase {
  // bool isWorking = false;
  Future videouploadModelController(
      VideoUploadModel productModel, BuildContext context) async {
    // if (!isWorking) {
    //   isWorking = true;

    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("RecordedCourse_videos").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) {
        // isWorking = false;
        return showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Message'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Successfully Uploaded to Server'),
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
      });
      // .then((value) => Get.to(BuyingOrdersScreen(
      //       id: doc.id,
      //     )));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
      // isWorking = false;
    }
  }
}
// }
