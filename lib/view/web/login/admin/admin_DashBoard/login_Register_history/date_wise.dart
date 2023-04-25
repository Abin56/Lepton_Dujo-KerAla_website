import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/login_Register_history/login_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../constant/constant.dart';

class DateWiseLoginScreen extends StatefulWidget {
  var schoolID;
  DateWiseLoginScreen({required this.schoolID, super.key});

  @override
  State<DateWiseLoginScreen> createState() => _DateWiseLoginScreenState();
}

class _DateWiseLoginScreenState extends State<DateWiseLoginScreen> {
  bool passwordVisible = false;
  String adminpassword = '';

  @override
  void initState() {
    getAdminDetail();
    super.initState();
  }

  Widget build(BuildContext context) {
    log(widget.schoolID);
    return Scaffold(
      appBar: AppBar(backgroundColor: adminePrimayColor,title: const Text("Admin Login Register (Date-Wise)"),),
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("SchoolListCollection")
                  .doc(Get.find<AdminLoginScreenController>().schoolID)
                  .collection(
                      Get.find<GetFireBaseData>().bYear.value)
                  .doc(Get.find<GetFireBaseData>().bYear.value)
                  .collection("LoginHistory")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AdminLoginDetailsScreen(
                                  schoolID: widget.schoolID,
                                  dateId: snapshot.data!.docs[index]['id'],
                                );
                              },
                            ));
                          },
                          child: Container(
                            color: Color.fromARGB(255, 117, 182, 212),
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.drive_file_move_sharp),
                                  sizedBoxw10,
                                  Text(snapshot.data!.docs[index]['id']),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Clear all the data?'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        "Clear all the data registered on ${snapshot.data!.docs[index]['id']}. ")
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(onPressed: (){Navigator.of(
                                                                          context)
                                                                      .pop();}, child: Text("Cancel")),
                                                TextButton(
                                                  child: const Text('ok'),
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible:
                                                          false, // user must tap button!
                                                      builder: (BuildContext
                                                          context) {
                                                        TextEditingController
                                                            _schoolId =
                                                            TextEditingController();
                                                        TextEditingController
                                                            _password =
                                                            TextEditingController();
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Authorization'),
                                                          content:
                                                              SingleChildScrollView(
                                                            child: ListBody(
                                                              children: <
                                                                  Widget>[
                                                                const Text(
                                                                    "Enter ID and Password"),
                                                                sizedBoxH10,
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _schoolId,
                                                                    obscureText:
                                                                        passwordVisible,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      suffixIcon:
                                                                          IconButton(
                                                                        icon: Icon(passwordVisible
                                                                            ? Icons.visibility
                                                                            : Icons.visibility_off),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                            () {
                                                                              passwordVisible = !passwordVisible;
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      labelText:
                                                                          'ID',
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _password,
                                                                    obscureText:
                                                                        passwordVisible,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      suffixIcon:
                                                                          IconButton(
                                                                        icon: Icon(passwordVisible
                                                                            ? Icons.visibility
                                                                            : Icons.visibility_off),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                            () {
                                                                              passwordVisible = !passwordVisible;
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      labelText:
                                                                          'ID',
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                  'ok'),
                                                              onPressed:
                                                                  () async {
                                                                if (_schoolId
                                                                            .text
                                                                            .trim() ==
                                                                        widget
                                                                            .schoolID &&
                                                                    _password
                                                                            .text
                                                                            .trim() ==
                                                                        adminpassword) {
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "SchoolListCollection")
                                                                      .doc(Get.find<
                                                                              AdminLoginScreenController>()
                                                                          .schoolID)
                                                                      .collection(
                                                                       Get.find<GetFireBaseData>().bYear.value)
                                                                      .doc(Get.find<GetFireBaseData>().bYear.value)
                                                                      .collection(
                                                                          "LoginHistory")
                                                                      .doc(snapshot
                                                                          .data!
                                                                          .docs[index]['id'])
                                                                      .delete();

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                } else {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false, // user must tap button!
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'Wrong password'),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              ListBody(
                                                                            children: <Widget>[],
                                                                          ),
                                                                        ),
                                                                        actions: <
                                                                            Widget>[
                                                                          TextButton(
                                                                            child:
                                                                                const Text('ok'),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();
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
                                                              child: const Text(
                                                                  'cancel'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.more_vert_rounded))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshot.data!.docs.length);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
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
