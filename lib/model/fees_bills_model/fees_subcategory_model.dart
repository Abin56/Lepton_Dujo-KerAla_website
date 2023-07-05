// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeesSubCategoryModel {
  String subCategoryName;
  String id;
  String categoryName;
  String createdAt;
  FeesSubCategoryModel({
    required this.subCategoryName,
    required this.id,
    required this.categoryName,
    required this.createdAt,
  });

  FeesSubCategoryModel copyWith({
    String? subCategoryName,
    String? id,
    String? categoryName,
    String? createdAt,
  }) {
    return FeesSubCategoryModel(
      subCategoryName: subCategoryName ?? this.subCategoryName,
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subCategoryName': subCategoryName,
      'id': id,
      'categoryName': categoryName,
      'createdAt': createdAt,
    };
  }

  factory FeesSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return FeesSubCategoryModel(
      subCategoryName: map['subCategoryName'] as String,
      id: map['id'] as String,
      categoryName: map['categoryName'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeesSubCategoryModel.fromJson(String source) =>
      FeesSubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeesSubCategoryModel(subCategoryName: $subCategoryName, id: $id, categoryName: $categoryName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant FeesSubCategoryModel other) {
    if (identical(this, other)) return true;

    return other.subCategoryName == subCategoryName &&
        other.id == id &&
        other.categoryName == categoryName &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return subCategoryName.hashCode ^
        id.hashCode ^
        categoryName.hashCode ^
        createdAt.hashCode;
  }
}
