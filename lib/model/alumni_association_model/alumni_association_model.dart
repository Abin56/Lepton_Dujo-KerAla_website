// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlumniAssociationModel {
  String id;
  String imageId;
  String imageUrl;
  String name;
  String designation;
  String position;
  AlumniAssociationModel({
    required this.id,
    required this.imageId,
    required this.imageUrl,
    required this.name,
    required this.designation,
    required this.position,
  });

  AlumniAssociationModel copyWith({
    String? id,
    String? imageId,
    String? imageUrl,
    String? name,
    String? designation,
    String? position,
  }) {
    return AlumniAssociationModel(
      id: id ?? this.id,
      imageId: imageId ?? this.imageId,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageId': imageId,
      'imageUrl': imageUrl,
      'name': name,
      'designation': designation,
      'position': position,
    };
  }

  factory AlumniAssociationModel.fromMap(Map<String, dynamic> map) {
    return AlumniAssociationModel(
      id: map['id'] as String,
      imageId: map['imageId'] as String,
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      designation: map['designation'] as String,
      position: map['position'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlumniAssociationModel.fromJson(String source) =>
      AlumniAssociationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AlumniAssociationModel(id: $id, imageId: $imageId, imageUrl: $imageUrl, name: $name, designation: $designation, position: $position)';
  }

  @override
  bool operator ==(covariant AlumniAssociationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageId == imageId &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.designation == designation &&
        other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageId.hashCode ^
        imageUrl.hashCode ^
        name.hashCode ^
        designation.hashCode ^
        position.hashCode;
  }
}
