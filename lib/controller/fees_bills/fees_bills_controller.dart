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

import '../../model/create_classModel/add_student_model.dart';
import '../../utils/utils.dart';

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
  final Uuid uuid = const Uuid();

  Map<String, dynamic> categoryMap = {};
  String categoryCreateValue = "";
  String selectedPeriod = "";
  RxString selectedType = RxString("");
  RxList<String> selectDateList = RxList([]);
  List<ClassModel> allClass = [];
  List<AddStudentModel> allClassStudents = [];

  List<String> tokenList = [];
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  final List<String> selectionList = [
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

  Future<void> getAllClasses() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("classes").get();
      allClass = data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

//get all students from class
  Future<void> getAllStudentsFromClass(String classId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await fStore
          .collection("classes")
          .doc(classId)
          .collection("Students")
          .get();
      allClassStudents =
          data.docs.map((e) => AddStudentModel.fromMap(e.data())).toList();
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  //create category
  Future<void> createFeesCategory(
    String categoryName,
    String categoryType,
    BuildContext context,
  ) async {
    try {
      if (categoryCreateValue.isEmpty) {
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
        categoryCreateValue = "";
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

  //creatin fee

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
          await fetchAllTokenList().then((value) async {
            log("create time ${tokenList.toString()}");
            for (var element3 in tokenList) {
              await sendPushMessage(element3, "Fees", "Fees");
            }
          });
        });
      }
      categoryCreateloading.value = false;
    } catch (e) {
      categoryCreateloading.value = false;
      showToast(msg: "Something Went Wrong");
      log(e.toString());
    }
  }


//create all tokens
  Future<void> fetchAllTokenList() async {
    try {
      log("all class ${allClass.toString()}");

      for (var element in allClass) {
        //fetching all students data
        final QuerySnapshot<Map<String, dynamic>> studentResult = await fStore
            .collection("classes")
            .doc(element.docid)
            .collection("Students")
            .get();
        for (var element1 in studentResult.docs) {
          String? deviceToken = element1.data()["deviceToken"];
          if (deviceToken == null || deviceToken.isEmpty) {
            continue;
          }
          if (!tokenList.contains(element1.data()["deviceToken"])) {
            tokenList.add(element1.data()["deviceToken"]);
          }
        }

        //fetching all parent data
        final QuerySnapshot<Map<String, dynamic>> parentResult = await fStore
            .collection("classes")
            .doc(element.docid)
            .collection("ParentCollection")
            .get();
        for (var element1 in parentResult.docs) {
          String? deviceToken = element1.data()["deviceToken"];

          if (deviceToken == null || deviceToken.isEmpty) {
            continue;
          }
          if (!tokenList.contains(element1.data()["deviceToken"])) {
            tokenList.add(element1.data()["deviceToken"]);
          }
        }

        //fetch all guardian dta
        final QuerySnapshot<Map<String, dynamic>> guardianResult = await fStore
            .collection("classes")
            .doc(element.docid)
            .collection("GuardianCollection")
            .get();
        for (var element1 in guardianResult.docs) {
          String? deviceToken = element1.data()["deviceToken"];
          if (deviceToken == null || deviceToken.isEmpty) {
            continue;
          }
          if (!tokenList.contains(element1.data()["deviceToken"])) {
            tokenList.add(element1.data()["deviceToken"]);
          }
        }
        log("token array ${tokenList.toString()}");
      }
    } on FirebaseException catch (e) {
      log(e.toString());
      showToast(msg: e.toString());
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }
}
