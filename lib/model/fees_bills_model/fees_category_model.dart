// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeesCategoryModel {
  String categoryName;
  String id;
  String type;
  FeesCategoryModel({
    required this.categoryName,
    required this.id,
    required this.type,
  });

  FeesCategoryModel copyWith({
    String? categoryName,
    String? id,
    String? type,
  }) {
    return FeesCategoryModel(
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'id': id,
      'type': type,
    };
  }

  factory FeesCategoryModel.fromMap(Map<String, dynamic> map) {
    return FeesCategoryModel(
      categoryName: map['categoryName'] as String,
      id: map['id'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeesCategoryModel.fromJson(String source) =>
      FeesCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FeesCategoryModel(categoryName: $categoryName, id: $id, type: $type)';

  @override
  bool operator ==(covariant FeesCategoryModel other) {
    if (identical(this, other)) return true;

    return other.categoryName == categoryName &&
        other.id == id &&
        other.type == type;
  }

  @override
  int get hashCode => categoryName.hashCode ^ id.hashCode ^ type.hashCode;
}
