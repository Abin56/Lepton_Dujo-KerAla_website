import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/student_protection_model/student_protection_model.dart';
import '../../../view/constant/constant.dart';

class StudentProtectionGroupController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  Future<void> createMember(
    String shcoolId,
    StudentProtectionGroupModel studentProtectionGroupModel,
  ) async {
    try {
      isLoading.value = true;
      DocumentReference<Map<String, dynamic>> result = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(shcoolId)
          .collection('Student_Protection_Group')
          .add(
            studentProtectionGroupModel.toJson(),
          );

      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(shcoolId)
          .collection('Student_Protection_Group')
          .doc(result.id)
          .update({"id": result.id});
      isLoading.value = false;
      showToast(msg: 'Created Successfully');
    } catch (e) {
      isLoading.value = false;
      showToast(msg: e.toString());
    }
  }

  Future<void> updateUser(
      String id,
      StudentProtectionGroupModel studentProtectionGroupModel,
      String schoolId) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Student_Protection_Group')
          .doc(id)
          .update(
            studentProtectionGroupModel.toJson(),
          );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      showToast(
        msg: e.toString(),
      );
    }
  }

  Future<void> removeUser(String schoolId, String docId) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Student_Protection_Group')
          .doc(docId)
          .delete();
      isLoading.value = false;
      showToast(msg: 'Successfully Created');
    } catch (e) {
      isLoading.value = false;
      showToast(msg: e.toString());
    }
  }
}
