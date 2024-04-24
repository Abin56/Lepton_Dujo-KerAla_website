
import 'dart:developer';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/teacher/teacher_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/teachers_panel_screen.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../constant/constant.dart';
import '../../../../fonts/google_monstre.dart';
import '../../../widgets/button_container_widget.dart';
import '../../../widgets/drop_DownList/get_batchYear.dart';
import '../../../widgets/drop_DownList/get_classList.dart';

class AppBarTeachersPanel extends StatefulWidget {
  const AppBarTeachersPanel({
    super.key,
  });

  @override
  State<AppBarTeachersPanel> createState() => _AppBarTeachersPanelState();
}

  GetFireBaseData getFireBaseData = Get.put(GetFireBaseData());
  
  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
    TeacherModel teacherModel = TeacherModel();
  DateTime? _selectedDateForApplyDate;
  DateTime? _selectedToDate;

class _AppBarTeachersPanelState extends State<AppBarTeachersPanel> {
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  OverlayEntry? overlayEntry2;
  OverlayEntry? overlayEntry3;
  bool showOverlay = false;
  int index = 0;
  final layerLink = LayerLink();
  final textButtonFocusNode = FocusNode();
  final textButtonFocusNode1 = FocusNode();
  final textButtonFocusNode2 = FocusNode();

