//     final FoodModel = GetCreatedCourseAddModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

AlumniCategory AlumniCategoryFromJson(String str) =>
    AlumniCategory.fromJson(json.decode(str));

String AlumniCategoryToJson(AlumniCategory data) =>
    json.encode(data.toJson());

class AlumniCategory {
  AlumniCategory(
      {required this.categoryName, 
      required this.categoryID
    });

  String categoryName; 
  String categoryID;

  factory AlumniCategory.fromJson(Map<String, dynamic> json) =>
      AlumniCategory(
        categoryName: json["categoryName"] ?? '',
        categoryID: json["categoryID"] ?? ''
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "categoryID":categoryID
       
      };
}


