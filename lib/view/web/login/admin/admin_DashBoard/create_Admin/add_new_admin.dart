// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/text_form_hide/password_filed.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class AddNewAdmin extends StatefulWidget {
  String schoolID;

  AddNewAdmin({super.key, required this.schoolID});

  @override
  State<AddNewAdmin> createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  final _hideGetxController = Get.put(PasswordField());
  bool loadingStatus = false;
  String adminpassword = '';

  TextEditingController employeeIDController = TextEditingController();

  TextEditingController adminUserNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getAdminDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(adminpassword);
    log(widget.schoolID);
    var screenSize = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: widget.schoolID == TeacherLoginIDSaver.findUser
            ? Scaffold(
                backgroundColor: const Color.fromARGB(255, 6, 71, 157),
                body: SingleChildScrollView(
                  child: Row(
                    children: [
                      Container(
                        height: screenSize.height,
                        width: screenSize.width * 1 / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButtonBackWidget(color: cWhite),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Create New Admin',
                                      style: GoogleFont.headTextStyleBold),
                                  sizedBoxH20,
                                  SizedBox(
                                    height: 300,
                                    width: screenSize.width / 2,
                                    child: LottieBuilder.network(
                                        'https://assets10.lottiefiles.com/packages/lf20_SPA6bgo7nO.json'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: const Color.fromARGB(255, 6, 71, 157),
                      ),
                      Container(
                        //  margin: EdgeInsets.only(top: 50.h),
                        color: Colors.white,
                        height: screenSize.height,
                        width: screenSize.width * 1 / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                sizedBoxH30,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter a valid Name';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: adminUserNameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Admin UserName',
                                    ),
                                  ),
                                ),
                                sizedBoxH10,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter a valid Employee ID';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: employeeIDController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Employee ID',
                                    ),
                                  ),
                                ),
                                sizedBoxH10,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 4) {
                                        return 'Please enter a valid Password';
                                      } else {
                                        return null;
                                      }
                                    },
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                ),
                                sizedBoxH10,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (passwordController.text.trim() !=
                                          confirmPasswordController.text
                                              .trim()) {
                                        return 'Password are Incorrect!!';
                                      } else {
                                        return null;
                                      }
                                    },
                                    obscureText: true,
                                    controller: confirmPasswordController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Confirm Password',
                                    ),
                                  ),
                                ),
                                sizedBoxH10,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (input) => input!.isValidEmail()
                                        ? null
                                        : "Please Enter a vaild email id",
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
                                  ),
                                ),
                                sizedBoxH10,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: checkFieldPhoneNumberIsValid,
                                    controller: phoneNumberController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Phone Number',
                                    ),
                                  ),
                                ),
                                sizedBoxH30,
                                (loadingStatus == true)
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Container(
                                        height: screenSize.width * 1 / 30,
                                        width: screenSize.width * 1 / 6,
                                        decoration: BoxDecoration(
                                            color: adminePrimayColor,
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            padding: const EdgeInsets.all(9.0),
                                            textStyle:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                    .validate() &&
                                                widget.schoolID ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid) {
                                              createNewAdmin(
                                                  adminUserNameController.text
                                                      .trim(),
                                                  employeeIDController.text
                                                      .trim(),
                                                  passwordController.text
                                                      .trim(),
                                                  emailController.text.trim(),
                                                  phoneNumberController.text
                                                      .trim());
                                            } else {
                                              return;
                                            }
                                          },
                                          child: const Text('Create'),
                                        ),
                                      ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            :  Scaffold(
              appBar: AppBar(backgroundColor: Colors.transparent,),
                body: const Center(
                  child: Text(
                    "Sorry you are not a main Admin",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ));
  }

  createNewAdmin(String username, String employeeID, String password,
      String email, String phno) async {
    setState(() {
      loadingStatus = true;
    });

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance
            .collection('SchoolListCollection')
            .doc(widget.schoolID)
            .collection('Admins')
            .doc(value.user!.uid)
            .set({
              'docid': value.user!.uid,
              'username': username,
              'employeeID': employeeID,
              'password': password,
              'email': email,
              'phoneNumber': phno
            })
            .then((value) => showToast(msg: 'New Admin Created'))
            .then((value) => {
                  employeeIDController.clear(),
                  adminUserNameController.clear(),
                  passwordController.clear(),
                  emailController.clear(),
                  phoneNumberController.clear(),
                  confirmPasswordController.clear()
                }).then((value) => Navigator.pop(context));
      });
    } catch (e) {
      log('Create admin  $e');
    }

    setState(() {
      loadingStatus = false;
    });
  }

  void getAdminDetail() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .get();
    setState(() {
      adminpassword = vari.data()!['password'];
    });
  }
}
