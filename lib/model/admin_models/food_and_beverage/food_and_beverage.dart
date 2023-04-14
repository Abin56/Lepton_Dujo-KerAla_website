// To parse this JSON data, do
//
//     final foodAndBeverage = foodAndBeverageFromJson(jsonString);

import 'dart:convert';

FoodAndBeverage foodAndBeverageFromJson(String str) =>
    FoodAndBeverage.fromJson(json.decode(str));

String foodAndBeverageToJson(FoodAndBeverage data) =>
    json.encode(data.toJson());

class FoodAndBeverage {
  FoodAndBeverage({
    required this.ptaId,
  });

  String ptaId;

  factory FoodAndBeverage.fromJson(Map<String, dynamic> json) =>
      FoodAndBeverage(
        ptaId: json["ptaId"],
      );

  Map<String, dynamic> toJson() => {
        "ptaId": ptaId,
      };
}
