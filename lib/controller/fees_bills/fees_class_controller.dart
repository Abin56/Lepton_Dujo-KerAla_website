import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/class_model/class_model.dart';
import '../../model/create_classModel/add_student_model.dart';
import '../../model/fees_bills_model/fees_category_model.dart';
import '../../model/fees_bills_model/fees_model.dart';
import '../../utils/utils.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesClassController {
  ClassModel? selectedClassModel;
  FeesCategoryModel? selectedMainCategoryModel;
  String selectedSubCategory = "";
  RxBool isLoading = RxBool(false);

  List<String> tokenList = [];

  final DocumentReference<Map<String, dynamic>> _fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  Future<List<ClassModel>> getAllClasses() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await _fStore.collection("classes").get();
      final allClass =
          data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      return allClass;
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  Future<List<FeesCategoryModel>> fetchCategoryList(
      {required String classId}) async {
    if (selectedClassModel == null) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classId)
          .collection("ClassFees")
          .get();
      return data.docs.map((e) => FeesCategoryModel.fromMap(e.data())).toList();
    } catch (e) {
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  Future<List<FeesModel>> fetchSubCategoryList({
    required ClassModel classModel,
    required FeesCategoryModel mainCategoryModel,
  }) async {
    if (selectedMainCategoryModel == null || selectedClassModel == null) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classModel.docid)
          .collection("ClassFees")
          .doc(mainCategoryModel.id)
          .collection("SubCategory")
          .get();
      return data.docs.map((e) => FeesModel.fromMap(e.data())).toList();
    } on FirebaseException catch (e) {
      showToast(msg: e.code);
      return [];
    }
  }

  //get all students from class
  Future<List<AddStudentModel>> getAllStudentsFromClass(String classId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classId)
          .collection("Students")
          .get();
      final List<AddStudentModel> allClassStudents =
          data.docs.map((e) => AddStudentModel.fromMap(e.data())).toList();

      allClassStudents.sort((a, b) => a.studentName!
          .toLowerCase()
          .compareTo(b.studentName?.toLowerCase() ?? ""));
      return allClassStudents;
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  Future<FeesModel?> getFeesCategoryData(
      {required String feesCategoryId,
      required String classId,
      required feesSubCategoryId}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classId)
          .collection("ClassFees")
          .doc(feesCategoryId)
          .collection("SubCategory")
          .get();
      final QueryDocumentSnapshot<Map<String, dynamic>> result =
          data.docs.firstWhere((element) => element.id == feesSubCategoryId);

      final datas = FeesModel.fromMap(result.data());

      return datas;
    } on FirebaseException catch (e) {
      showToast(msg: e.code);
      log(e.toString());
      return null;
    }
  }

  Future<void> addStudentToFeePaid({
    required String categoryId,
    required String subCategoryId,
    required String classId,
    required String studentId,
  }) async {
    await _fStore
        .collection("classes")
        .doc(classId)
        .collection("ClassFees")
        .doc(categoryId)
        .collection("SubCategory")
        .doc(subCategoryId)
        .update({
      "studentList": FieldValue.arrayUnion([
        {
          "collectedAmount": "",
          "studentId": studentId,
          "totalAmount": "",
        }
      ])
    }).catchError(
      (error) => showToast(
        msg: (error as FirebaseException).code,
      ),
    );
  }

  Future<void> removeStudentToFeePaid({
    required String categoryId,
    required String subCategoryId,
    required String classId,
    required String studentId,
  }) async {
    await _fStore
        .collection("classes")
        .doc(classId)
        .collection("ClassFees")
        .doc(categoryId)
        .collection("SubCategory")
        .doc(subCategoryId)
        .update({
      "studentList": FieldValue.arrayRemove([
        {
          "collectedAmount": "",
          "studentId": studentId,
          "totalAmount": "",
        }
      ])
    }).catchError(
      (error) => showToast(
        msg: (error as FirebaseException).code,
      ),
    );
  }

  //create all tokens
  Future<void> fetchAllTokenList({required String classId}) async {
    try {
      await fetchTokensForCollection(classId, "Students");
      await fetchTokensForCollection(classId, "ParentCollection");
      await fetchTokensForCollection(classId, "GuardianCollection");
    } on FirebaseException catch (e) {
      log(e.toString());
      showToast(msg: e.toString());
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  Future<void> fetchTokensForCollection(
      String docId, String collectionName) async {
    final QuerySnapshot<Map<String, dynamic>> collectionResult = await _fStore
        .collection("classes")
        .doc(docId)
        .collection(collectionName)
        .get();

    for (var element in collectionResult.docs) {
      String? deviceToken = element.data()["deviceToken"];

      if (deviceToken == null || deviceToken.isEmpty) {
        continue;
      }

      if (!tokenList.contains(deviceToken)) {
        tokenList.add(deviceToken);
      }
    }
  }

  Future<void> sendClassFeesNotification({
    required String dueDate,
    required String amount,
    required String categoryName,
    required String classId,
  }) async {
    await fetchAllTokenList(classId: classId).then((value) async {
      for (var element in tokenList) {
        //send push notification from push notification
        await sendPushMessage(
          element,
          "Due Date : $dueDate Amount : $amount",
          categoryName,
        );
      }
    });
  }
}
