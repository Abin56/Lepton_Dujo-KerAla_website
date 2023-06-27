// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeesSubCategoryModel {
  String date;
  String id;
  String categoryName;
  FeesSubCategoryModel({
    required this.date,
    required this.id,
    required this.categoryName,
  });

  FeesSubCategoryModel copyWith({
    String? date,
    String? id,
    String? categoryName,
  }) {
    return FeesSubCategoryModel(
      date: date ?? this.date,
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'id': id,
      'categoryName': categoryName,
    };
  }

  factory FeesSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return FeesSubCategoryModel(
      date: map['date'] as String,
      id: map['id'] as String,
      categoryName: map['categoryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeesSubCategoryModel.fromJson(String source) =>
      FeesSubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FeesSubCategoryModel(date: $date, id: $id, categoryName: $categoryName)';

  @override
  bool operator ==(covariant FeesSubCategoryModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.id == id &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode => date.hashCode ^ id.hashCode ^ categoryName.hashCode;
}
