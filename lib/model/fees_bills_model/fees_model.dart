// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FeesModel {
  String feesName;
  String feesId;
  String createdAt;
  String feePeriod;
  String categoryId;
  String amount;
  String dueDate;
  String classId;
  String className;
  List<String> studentList;
  FeesModel({
    required this.feesName,
    required this.feesId,
    required this.createdAt,
    required this.feePeriod,
    required this.categoryId,
    required this.amount,
    required this.dueDate,
    required this.classId,
    required this.className,
    required this.studentList,
  });

  FeesModel copyWith({
    String? feesName,
    String? feesId,
    String? createdAt,
    String? feePeriod,
    String? categoryId,
    String? amount,
    String? dueDate,
    String? classId,
    String? className,
    List<String>? studentList,
  }) {
    return FeesModel(
      feesName: feesName ?? this.feesName,
      feesId: feesId ?? this.feesId,
      createdAt: createdAt ?? this.createdAt,
      feePeriod: feePeriod ?? this.feePeriod,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      classId: classId ?? this.classId,
      className: className ?? this.className,
      studentList: studentList ?? this.studentList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'feesName': feesName,
      'feesId': feesId,
      'createdAt': createdAt,
      'feePeriod': feePeriod,
      'categoryId': categoryId,
      'amount': amount,
      'dueDate': dueDate,
      'classId': classId,
      'className': className,
      'studentList': studentList,
    };
  }

  factory FeesModel.fromMap(Map<String, dynamic> map) {
    return FeesModel(
      feesName: map['feesName'] as String,
      feesId: map['feesId'] as String,
      createdAt: map['createdAt'] as String,
      feePeriod: map['feePeriod'] as String,
      categoryId: map['categoryId'] as String,
      amount: map['amount'] as String,
      dueDate: map['dueDate'] as String,
      classId: map['classId'] as String,
      className: map['className'] as String,
      studentList: List<String>.from((map['studentList'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeesModel.fromJson(String source) =>
      FeesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeesModel(feesName: $feesName, feesId: $feesId, createdAt: $createdAt, feePeriod: $feePeriod, categoryId: $categoryId, amount: $amount, dueDate: $dueDate, classId: $classId, className: $className, studentList: $studentList)';
  }

  @override
  bool operator ==(covariant FeesModel other) {
    if (identical(this, other)) return true;

    return other.feesName == feesName &&
        other.feesId == feesId &&
        other.createdAt == createdAt &&
        other.feePeriod == feePeriod &&
        other.categoryId == categoryId &&
        other.amount == amount &&
        other.dueDate == dueDate &&
        other.classId == classId &&
        other.className == className &&
        listEquals(other.studentList, studentList);
  }

  @override
  int get hashCode {
    return feesName.hashCode ^
        feesId.hashCode ^
        createdAt.hashCode ^
        feePeriod.hashCode ^
        categoryId.hashCode ^
        amount.hashCode ^
        dueDate.hashCode ^
        classId.hashCode ^
        className.hashCode ^
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
