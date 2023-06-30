// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FeesModel {
  String categoryId;
  String categoryName;
  String amount;
  String dueDate;
  String classId;
  String className;
  String type;
  String subCategoryId;
  String subCategoryName;
  List<StudentFeesModel> studentList;
  FeesModel({
    required this.categoryId,
    required this.categoryName,
    required this.amount,
    required this.dueDate,
    required this.classId,
    required this.className,
    required this.type,
    required this.subCategoryId,
    required this.subCategoryName,
    required this.studentList,
  });

  FeesModel copyWith({
    String? categoryId,
    String? categoryName,
    String? amount,
    String? dueDate,
    String? classId,
    String? className,
    String? type,
    String? subCategoryId,
    String? subCategoryName,
    List<StudentFeesModel>? studentList,
  }) {
    return FeesModel(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      classId: classId ?? this.classId,
      className: className ?? this.className,
      type: type ?? this.type,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      subCategoryName: subCategoryName ?? this.subCategoryName,
      studentList: studentList ?? this.studentList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
      'amount': amount,
      'dueDate': dueDate,
      'classId': classId,
      'className': className,
      'type': type,
      'subCategoryId': subCategoryId,
      'subCategoryName': subCategoryName,
      'studentList': studentList.map((x) => x.toMap()).toList(),
    };
  }

  factory FeesModel.fromMap(Map<String, dynamic> map) {
    return FeesModel(
      categoryId: map['categoryId'] as String,
      categoryName: map['categoryName'] as String,
      amount: map['amount'] as String,
      dueDate: map['dueDate'] as String,
      classId: map['classId'] as String,
      className: map['className'] as String,
      type: map['type'] as String,
      subCategoryId: map['subCategoryId'] as String,
      subCategoryName: map['subCategoryName'] as String,
      studentList: List<StudentFeesModel>.from(
        (map['studentList'] as List<dynamic>).map<StudentFeesModel>(
          (x) => StudentFeesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeesModel.fromJson(String source) =>
      FeesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeesModel(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, dueDate: $dueDate, classId: $classId, className: $className, type: $type, subCategoryId: $subCategoryId, subCategoryName: $subCategoryName, studentList: $studentList)';
  }

  @override
  bool operator ==(covariant FeesModel other) {
    if (identical(this, other)) return true;

    return other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.amount == amount &&
        other.dueDate == dueDate &&
        other.classId == classId &&
        other.className == className &&
        other.type == type &&
        other.subCategoryId == subCategoryId &&
        other.subCategoryName == subCategoryName &&
        listEquals(other.studentList, studentList);
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        categoryName.hashCode ^
        amount.hashCode ^
        dueDate.hashCode ^
        classId.hashCode ^
        className.hashCode ^
        type.hashCode ^
        subCategoryId.hashCode ^
        subCategoryName.hashCode ^
        studentList.hashCode;
  }
}

class StudentFeesModel {
  String studentId;
  String totalAmount;
  String collectedAmount;
  StudentFeesModel({
    required this.studentId,
    required this.totalAmount,
    required this.collectedAmount,
  });

  StudentFeesModel copyWith({
    String? studentId,
    String? totalAmount,
    String? collectedAmount,
  }) {
    return StudentFeesModel(
      studentId: studentId ?? this.studentId,
      totalAmount: totalAmount ?? this.totalAmount,
      collectedAmount: collectedAmount ?? this.collectedAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'totalAmount': totalAmount,
      'collectedAmount': collectedAmount,
    };
  }

  factory StudentFeesModel.fromMap(Map<String, dynamic> map) {
    return StudentFeesModel(
      studentId: map['studentId'] as String,
      totalAmount: map['totalAmount'] as String,
      collectedAmount: map['collectedAmount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentFeesModel.fromJson(String source) =>
      StudentFeesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentFeesModel(studentId: $studentId, totalAmount: $totalAmount, collectedAmount: $collectedAmount)';

  @override
  bool operator ==(covariant StudentFeesModel other) {
    if (identical(this, other)) return true;

    return other.studentId == studentId &&
        other.totalAmount == totalAmount &&
        other.collectedAmount == collectedAmount;
  }

  @override
  int get hashCode =>
      studentId.hashCode ^ totalAmount.hashCode ^ collectedAmount.hashCode;
}
