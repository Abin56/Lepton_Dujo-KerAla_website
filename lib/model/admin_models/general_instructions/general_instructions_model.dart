// To parse this JSON data, do
//
//     final generalInstructionModel = generalInstructionModelFromJson(jsonString);

import 'dart:convert';

GeneralInstructionModel generalInstructionModelFromJson(String str) =>
    GeneralInstructionModel.fromJson(json.decode(str));

String generalInstructionModelToJson(GeneralInstructionModel data) =>
    json.encode(data.toJson());

class GeneralInstructionModel {
  GeneralInstructionModel({
    required this.instruction,
    required this.instructionId,
    required this.time,
  });

  String instruction;
  String instructionId;
  String time;

  factory GeneralInstructionModel.fromJson(Map<String, dynamic> json) =>
      GeneralInstructionModel(
        instruction: json["instruction"],
        instructionId: json["instructionId"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "instruction": instruction,
        "instructionId": instructionId,
        "time": time,
      };
}
