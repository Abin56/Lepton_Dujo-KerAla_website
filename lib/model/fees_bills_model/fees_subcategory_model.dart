// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeesSubCategoryModel {
  String subCategoryName;
  String id;
  String categoryName;
  FeesSubCategoryModel({
    required this.subCategoryName,
    required this.id,
    required this.categoryName,
  });

  FeesSubCategoryModel copyWith({
    String? subCategoryName,
    String? id,
    String? categoryName,
  }) {
    return FeesSubCategoryModel(
      subCategoryName: subCategoryName ?? this.subCategoryName,
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subCategoryName': subCategoryName,
      'id': id,
      'categoryName': categoryName,
    };
  }

  factory FeesSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return FeesSubCategoryModel(
      subCategoryName: map['subCategoryName'] as String,
      id: map['id'] as String,
      categoryName: map['categoryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeesSubCategoryModel.fromJson(String source) =>
      FeesSubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FeesSubCategoryModel(subCategoryName: $subCategoryName, id: $id, categoryName: $categoryName)';

  @override
  bool operator ==(covariant FeesSubCategoryModel other) {
    if (identical(this, other)) return true;

    return other.subCategoryName == subCategoryName &&
        other.id == id &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode =>
      subCategoryName.hashCode ^ id.hashCode ^ categoryName.hashCode;
}
