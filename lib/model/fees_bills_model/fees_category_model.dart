// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String categoryName;
  String id;
  CategoryModel({
    required this.categoryName,
    required this.id,
  });

  CategoryModel copyWith({
    String? categoryName,
    String? id,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'id': id,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryName: map['categoryName'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(categoryName: $categoryName, id: $id)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.categoryName == categoryName && other.id == id;
  }

  @override
  int get hashCode => categoryName.hashCode ^ id.hashCode;
}
