// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Widget build(BuildContext context) {
    log(adminpassword);
    log(widget.schoolID);
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 71, 157),
        // appBar: AppBar(
        //     backgroundColor: const Color.fromARGB(255, 6, 71, 157),
        //     title: Text(
        //       'ADD NEW ADMIN ',
        //       style: GoogleFonts.montserrat(
        //         fontSize: 18,
        //         fontWeight: FontWeight.w700,
        //         color: cWhite,
        //       ),
        //     )),
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
                color: Colors.white,
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a valid Name';
                            } else {
                              return null;
                            }
                          },
                          controller: adminUserNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Admin UserName',
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a valid Employee ID';
                            } else {
                              return null;
                            }
                          },
                          controller: employeeIDController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Employee ID',
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter a valid Password';
                            } else {
                              return null;
                            }
                          },
                          obscureText:true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              return 'Password are Incorrect!!';
                            } else {
                              return null;
                            }
                          },
                          obscureText:true,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (input) => input!.isValidEmail()
                              ? null
                              : "Please Enter a vaild email id",
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: checkFieldPhoneNumberIsValid,
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Container(
                        height: screenSize.width * 1 / 30,
                        width: screenSize.width * 1 / 6,
                        decoration: BoxDecoration(
                            color: adminePrimayColor,
                            borderRadius: BorderRadius.circular(14)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(9.0),
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  TextEditingController _schoolId =
                                      TextEditingController();
                                  TextEditingController _password =
                                      TextEditingController();
                                  return AlertDialog(
                                    title: const Text('Authorization'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text("Enter ID and Password"),
                                          sizedBoxH10,
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Obx(() => TextFormField(
                                                  controller: _schoolId,
                                                  obscureText:
                                                      _hideGetxController
                                                          .isObscurefirst.value,
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(_hideGetxController
                                                              .isObscurefirst
                                                              .value
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off),
                                                      onPressed: () {
                                                        _hideGetxController
                                                            .toggleObscureFirst();
                                                      },
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'ID',
                                                  ),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Obx(() => TextFormField(
                                                  controller: _password,
                                                  obscureText:
                                                      _hideGetxController
                                                          .isObscurefirst
                                                          .value,
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(_hideGetxController
                                                              .isObscurefirst 
                                                              .value
                                                          ? Icons
                                                              .visibility_off
                                                          :Icons.visibility ),
                                                      onPressed: () {
                                                        _hideGetxController
                                                            .toggleObscureSecond();
                                                      },
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Password',
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('ok'),
                                        onPressed: () async {
                                          if (_schoolId.text.trim() ==
                                                  widget.schoolID &&
                                              _password.text.trim() ==
                                                  adminpassword) {
                                            createNewAdmin(
                                                adminUserNameController.text
                                                    .trim(),
                                                employeeIDController.text
                                                    .trim(),
                                                passwordController.text.trim(),
                                                emailController.text.trim(),
                                                phoneNumberController.text
                                                    .trim());
                                            Navigator.of(context).pop();
                                          } else {
                                            showDialog(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Wrong password'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('ok'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Text('Create'),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createNewAdmin(String username, String employeeID, String password,
      String email, String phno) {
    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Admins')
        .doc(email)
        .set({
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

