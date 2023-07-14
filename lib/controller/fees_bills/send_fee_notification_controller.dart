import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/class_model/class_model.dart';
import '../../utils/utils.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesNotificationController extends GetxController {
  //fetching all classes for creating fees
  List<ClassModel> allClass = [];
  List<String> tokenListSchool = [];
  List<String> tokenListClass = [];

  final DocumentReference<Map<String, dynamic>> fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  Future<List<ClassModel>> getAllClasses() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("classes").get();
      allClass = data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      return allClass;
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  //create all tokens
  Future<void> fetchAllTokenList() async {
    await getAllClasses();
    try {
      for (var element in allClass) {
        await fetchTokensForCollection(element.docid, "Students");
        await fetchTokensForCollection(element.docid, "ParentCollection");
        await fetchTokensForCollection(element.docid, "GuardianCollection");
      }
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
    final QuerySnapshot<Map<String, dynamic>> collectionResult = await fStore
        .collection("classes")
        .doc(docId)
        .collection(collectionName)
        .get();

    for (var element in collectionResult.docs) {
      String? deviceToken = element.data()["deviceToken"];

      if (deviceToken == null || deviceToken.isEmpty) {
        continue;
      }

      if (!tokenListSchool.contains(deviceToken)) {
        tokenListSchool.add(deviceToken);
      }
    }
  }

  Future<void> sendAllClassFeesNotification({
    required String dueDate,
    required String amount,
    required String categoryName,
  }) async {
    await fetchAllTokenList().then((value) async {
      log("create time ${tokenListSchool.toString()}");
      for (var element3 in tokenListSchool) {
        //send push notification from push notification
        log(element3);
        await sendPushMessage(
          element3,
          "Due Date : $dueDate Amount : $amount",
          categoryName,
        ).then((value) => tokenListSchool.remove(element3));
      }
    });
  }

  //class wise--------------------------------------------------------
  //create all tokens
  Future<void> fetchAllTokenListClass({required String classId}) async {
    try {
      await fetchTokensForCollectionClass(classId, "Students");
      await fetchTokensForCollectionClass(classId, "ParentCollection");
      await fetchTokensForCollectionClass(classId, "GuardianCollection");
    } on FirebaseException catch (e) {
      log(e.toString());
      showToast(msg: e.toString());
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  Future<void> fetchTokensForCollectionClass(
      String docId, String collectionName) async {
    final QuerySnapshot<Map<String, dynamic>> collectionResult = await fStore
        .collection("classes")
        .doc(docId)
        .collection(collectionName)
        .get();

    for (var element in collectionResult.docs) {
      String? deviceToken = element.data()["deviceToken"];

      if (deviceToken == null || deviceToken.isEmpty) {
        continue;
      }

      if (!tokenListClass.contains(deviceToken)) {
        tokenListClass.add(deviceToken);
      }
    }
  }

  Future<void> sendClassFeesNotificationClass({
    required String dueDate,
    required String amount,
    required String categoryName,
    required String classId,
  }) async {
    await fetchAllTokenListClass(classId: classId).then((value) async {
      for (var element in tokenListClass) {
        //send push notification from push notification
        await sendPushMessage(
          element,
          "Due Date : $dueDate Amount : $amount",
          categoryName,
        ).then((value) => tokenListClass.remove(element));
      }
    });
  }
}
