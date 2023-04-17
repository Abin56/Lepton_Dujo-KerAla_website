// To parse this JSON data, do
//
//     final sampoornaModel = sampoornaModelFromJson(jsonString);

import 'dart:convert';

SampoornaModel sampoornaModelFromJson(String str) =>
    SampoornaModel.fromJson(json.decode(str));

String sampoornaModelToJson(SampoornaModel data) => json.encode(data.toJson());

class SampoornaModel {
  SampoornaModel({
    required this.id,
    required this.imageId,
    required this.imageUrl,
    required this.name,
    required this.designation,
    required this.position,
  });

  String id;
  String imageId;
  String imageUrl;
  String name;
  String designation;
  String position;

  factory SampoornaModel.fromJson(Map<String, dynamic> json) => SampoornaModel(
        id: json["id"],
        imageId: json["imageId"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        designation: json["designation"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageId": imageId,
        "imageUrl": imageUrl,
        "name": name,
        "designation": designation,
        "position": position,
      };
}
