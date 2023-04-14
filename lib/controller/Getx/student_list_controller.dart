import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/guardian/guardian_data_model.dart';
import '../../model/parent/parent_data_model.dart';



class ClassTeacherStudentListController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool isupdated = false.obs;

  Future<GuardianDataModel> getClassTeacherWiseStudenGuardianData(
      {required String schoolId, required String studentDataId}) async {
    QuerySnapshot<Map<String, dynamic>> data = await firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Student_Guardian')
        .where('wStudent', isEqualTo: studentDataId)
        .get();
    GuardianDataModel guardianData =
        GuardianDataModel.fromJson(data.docs[0].data());
    return guardianData;
  }

  Future<ParentDataModel> getClassTeacherWiseStudenParentData(
      {required String schoolId, required String studentDataId}) async {
    QuerySnapshot<Map<String, dynamic>> data = await firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Students_Parents')
        .where('wStudent', isEqualTo: studentDataId)
        .get();
    ParentDataModel parentData = ParentDataModel.fromJson(data.docs[0].data());
    return parentData;
  }

  Future<bool> updateStudentParentPhoneNumber(
      {required String stuentId,
      required String classId,
      required String schoolId,
      required String newPhoneNumber}) async {
    if (newPhoneNumber.isEmpty) {
      isupdated.value = false;
      return isupdated.value;
    }
    isupdated.value = true;
    await firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Classes')
        .doc(classId)
        .collection('Students')
        .doc(stuentId)
        .update({'parentPhNo': newPhoneNumber});
    return isupdated.value;
  }

  Future<bool> updateGuardianPhoneNumber({
    required String stuentId,
    required String schoolId,
    required String newPhoneNumber,
  }) async {
    //find guardian id
    QuerySnapshot<Map<String, dynamic>> studentData = await firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Student_Guardian')
        .where('wStudent', isEqualTo: stuentId)
        .get();
    Map<String, dynamic> guardianDataMap = studentData.docs[0].data();

    //update guardian phone number
    firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Student_Guardian')
        .doc(guardianDataMap['id'])
        .update(
      <String, dynamic>{
        'guardianPhoneNumber': newPhoneNumber,
      },
    );

    if (newPhoneNumber.isEmpty) {
      isupdated.value = false;
      return isupdated.value;
    }
    isupdated.value = true;

    return isupdated.value;
  }

  Future<bool> updateParentPhoneNumber({
    required String stuentId,
    required String schoolId,
    required String newPhoneNumber,
  }) async {
    //find guardian id
    QuerySnapshot<Map<String, dynamic>> studentData = await firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Students_Parents')
        .where('wStudent', isEqualTo: stuentId)
        .get();
    Map<String, dynamic> parentDataMap = studentData.docs[0].data();

    //update guardian phone number
    firestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('Students_Parents')
        //there is no parent id but parent id same as parent email
        .doc(parentDataMap['parentEmail'])
        .update(
      <String, dynamic>{
        'parentPhoneNumber': newPhoneNumber,
      },
    );

    if (newPhoneNumber.isEmpty) {
      isupdated.value = false;
      return isupdated.value;
    }
    isupdated.value = true;

    return isupdated.value;
  }

//Teacher can remove students this time just change deactivate field to true
  Future<bool> removeStudentData(
      String studentId, String classId, String schoolId) async {
    try {
      await firestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Students')
          .doc(studentId)
          .update(
        <String, dynamic>{
          "deactivate": true,
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
