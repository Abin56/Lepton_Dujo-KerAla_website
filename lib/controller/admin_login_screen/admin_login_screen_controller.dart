import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/loginHistory_model/login_history_model.dart';
import '../../view/web/login/admin/admin_DashBoard/admin_dashborad_screen.dart';
import '../../view/web/widgets/drop_DownList/get_batchYear.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AdminLoginScreenController extends GetxController {
  
  String schoolID = schoolListValue?['id'];
   String schoolName = schoolListValue?['schoolName'];
  String batchYearID = schoolBatchYearListValue?['id'] ?? '';

  TextEditingController schoolIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CollectionReference schoolListCollectionRef =
      FirebaseFirestore.instance.collection("SchoolListCollection");

  ///
  ///
  ///
  void loginFunction(BuildContext context) async {
    final _time = DateTime.now().toString();
    LoginTimeIDSavingClass.id = _time;
    //>>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    Query query = schoolListCollectionRef.where("schoolID",
        isEqualTo: schoolIdController.text.trim());
    QuerySnapshot querySnapshot = await query.get();
    final docData = querySnapshot.docs.map((doc) => doc.data()).toList();
    log(query.toString());
    log(docData.toString());
    //
    //>>>>>>>>>>>>>>>>>>>Checking password<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    Query queries = schoolListCollectionRef.where("password",
        isEqualTo: passwordController.text.trim());
    QuerySnapshot querySnapshott = await queries.get();
    final docDataa = querySnapshott.docs.map((doc) => doc.data()).toList();
    log(query.toString());
    log(docDataa.toString());

    // for Other Admins//////

    CollectionReference adminID =
        schoolListCollectionRef.doc(schoolID).collection("Admins");
    Query adminIDquery =
        adminID.where("email", isEqualTo: schoolIdController.text.trim());
    QuerySnapshot adminquerySnapshot = await adminIDquery.get();
    final adminIDdocData =
        adminquerySnapshot.docs.map((doc) => doc.data()).toList();
    //>>>>>>>>>>>>>>>>>>>Checking password<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    CollectionReference adminpassword =
        schoolListCollectionRef.doc(schoolID).collection("Admins");
    Query adminPassquries = adminpassword.where("password",
        isEqualTo: passwordController.text.trim());
    QuerySnapshot adminPassquerySnapshott = await adminPassquries.get();
    final adminPassdocDataa =
        adminPassquerySnapshott.docs.map((doc) => doc.data()).toList();
    log(query.toString());
    log(docDataa.toString());

    if (docDataa.isNotEmpty && docData.isNotEmpty ||
        adminPassdocDataa.isNotEmpty && adminIDdocData.isNotEmpty) {
      final date = DateTime.now();
      DateTime parseDate = DateTime.parse(date.toString());
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(parseDate);
      LoginTimeIDSavingClass.date = formatted;

      await schoolListCollectionRef
          .doc(schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("LoginHistory")
          .doc(LoginTimeIDSavingClass.date)
          .set({'id': LoginTimeIDSavingClass.date}).then((value) {
        schoolListCollectionRef
            .doc(schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("LoginHistory")
            .doc(LoginTimeIDSavingClass.date)
            .collection(LoginTimeIDSavingClass.date)
            .doc(LoginTimeIDSavingClass.id)
            .set({
          'adminuser': schoolIdController.text.trim(),
          'loginTime': LoginTimeIDSavingClass.id
        }).then((value) => {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AdminDashBoardPage(
                        schoolID: schoolID,
                      );
                    },
                  ))
                });
      });
    } else {
      return
          // ignore: use_build_context_synchronously
          showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Message'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[Text('Wrong Password')],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
