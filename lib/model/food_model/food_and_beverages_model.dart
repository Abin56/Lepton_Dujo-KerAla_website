//     final FoodModel = GetCreatedCourseAddModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

FoodModel FoodModelFromJson(String str) =>
    FoodModel.fromJson(json.decode(str));

String FoodModelToJson(FoodModel data) =>
    json.encode(data.toJson());

class FoodModel {
  FoodModel(
      {required this.items,
    });

  Map<String, String> items;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      FoodModel(
        items: json["items"] ?? '',

      );

  Map<String, dynamic> toJson() => {
        "item1": items,
       
      };
}


