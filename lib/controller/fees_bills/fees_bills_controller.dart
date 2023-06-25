import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/class_model/class_model.dart';
import 'package:dujo_kerala_website/model/fees_bills_model/fees_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FeesBillsController extends GetxController {
  @override
  void onInit() async {
    await getAllClasses();
    super.onInit();
  }

  RxBool categoryCreateloading = RxBool(false);
  RxBool categoryFetchloading = RxBool(false);
  final DocumentReference<Map<String, dynamic>> fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  ///for unique id creation
  final Uuid uuid = const Uuid();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

//category create section variables

//category name dropdown selected category
  Map<String, dynamic> selectedCategory = {};

  ///selected category type[typeOfCategoryList]
  String selectedTypeOfCategory = "";
//selected period from
  String selectedPeriod = "";

  ///category creation varibles
  RxString selectedType = RxString("");
  RxList<String> selectDateList = RxList([]);
  List<ClassModel> allClass = [];
  List<String> tokenList = [];
//this for add category only selected class if this value is true then selected school dropdown will show
  RxBool isSpecificClassOnly = RxBool(false);
  ClassModel? selectedClass;

  final List<String> typeOfCategoryList = [
    'Monthly',
    'Quarterly',
    'Halfly',
    'Annually',
  ];

  List<String> monthly = <String>[
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<String> quarterly = <String>[
    "Jan-Mar",
    "Apr-Jun",
    "Jul-Sep",
    "Oct-Dec",
  ];
  List<String> halfYearly = <String>[
    "Jan-Jun",
    "Jul-Dec",
  ];

  //fetch all classes

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

  //create category
  Future<void> createFeesCategory(
    String categoryName,
    String categoryType,
    BuildContext context,
  ) async {
    try {
      if (selectedTypeOfCategory.isEmpty) {
        return showToast(msg: "Please select category");
      }
      categoryCreateloading.value = true;
      //checking category exist or not
      final datas = await fStore
          .collection("Fees")
          .where("categoryName", isEqualTo: categoryName)
          .get();
      if (datas.docs.isNotEmpty) {
        categoryCreateloading.value = false;
        return showToast(msg: "Failed Category already exists");
      }
//creating new category
      final String uid = "$categoryName${uuid.v1()}";
      fStore.collection("Fees").doc(uid).set(
        {
          "categoryName": categoryName,
          "type": categoryType,
          "id": uid,
        },
      ).then((value) {
        showToast(msg: "Successfully Created");
        selectedTypeOfCategory = "";
        categoryNameController.clear();
        Navigator.pop(context);
      });

      categoryCreateloading.value = false;
    } catch (e) {
      categoryCreateloading.value = false;
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  //fetch category list

  Future<List<Map<String, dynamic>>> fetchCategoryList() async {
    try {
      categoryFetchloading.value = true;

      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("Fees").get();
      categoryFetchloading.value = false;
      return data.docs.map((e) => e.data()).toList();
    } catch (e) {
      showToast(msg: "Something went wrong");
      categoryFetchloading.value = false;
      return [];
    }
  }

  //creatin fees for all class
  Future<void> createFeesForAllClass(
    String categoryId,
    String categoryName,
    String amount,
    String dueDate,
    String type,
  ) async {
    try {
      categoryCreateloading.value = true;
      for (var element in allClass) {
        fStore
            .collection("Fees")
            .doc(categoryId)
            .collection("Classes")
            .doc(element.docid)
            .set(
              FeesModel(
                  categoryId: categoryId,
                  categoryName: categoryName,
                  amount: amount,
                  dueDate: dueDate,
                  classId: element.docid,
                  className: element.className,
                  type: type,
                  studentList: []).toMap(),
            )
            .then((value) async {
          showToast(msg: "Successfully Completed");
        });
      }
      categoryCreateloading.value = false;
    } catch (e) {
      categoryCreateloading.value = false;
      showToast(msg: "Something Went Wrong");
      log(e.toString());
    }
  }

//fees created only specific class
  Future<void> createFeesForSpecificClass(
      String categoryId,
      String categoryName,
      String amount,
      String dueDate,
      String type,
      ClassModel classModel) async {
    categoryCreateloading.value = true;
    fStore
        .collection("classes")
        .doc(classModel.docid)
        .collection("ClassFees")
        .doc(categoryId)
        .set(
          FeesModel(
              categoryId: categoryId,
              categoryName: categoryName,
              amount: amount,
              dueDate: dueDate,
              classId: classModel.docid,
              className: classModel.className,
              type: type,
              studentList: []).toMap(),
        )
        .then((value) async {
      showToast(msg: "Successfully Completed");
      categoryCreateloading.value = false;
      selectedClass = null;
    }).catchError((error) {
      categoryCreateloading.value = false;
      showToast(msg: (error as FirebaseException).code);
      log(error.toString());
    });
  }

//create all tokens
  Future<void> fetchAllTokenList() async {
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

      if (!tokenList.contains(deviceToken)) {
        tokenList.add(deviceToken);
      }
    }
  }
}

// //creating token lists parent,guardian,students
//       await fetchAllTokenList().then((value) async {
//         log("create time ${tokenList.toString()}");
//         for (var element3 in tokenList) {
//           //send push notification from push notification
//           await sendPushMessage(element3,
//               "Due Date : $dueDate Amount : $amount", categoryName);
//         }
//       });
