// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../controller/get_firebase-data/get_firebase_data.dart';

class AddSubjectModel {
  String subjectName;
  String? docid;
  AddSubjectModel({
    required this.subjectName,
    this.docid,
  });
 

  AddSubjectModel copyWith({
    String? subjectName,
    String? docid,
  }) {
    return AddSubjectModel(
      subjectName: subjectName ?? this.subjectName,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectName': subjectName,
      'docid': docid??"",
    };
  }

  factory AddSubjectModel.fromMap(Map<String, dynamic> map) {
    return AddSubjectModel(
      subjectName: map['subjectName'] as String,
      docid: map['docid'] != null ? map['docid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddSubjectModel.fromJson(String source) => AddSubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddSubjectModel(subjectName: $subjectName, docid: $docid)';

  @override
  bool operator ==(covariant AddSubjectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.subjectName == subjectName &&
      other.docid == docid;
  }

  @override
  int get hashCode => subjectName.hashCode ^ docid.hashCode;
}

class AddSubjectsToFireBase {
  Future addSubjectsController(
      AddSubjectModel productModel, context, classId, ) async {
    try {
      final firebase = FirebaseFirestore.instance;

      firebase
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("Classes")
          .doc(classId)
          .collection('subjects')
          .add(productModel.toMap())
          .then((value) {
        firebase
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("Classes")
            .doc(classId)
            .collection('subjects')
            .doc(value.id)
            .update({"docid": value.id});
      });
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
