// To parse this JSON data, do
//
//     final ptamodel = ptamodelFromJson(jsonString);

import 'dart:convert';

Ptamodel ptamodelFromJson(String str) => Ptamodel.fromJson(json.decode(str));

String ptamodelToJson(Ptamodel data) => json.encode(data.toJson());

class Ptamodel {
  Ptamodel({
    required this.ptaId,
  });

  String ptaId;

  factory Ptamodel.fromJson(Map<String, dynamic> json) => Ptamodel(
        ptaId: json["ptaId"],
      );

  Map<String, dynamic> toJson() => {
        "ptaId": ptaId,
      };
}
