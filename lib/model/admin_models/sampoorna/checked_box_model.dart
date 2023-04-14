// To parse this JSON data, do
//
//     final checkedBoxModel = checkedBoxModelFromJson(jsonString);

import 'dart:convert';

CheckedBoxModel checkedBoxModelFromJson(String str) =>
    CheckedBoxModel.fromJson(json.decode(str));

String checkedBoxModelToJson(CheckedBoxModel data) =>
    json.encode(data.toJson());

class CheckedBoxModel {
  CheckedBoxModel({
    required this.value,
    required this.title,
  });

  bool value;
  String title;

  factory CheckedBoxModel.fromJson(Map<String, dynamic> json) =>
      CheckedBoxModel(
        value: json["value"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "title": title,
      };
}
