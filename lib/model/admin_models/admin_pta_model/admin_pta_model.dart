

import 'dart:convert';

AdminPtaModel studentProtectionGroupFromJson(String str) => AdminPtaModel.fromJson(json.decode(str));

String studentProtectionGroupToJson(AdminPtaModel data) => json.encode(data.toJson());

class AdminPtaModel {
    AdminPtaModel({
        required this.name,
        required this.position,
        required this.designation,
        required this.id,
        required this.imageUrl,
        required this.imageId,
    });

    String name;
    String position;
    String designation;
    String id;
    String imageUrl;
    String imageId;

    factory AdminPtaModel.fromJson(Map<String, dynamic> json) => AdminPtaModel(
        name: json["name"],
        position: json["position"],
        designation: json["designation"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        imageId: json["imageId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "position": position,
        "designation": designation,
        "id": id,
        "imageUrl": imageUrl,
        "imageId": imageId,
    };
}
