import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/loginHistory_model/login_history_model.dart';
import '../../view/web/login/admin/admin_DashBoard/admin_dashborad_screen.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AdminLoginScreenController extends GetxController {
  final GlobalKey<FormState> _secondFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _forgetFormkey = GlobalKey<FormState>();

  String schoolID = schoolListValue?['docid'];
  String schoolName = schoolListValue?['schoolName'];
  // String batchYearID = schoolBatchYearListValue?['id'] ?? '';

  TextEditingController schoolIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginFunction(
    BuildContext context,
  ) async {
    try {
      final firebaseFirestore = FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(schoolID);
      log("start");
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: schoolIdController.text.trim(),
              password: passwordController.text.trim())
          .then((value) async {
        QuerySnapshot<Map<String, dynamic>> result = await firebaseFirestore
            .collection('Admins')
            .where('docid', isEqualTo: value.user!.uid)
            .get();
//>> Checking batch Yeard

        if (schoolID == value.user!.uid || result.docs.isNotEmpty) {

          if (Get.find<GetFireBaseData>().bYear.value.isNotEmpty) {
            LoginTimeIDSavingClass.emailId = schoolIdController.text.trim();
            // Login user

            log(LoginTimeIDSavingClass.emailId);

            final date = DateTime.now();
            DateTime parseDate = DateTime.parse(date.toString());
            final DateFormat formatter = DateFormat('dd-MM-yyyy');
            String formatted = formatter.format(parseDate);
            LoginTimeIDSavingClass.date = formatted;
            final time = DateTime.now().toString();
            LoginTimeIDSavingClass.id = time;
            firebaseFirestore
                .collection(Get.find<GetFireBaseData>().bYear.value)
                .doc(Get.find<GetFireBaseData>().bYear.value)
                .collection("LoginHistory")
                .doc(LoginTimeIDSavingClass.date)
                .set({'id': LoginTimeIDSavingClass.date,'docid':DateTime.now()}).then((value) {
              firebaseFirestore
                  .collection(Get.find<GetFireBaseData>().bYear.value)
                  .doc(Get.find<GetFireBaseData>().bYear.value)
                  .collection("LoginHistory")
                  .doc(LoginTimeIDSavingClass.date)
                  .collection(LoginTimeIDSavingClass.date)
                  .doc(LoginTimeIDSavingClass.id)
                  .set(
                {

                  'adminuser': LoginTimeIDSavingClass.emailId,
                  'loginTime': LoginTimeIDSavingClass.id
                },
                SetOptions(merge: true),
              ).then((value) {
                          schoolIdController.clear();
          passwordController.clear();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AdminDashBoardPage(
                      schoolID: schoolID,
                    );
                  },
                ));
              });
            });
          } else {
            //Setting batch year

            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return Form(
                  key: _secondFormkey,
                  child: AlertDialog(
                    title: const Text('Add BatchYear'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (applynewBatchYearContoller.text.isEmpty) {
                                  return 'Invalid';
                                } else {
                                  return null;
                                }
                              },
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
                              validator: (value) {
                                if (selectedToDaterContoller.text.isEmpty) {
                                  return 'Invalid';
                                } else {
                                  return null;
                                }
                              },
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
                        child: const Text('Cancel'),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('create'),
                        onPressed: () async {
                          if (_secondFormkey.currentState!.validate()) {
                            await firebaseFirestore
                                .collection("BatchYear")
                                .doc(
                                    '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                                .set({
                              'id':
                                  '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                            }).then((value) async {
                              await firebaseFirestore.set({
                                'batchYear':
                                    "${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}"
                              }, SetOptions(merge: true)).then(
                                  (value) => html.window.location.reload());
                            });
                          }
                        },
                      ),
                    ],
                  ),
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
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }).catchError((e) {
        log(e.toString());
        return showToast(msg: 'Login Failed');
      });

      log("end");
    } on FirebaseException {
      log("catchout");

      showToast(msg: 'Login Failed');
    }
  }

  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  final Rxn<DateTime> _selectedDateForApplyDate = Rxn<DateTime>();
  final Rxn<DateTime> _selectedToDate = Rxn<DateTime>();
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

  Future<void> forgetPassWord(BuildContext context) async {
    try {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          TextEditingController emailController = TextEditingController();
          return Form(
            key: _forgetFormkey,
            child: AlertDialog(
              title: const Text('Reset your password ?'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Center(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Enter your email'),
                        validator: (value) {
                          if (emailController.text.isEmpty) {
                            return 'Invalid';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () async {
                    if (_forgetFormkey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: emailController.text.trim())
                          .then((value) {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            TextEditingController emailController =
                                TextEditingController();
                            return AlertDialog(
                              title: const Text('Reset Password ?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Center(
                                        child: Text(
                                            "We have sent a link Please check your email"))
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }).catchError((e) {
                        return showToast(msg: 'Invalid Check Email');
                      });
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {}
  }
}
