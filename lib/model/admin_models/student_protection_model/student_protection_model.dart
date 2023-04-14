

import 'dart:convert';

StudentProtectionGroupModel studentProtectionGroupFromJson(String str) => StudentProtectionGroupModel.fromJson(json.decode(str));

String studentProtectionGroupToJson(StudentProtectionGroupModel data) => json.encode(data.toJson());

class StudentProtectionGroupModel {
    StudentProtectionGroupModel({
        required this.name,
        required this.position,
        required this.category,
        required this.id,
        required this.imageUrl,
        required this.imageId,
    });

    String name;
    String position;
    String category;
    String id;
    String imageUrl;
    String imageId;

    factory StudentProtectionGroupModel.fromJson(Map<String, dynamic> json) => StudentProtectionGroupModel(
        name: json["name"],
        position: json["position"],
        category: json["category"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        imageId: json["imageId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "position": position,
        "category": category,
        "id": id,
        "imageUrl": imageUrl,
        "imageId": imageId,
    };
}
