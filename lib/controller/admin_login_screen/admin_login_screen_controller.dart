import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'dart:html' as html;

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
  DocumentReference<Map<String, dynamic>> schoolListCollectionRefDoc =
      FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(schoolListValue!['id']);

  ///
  ///
  ///
  Future<void> loginFunction(BuildContext context, String adminSchooID) async {
//Get school id and password>>>>>>>>>>
    final getidpass = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolID)
        .get();

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

    if (getidpass.data()!['id'] == schoolIdController.text.trim() &&
            getidpass.data()!['password'] == passwordController.text.trim() &&
            adminSchooID == schoolIdController.text.trim() ||
        adminPassdocDataa.isNotEmpty && adminIDdocData.isNotEmpty) {
      if (Get.find<GetFireBaseData>().bYear.value.isNotEmpty) {
        final date = DateTime.now();
        DateTime parseDate = DateTime.parse(date.toString());
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        String formatted = formatter.format(parseDate);
        LoginTimeIDSavingClass.date = formatted;
        final time = DateTime.now().toString();
        LoginTimeIDSavingClass.id = time;

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
                    log("idddddddd${LoginTimeIDSavingClass.id.toString()}"),
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
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add BatchYear'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: applynewBatchYearContoller,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: const InputDecoration(
                          labelText: 'DD-MM-YYYY',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_downward_outlined),
                    Expanded(
                      child: TextFormField(
                        controller: selectedToDaterContoller,
                        readOnly: true,
                        onTap: () => _selectToDate(context),
                        decoration: const InputDecoration(
                          labelText: 'To',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('create'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('create'),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection("SchoolListCollection")
                        .doc(schoolID)
                        .collection("BatchYear")
                        .doc(
                            '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                        .set({
                      'id':
                          '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                    }).then((value) async {
                      await FirebaseFirestore.instance
                          .collection("SchoolListCollection")
                          .doc(schoolID)
                          .set({
                        'batchYear':
                            "${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}"
                      }, SetOptions(merge: true)).then(
                              (value) => html.window.location.reload());
                    });
                  },
                ),
              ],
            );
          },
        );
      }
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
                children: const <Widget>[
                  Text('Please enter a valid username and password')
                ],
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

  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  Rxn<DateTime> _selectedDateForApplyDate = Rxn<DateTime>();
  Rxn<DateTime> _selectedToDate = Rxn<DateTime>();
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateForApplyDate.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDateForApplyDate.value) {
      _selectedDateForApplyDate.value = picked;
      DateTime parseDate =
          DateTime.parse(_selectedDateForApplyDate.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM');
      String formatted = formatter.format(parseDate);

      applynewBatchYearContoller.text = formatted.toString();
      log(formatted.toString());
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedToDate.value) {
      _selectedToDate.value = picked;
      DateTime parseDate = DateTime.parse(_selectedToDate.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM');
      String formatted = formatter.format(parseDate);

      selectedToDaterContoller.text = formatted.toString();
      log(formatted.toString());
    }
  }
}
