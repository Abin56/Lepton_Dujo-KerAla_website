import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/class_teacher/class_teacher_notice_model.dart';
import '../../../../view/constant/constant.dart';

class TeacherNoticeController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController headingController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController signedByController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<ClassTeacherNoticeModel> classTeacherNoticeModelData =
      Rxn<ClassTeacherNoticeModel>(null);

  //create events

  Future<void> createNotice({
    required String schoolId,
    required String classId,
    required ClassTeacherNoticeModel classTeacherNoticeModel,
  }) async {
    //creating new event

    try {
      isLoading.value = true;
      final result = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Notice')
          .add(
            classTeacherNoticeModel.toJson(),
          );
//updating document id to firebase
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Notice')
          .doc(result.id)
          .update({
        "noticeId": result.id,
      });

      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Successfully Created');
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  Future<void> updateNotice(
      {required String schoolId,
      required String classId,
      required ClassTeacherNoticeModel classTeacherNoticeModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Notice')
          .doc(documentId)
          .update(
            classTeacherNoticeModel.toJson(),
          );
      clearControllers();
      isLoading.value = false;
      classTeacherNoticeModelData.value = null;
      showToast(msg: 'Successfully Updated');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(
        msg: e.toString(),
      );
    }
  }

  Future<void> deleteNotice(
      {required String schoolId,
      required String classId,
      required String documentId,
      required BuildContext context}) async {
    try {
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Notice')
          .doc(documentId)
          .delete();
      classTeacherNoticeModelData.value = null;
      showToast(msg: 'Successfully Removed');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  void clearControllers() {
    headingController.clear();
    dateController.clear();
    topicController.clear();
    contentController.clear();
    signedByController.clear();
  }
}