  @override
  void initState() {
    textButtonFocusNode.addListener(() {
      if (textButtonFocusNode.hasFocus) {
        _showOverlay(context, 0);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode1.addListener(() {
      if (textButtonFocusNode1.hasFocus) {
        _showOverlay(context, 1);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode2.addListener(() {
      if (textButtonFocusNode2.hasFocus) {
        _showOverlay(context, 2);
      } else {
        removeOverlay();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        color: Colors.white24,
        height: 70,
        width: double.infinity,
        child: Obx(() {
      if (getFireBaseData.bYear.value.isEmpty) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.network(
                  'https://assets1.lottiefiles.com/private_files/lf30_th74oywu.json',
                  height: 300,
                ),
                sizedBoxH30,
                Text(
                  'Please Set Your 👇 Academic Year ',
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxH20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100.h,
                      width: 300.w,
                      child: GetBatchYearListDropDownButton(
                        schoolID:
                            Get.find<AdminLoginScreenController>().schoolID,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        FirebaseFirestore.instance
                            .collection("SchoolListCollection")
                            .doc(
                                Get.find<AdminLoginScreenController>().schoolID)
                            .set({'batchYear': schoolBatchYearListValue!['id']},
                                SetOptions(merge: true)).then((value) async {
                          await getFireBaseData.getBatchYearId();
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ClassTeacherAdmin(
                                    teacherEmail: "widget.teacherEmail",
                                    teacherID: "widget.teacherID",
                                    schoolID:
                                        Get.find<AdminLoginScreenController>()
                                            .schoolID);
                              },
                            ),
                          );
                        });
                      },
                      child: ButtonContainerWidget(
                        curving: 20,
                        colorindex: 0,
                        height: 60.h,
                        width: 200.w,
                        child: Center(
                          child: Text(
                            "Set Academic Year",
                            style: GoogleFonts.montserrat(
                                fontSize: 15.w,
                                fontWeight: FontWeight.w600,
                                color: cWhite),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxH10,
                    TextButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Add Batch Year'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      TextFormField(
                                        controller: applynewBatchYearContoller,
                                        readOnly: true,
                                        onTap: () => _selectDate(context),
                                        decoration: const InputDecoration(
                                          labelText: 'DD-MM-YYYY',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const Icon(Icons.arrow_downward_outlined),
                                      TextFormField(
                                        controller: selectedToDaterContoller,
                                        readOnly: true,
                                        onTap: () => _selectToDate(context),
                                        decoration: const InputDecoration(
                                          labelText: 'To',
                                          border: OutlineInputBorder(),
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
                                          .doc(Get.find<
                                                  AdminLoginScreenController>()
                                              .schoolID)
                                          .collection("BatchYear")
                                          .doc(
                                              '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                                          .set({
                                        'id':
                                            '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                                      }).then((value) {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text("Add New Academic Year"))
                  ],
                ),
              ],
            ),
          ),
        );
      } else if (getFireBaseData.getTeacherClassRole.value.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Scaffold(
              backgroundColor: cWhite,
              body: Center(
                child: Container(
                  height: 300.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white10),
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, color: Colors.grey),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text("Set Your Class",
                            style: GoogleFonts.poppins(fontSize: 25)),
                      ),
                      SizedBox(
                          height: 100.h,
                          width: 300.w,
                          child: GetClassTeacherListDropDownButton()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.red,
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                          MaterialButton(
                              color: Colors.green,
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("SchoolListCollection")
                                    .doc(Get.find<AdminLoginScreenController>()
                                        .schoolID)
                                    .collection('Teachers')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({
                                  'classID': classIDListValue['docid']
                                }).then((value) async {
                                  await getFireBaseData.getTeacherClassRoll();

                                  showToast(
                                      msg:
                                          'Class activated Please Login again');

                                  showToast(
                                      msg:
                                          'Class activated Please Login again');
                                });
                              },
                              child: Text(
                                'Set Class',
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (getFireBaseData.className.value.isEmpty) {
        getFireBaseData
            .getClassDetail(getFireBaseData.getTeacherClassRole.value);
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Scaffold(
              backgroundColor: cWhite,
              body: Center(
                child: Container(
                  height: 300.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white10),
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, color: Colors.grey),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text("Set Your Class",
                            style: GoogleFonts.poppins(fontSize: 25)),
                      ),
                      SizedBox(
                          height: 100.h,
                          width: 300.w,
                          child: GetClassTeacherListDropDownButton()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.red,
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                          MaterialButton(
                              color: Colors.green,
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("SchoolListCollection")
                                    .doc(Get.find<AdminLoginScreenController>()
                                        .schoolID)
                                    .collection('Teachers')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({
                                  'classID': classIDListValue['docid']
                                }).then((value) async {
                                  await getFireBaseData.getTeacherClassRoll();

                                  showToast(
                                      msg:
                                          'Class activated Please Login again');

                                  showToast(
                                      msg:
                                          'Class activated Please Login again');
                                });
                              },
                              child: Text(
                                'Set Class',
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (getFireBaseData.getTeacherClassRole.value.isNotEmpty &&
          getFireBaseData.className.isNotEmpty &&
          getFireBaseData.bYear.value.isNotEmpty) {
        return Row(
          children: [
            Container(
                width: screenSize.width / 6,
                color: adminePrimayColor,
                child: Column(
                  children: [
                    // sizedBoxH20,
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        height: 30.w,
                        width: 80.w,
                        child: Image.asset('assets/images/dujon.png')),
                    // Row(
                    //   children: [
                    //     IconButtonBackWidget(
                    //       color: Colors.red,
                    //     ),
                    //     FittedBox(
                    //       child: Padding(
                    //         padding: EdgeInsets.only(left: 5.w, right: 15.w),
                    //         child: Text(
                    //           'Class teacher Dashboard',
                    //           style: GoogleFonts.poppins(
                    //               color: Colors.red,
                    //               fontWeight: FontWeight.w800,
                    //               fontSize: 13.w),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // sizedBoxH30,
                    // Expanded(
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       itemCount: viewListNames.length,
                    //       itemBuilder: (context, index) {
                    //         return Padding(
                    //           padding: EdgeInsets.all(20.0.w),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               Image.asset(
                    //                 viewListImages[index],
                    //                 width: 15.w,
                    //                 height: 15.w,
                    //               ),
                    //               SizedBox(
                    //                 width: 10.w,
                    //               ),
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                       builder: (context) {
                    //                         return drawerPages[index];
                    //                       },
                    //                     ),
                    //                   );
                    //                 },
                    //                 child: Text(
                    //                   viewListNames[index],
                    //                   style: GoogleFonts.poppins(
                    //                       fontSize: 15.w, color: Colors.white),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                  ],
                )),
            Container(
              color: Colors.white54,
              width: screenSize.width * 5 / 6,
              child: Column(children: [
                Container(
                  color: Colors.white30,
                  height: 60.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.0.w, left: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          Get.find<AdminLoginScreenController>().schoolName,
                          style: GoogleFonts.poppins(
                              fontSize: 13.w, fontWeight: FontWeight.w500),
                        ),
                        Obx(() {
                          getFireBaseData.getClassDetail(
                              getFireBaseData.getTeacherClassRole.value);
                          if (getFireBaseData.className.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Row(
                              children: [
                                Text(
                                    Get.find<GetFireBaseData>().className.value,
                                    style: TextStyle(fontSize: 15.w)),
                                IconButton(
                                    onPressed: () async {
                                      return showDialog(
                                        context: context,
                                        barrierDismissible:
                                            false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Set Your Class",
                                                style:
                                                    TextStyle(fontSize: 15.w)),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: const <Widget>[
                                                  Center(
                                                      child:
                                                          GetClassTeacherListDropDownButton()),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              MaterialButton(
                                                  color: Colors.red,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  )),
                                              MaterialButton(
                                                  color: Colors.green,
                                                  onPressed: () async {
                                                    log("working");
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            "SchoolListCollection")
                                                        .doc(Get.find<
                                                                AdminLoginScreenController>()
                                                            .schoolID)
                                                        .collection('Teachers')
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .update({
                                                      'classID':
                                                          classIDListValue![
                                                              'docid']
                                                    }).then((value) async {
                                                      await getFireBaseData
                                                          .getTeacherClassRoll();
                                                      Navigator.pop(context);
                                                      log("message");
                                                    }).catchError((e) {
                                                      log("#################${e.toString()}");
                                                    });
                                                  },
                                                  child: Text(
                                                    'Set Class',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: cgreen,
                                      size: 20.w,
                                    ))
                              ],
                            );
                          }
                        }),
                        Row(
                          children: [
                            // Text(
                            //   'Teacher',
                            //   style: GoogleFonts.poppins(),
                            // ),
                            // kwidth20,
                            Text('Academic Year   ${getFireBaseData.bYear}',
                                style: TextStyle(fontSize: 15.w)),

                            GestureDetector(
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Change Academic Year',
                                          style: TextStyle(fontSize: 15.w)),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            GetBatchYearListDropDownButton(
                                              schoolID: Get.find<
                                                      AdminLoginScreenController>()
                                                  .schoolID,
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: MaterialButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: MaterialButton(
                                              color: Colors.blue,
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        "SchoolListCollection")
                                                    .doc(Get.find<
                                                            AdminLoginScreenController>()
                                                        .schoolID)
                                                    .set(
                                                        {
                                                      'batchYear':
                                                          schoolBatchYearListValue![
                                                              'id']
                                                    },
                                                        SetOptions(
                                                            merge: true)).then(
                                                        (value) async {
                                                  await getFireBaseData
                                                      .getBatchYearId();

                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return ClassTeacherAdmin(
                                                          teacherID: '',
                                                          schoolID: Get.find<
                                                                  AdminLoginScreenController>()
                                                              .schoolID,
                                                          teacherEmail: '',
                                                        );
                                                      },
                                                    ),
                                                  );
                                                });
                                              },
                                              child: Text(
                                                'Set Academic Year',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15.w,
                                                    color: Colors.white),
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            FirebaseFirestore.instance
                                                .collection(
                                                    "SchoolListCollection")
                                                .doc(Get.find<
                                                        AdminLoginScreenController>()
                                                    .schoolID)
                                                .set({
                                              'batchYear':
                                                  schoolBatchYearListValue![
                                                      'id']
                                            }, SetOptions(merge: true)).then(
                                                    (value) async {
                                              await getFireBaseData
                                                  .getBatchYearId();
                                              // ignore: use_build_context_synchronously
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return ClassTeacherAdmin(
                                                        schoolID: '',
                                                        teacherID: '',
                                                        teacherEmail: '');
                                                  },
                                                ),
                                              );
                                            });
                                          },
                                          child: MaterialButton(
                                              color: Colors.green,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible:
                                                      false, // user must tap button!
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Add Academic Year',
                                                          style: TextStyle(
                                                              fontSize: 15.w)),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    applynewBatchYearContoller,
                                                                readOnly: true,
                                                                onTap: () =>
                                                                    _selectDate(
                                                                        context),
                                                                decoration:
                                                                    const InputDecoration(
                                                                  labelText:
                                                                      'DD-MM-YYYY',
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                            const Icon(Icons
                                                                .arrow_downward_outlined),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    selectedToDaterContoller,
                                                                readOnly: true,
                                                                onTap: () =>
                                                                    _selectToDate(
                                                                        context),
                                                                decoration:
                                                                    const InputDecoration(
                                                                  labelText:
                                                                      'To',
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: const Text(
                                                              'Cancel'),
                                                          onPressed: () async {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: const Text(
                                                              'Create'),
                                                          onPressed: () async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "SchoolListCollection")
                                                                .doc(Get.find<
                                                                        AdminLoginScreenController>()
                                                                    .schoolID)
                                                                .collection(
                                                                    "BatchYear")
                                                                .doc(
                                                                    '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                                                                .set({
                                                              'id':
                                                                  '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                                                            }).then((value) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'Add Academic Year',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: SizedBox(
                                  height: 30.h,
                                  width: 60.w,
                                  child: Image.asset(
                                      "assets/images/Shiftbutton.png"),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 35.w,
                            ),

                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Message'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Are you sure you want to logout?')
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Cancel")),
                                        TextButton(
                                          child: const Text('Ok'),
                                          onPressed: () async {
                                            html.window.location.reload();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                height: 38.h,
                                width: 160.w,
                                child: Tooltip(
                                  message: "Logout",
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.logout_outlined,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5.h),
                                        height: 20.h,
                                        child: GoogleMonstserratWidgets(
                                          fontsize: 15.w,
                                          text: 'logout',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              //   SizedBox(
              //     height: screenSize.height - 80,
              //     child: Padding(
              //       padding: EdgeInsets.only(right: 50.0.w, left: 50.w),
              //       child: GridView.count(
              //           crossAxisCount: 5,
              //           crossAxisSpacing: 4.0,
              //           mainAxisSpacing: 8.0,
              //           children:
              //               List.generate(dashboardNamesList.length, (index) {
              //             return Center(
              //                 child: SizedBox(
              //               height: 200.w,
              //               width: 200.w,
              //               child: GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: ((context) => pages[index])));
              //                 },
              //                 child: Card(
              //                     elevation: 50,
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                         Image.asset(
              //                           dashboardImagesList[index],
              //                           width: 50.w,
              //                           height: 50.w,
              //                         ),
              //                         SizedBox(
              //                           height: 20.w,
              //                         ),
              //                         Text(
              //                           dashboardNamesList[index],
              //                           style: GoogleFonts.poppins(),
              //                         )
              //                       ],
              //                     )),
              //               ),
              //             ));
              //           })),
              //     ),
              //   )
              ]),
            )
          ],
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }),
        // child: Row(
        //   children: [
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           height: 40,
        //           width: 40,
        //           decoration: const BoxDecoration(
        //               borderRadius: BorderRadius.all(Radius.circular(14)),
        //               color: Color.fromARGB(255, 61, 94, 225)),
        //           child: const DrawerIcon(),
        //         ),
        //       ],
        //     ),
        //     const Spacer(),
        //     SizedBox(
        //       width: 109,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Row(
        //             children: [
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.end,
        //                 children: [
        //                   const Text(
        //                     'Stevne Zone',
        //                     style: TextStyle(fontSize: 12),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(right: 0),
        //                     child: Text(
        //                       'Admin',
        //                       style: TextStyle(
        //                           color: cBlack.withOpacity(0.5),
        //                           fontSize: 10.7),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               IconButton(
        //                   focusNode: textButtonFocusNode2,
        //                   onPressed: () {
        //                     // ResponsiveWebSite.isDesktop(context)
        //                     //     ? textButtonFocusNode2.requestFocus()
        //                     //     : appBarAdminBox(context);
        //                     // showOverlay = true;
        //                   },
        //                   icon: const Icon(
        //                     Icons.arrow_drop_down,
        //                     size: 18,
        //                     color: cBlack,
        //                   )),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     CircleAvatar(
        //       backgroundColor: Colors.transparent,
        //       radius: 20,
        //       child: Image.asset(
        //         'assests/png/avathar.png',
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     SizedBox(
        //       width: 70,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           Stack(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 15, right: 10),
        //                 child: IconButton(
        //                     focusNode: textButtonFocusNode,
        //                     onPressed: () {
        //                       // if (val) {
        //                       // ResponsiveWebSite.isDesktop(context)
        //                       //     ? textButtonFocusNode.requestFocus()
        //                       //     : appBarMailBox(context);
        //                       // showOverlay = true;
        //                       // }
        //                     },
        //                     icon: Icon(
        //                       Icons.mail_outline_outlined,
        //                       color: cBlack.withOpacity(0.4),
        //                     )),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 07, left: 22),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.white,
        //                   radius: 12,
        //                   child: CircleAvatar(
        //                     backgroundColor:
        //                         const Color.fromARGB(255, 42, 215, 197),
        //                     radius: 10,
        //                     child: GooglePoppinsWidgets(
        //                       text: '5',
        //                       fontsize: 11,
        //                       fontWeight: FontWeight.w600,
        //                       color: cWhite,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       width: 50,
        //       child: Column(
        //         children: [
        //           Stack(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 15, right: 10),
        //                 child: IconButton(
        //                     focusNode: textButtonFocusNode1,
        //                     onPressed: () {
        //                       // showOverlay = true;
        //                       // //.................... Notification
        //                       // ResponsiveWebSite.isDesktop(context)
        //                       //     ? textButtonFocusNode1.requestFocus()
        //                       //     : appBarNotificationBox(context);
        //                     },
        //                     icon: Icon(
        //                       Icons.notifications_none_outlined,
        //                       color: cBlack.withOpacity(0.4),
        //                     )),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 07, left: 22),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.white,
        //                   radius: 12,
        //                   child: CircleAvatar(
        //                     backgroundColor:
        //                         const Color.fromARGB(255, 255, 49, 49),
        //                     radius: 10,
        //                     child: GooglePoppinsWidgets(
        //                       text: '8',
        //                       fontsize: 11,
        //                       fontWeight: FontWeight.w600,
        //                       color: cWhite,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.only(left: 05),
        //     //   child: SizedBox(
        //     //     width: 86,
        //     //     child: Column(
        //     //       mainAxisAlignment: MainAxisAlignment.center,
        //     //       crossAxisAlignment: CrossAxisAlignment.end,
        //     //       children: [
        //     //         Row(
        //     //           children: [
        //     //             const Icon(
        //     //               Icons.south_america,
        //     //               color: Colors.amber,
        //     //             ),
        //     //             GooglePoppinsWidgets(text: ' EN ', fontsize: 12),
        //     //             PopupMenuButton(
        //     //               icon: const Icon(
        //     //                 Icons.keyboard_arrow_down_rounded,
        //     //                 color: cBlack,
        //     //                 size: 17,
        //     //               ),
        //     //               itemBuilder: (BuildContext context) {
        //     //                 return <PopupMenuEntry>[
        //     //                   PopupMenuItem(
        //     //                       child: Column(
        //     //                     children: [
        //     //                       Container(
        //     //                         height: 400,
        //     //                         color: Colors.red,
        //     //                       ),
        //     //                     ],
        //     //                   ))
        //     //                 ];
        //     //               },
        //     //             ),
        //     //           ],
        //     //         ),
        //     //       ],
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
  }

  List<Widget> widgets = [
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 42, 215, 197),
          width: 500,
          height: 40,
          child: const Center(
            child: Text(
              'All Messages',
              style: TextStyle(
                fontSize: 16,
                color: cWhite,
              ),
            ),
          ),
        ),
        Container(
          color: themeColorGreen.withOpacity(0.1),
          width: 500,
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 05,
                    ),
                    title: Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Messages',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 20),
        ),
      ],
    ),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 49, 49),
          width: 400,
          height: 40,
          child: const Center(
            child: Text(
              'All Notifications',
              style: TextStyle(
                fontSize: 15,
                color: cWhite,
              ),
            ),
          ),
        ),
        Container(
          color: themeColorGreen.withOpacity(0.1),
          width: 400,
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 05,
                    ),
                    title: Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Messages',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 20),
        ),
      ],
    ),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 160, 1),
          width: 200,
          height: 40,
          child: const Center(
            child: Text(
              'Steven Zone',
              style: TextStyle(
                  fontSize: 15, color: cWhite, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assests/png/avathar.png'),
                      ),
                    ),
                    TextFontWidget(
                      text: 'Stevne Zone',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 24,
                        color: cBlack,
                      ),
                    ),
                    TextFontWidget(
                      text: 'My Profile',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.power_settings_new,
                        size: 24,
                        color: cBlack,
                      ),
                    ),
                    TextFontWidget(
                      text: 'Log Out',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];
  void _showOverlay(BuildContext context, int index) async {
    overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            right: index == 0
                ? 160
                : index == 2
                    ? 100
                    : 120,
            top: 60,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.unfocus();
                  }
                }
              },
              child: widgets[index],
            ),
          );
        });

    overlayEntry2 = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            right: index == 0
                ? 160
                : index == 2
                    ? 230
                    : 120,
            top: 60,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.unfocus();
                  }
                }
              },
              child: widgets[index + 3],
            ),
          );
        });

    overlayState!.insertAll([
      overlayEntry!,
      overlayEntry2!,
    ]);
  }

  void removeOverlay() {
    overlayEntry!.remove();
    overlayEntry2!.remove();
  }
   _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateForApplyDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDateForApplyDate) {
      setState(() {
        _selectedDateForApplyDate = picked;
        DateTime parseDate =
            DateTime.parse(_selectedDateForApplyDate.toString());
        final DateFormat formatter = DateFormat('yyyy-MMMM');
        String formatted = formatter.format(parseDate);

        applynewBatchYearContoller.text = formatted.toString();
        log(formatted.toString());
      });
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedToDate) {
      setState(() {
        _selectedToDate = picked;
        DateTime parseDate = DateTime.parse(_selectedToDate.toString());
        final DateFormat formatter = DateFormat('yyyy-MMMM');
        String formatted = formatter.format(parseDate);

        selectedToDaterContoller.text = formatted.toString();
        log(formatted.toString());
      });
    }
  } 
}



 
