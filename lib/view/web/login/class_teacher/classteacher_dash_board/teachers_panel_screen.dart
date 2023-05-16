// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/subject/subject_screen.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/upload_timetable/timetable_add_screen.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:dujo_kerala_website/view/web/widgets/sample/under_maintance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../model/teacher/teacher_model.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';
import '../../../../fonts/google_monstre.dart';
import '../../../widgets/button_container_widget.dart';
import '../../../widgets/drop_DownList/get_batchYear.dart';
import '../../../widgets/drop_DownList/get_classList.dart';
import '../../admin/admin_DashBoard/classes/list_of_classes.dart';
import '../parents-section/add_parent.dart';
import 'add_student/add_student.dart';
import 'events_screen/create_events_screen.dart';
import 'events_screen/update_event_screens/list_classwise_event.dart';
import 'guardian-section/add_guardian.dart';
import 'manage_teachers/all_class_teachers.dart';
import 'my_stuents/my_students_list.dart';
import 'notice_screen/class_notices.dart';
import 'notice_screen/create_notice_screen.dart';

class ClassTeacherAdmin extends StatefulWidget {
  const ClassTeacherAdmin({
    super.key,
    required this.schoolID,
    required this.teacherID,
    required this.teacherEmail,
  });

  //String id;
  final String schoolID;
  final String teacherID;
  final String teacherEmail;

  @override
  State<ClassTeacherAdmin> createState() => _NewAdminMainPanelState();
}

class _NewAdminMainPanelState extends State<ClassTeacherAdmin> {
  TeacherModel teacherModel = TeacherModel();
  DateTime? _selectedDateForApplyDate;
  DateTime? _selectedToDate;
  GetFireBaseData getFireBaseData = Get.put(GetFireBaseData());
  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  String teacherClassId = '';
  List<String> dashboardNamesList = [
    'Add Subject', //1
    'Add Student', //2
    'Add Parent', //3
    'Manage Teachers', //4
    'Add Guardian', //5
    'Chat with Parents', //6
    'Upload Time Table', //7
    'Upload Progress Report', //8
    'Upload Events', //9
    'Upload Notice', //10
    'Live Clasees', //11
    'Recorded Classes' //12
  ];

  List<String> dashboardImagesList = [
    'assets/images/exam.png', //1
    'assets/images/students.png', //2
    'assets/images/admin.png', //3
    'assets/images/teacherr.png', //4
    'assets/images/women.png', //5
    'assets/images/meetings.png', //6
    'assets/images/information.png', //7
    'assets/images/report.png', //8
    'assets/images/events.png', //9
    'assets/images/notices.png', //10
    'assets/images/video-conference.png', //11
    'assets/images/elearning.png', //12
  ];

  List<String> viewListNames = [
    'Events', //1
    'Notice', //2
    'Students List',
    'My Students', //3
  ];
  List<String> viewListImages = [
    'assets/images/events.png', //1
    'assets/images/notices.png', //2
    'assets/images/students.png', //3
    'assets/images/students.png', //3
  ];

  @override
  void initState() {
    getTeacherDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SubmitSubjectClassTeacher(
          schoolID: Get.find<AdminLoginScreenController>().schoolID,
          teacherClassId: teacherClassId), //1
      AddStudentFromClassTeacher(
        schoolID: Get.find<AdminLoginScreenController>().schoolID,
        teacherIDE: widget.teacherEmail,
      ), //2
      AddParent(
          teacherIDE: widget.teacherEmail,
          schoolID: Get.find<AdminLoginScreenController>().schoolID), //3
      AllClassesListViewForTeacher(
        schoolID: Get.find<AdminLoginScreenController>().schoolID,
        classID: teacherClassId,
        teacherID: '',
      ), //4
      AddGuardian(
          teacherIDE: widget.teacherEmail,
          schoolId: Get.find<AdminLoginScreenController>().schoolID),
      const UnderMaintanceScreen(), //6

      TimeTableScreen(
        classID: teacherClassId,
        schoolID: widget.schoolID,
      ),

      const UnderMaintanceScreen(), //9
      ClassTeacherCreateEventsPage(), //6

      ClassTeacherCreateNoticePage(), //8
      const UnderMaintanceScreen(), //9
      const UnderMaintanceScreen(), //10/10
    ];
    List<Widget> drawerPages = [
      ClassEventsPageList(
        classId: teacherClassId,
        schoolId: widget.schoolID,
      ), //1
      ClassNoticeTeacher(
        schoolId: widget.schoolID,
        classId: teacherClassId,
      ), //2
      ListOfClassesScreen(schoolID: widget.schoolID),
      MyStudentsListViewScreen()
    ];
    var screenSize = MediaQuery.of(context).size;

    return Obx(() => Scaffold(
          body: getFireBaseData.bYear.isEmpty
              ? Center(
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
                          'Please Set Your 👇 Batch Year ',
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
                              height: 100,
                              width: 300,
                              child: GetBatchYearListDropDownButton(
                                schoolID: Get.find<AdminLoginScreenController>()
                                    .schoolID,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                FirebaseFirestore.instance
                                    .collection("SchoolListCollection")
                                    .doc(Get.find<AdminLoginScreenController>()
                                        .schoolID)
                                    .set({
                                  'batchYear': schoolBatchYearListValue!['id']
                                }, SetOptions(merge: true)).then((value) async {
                                  await getFireBaseData.getBatchYearId();
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ClassTeacherAdmin(
                                            teacherEmail: widget.teacherEmail,
                                            teacherID: widget.teacherID,
                                            schoolID: Get.find<
                                                    AdminLoginScreenController>()
                                                .schoolID);
                                      },
                                    ),
                                  );
                                });
                              },
                              child: ButtonContainerWidget(
                                curving: 20,
                                colorindex: 0,
                                height: 60,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    "Set Batch Year",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
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
                                        title: const Text('Add BatchYear'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              TextFormField(
                                                controller:
                                                    applynewBatchYearContoller,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectDate(context),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'DD-MM-YYYY',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              const Icon(Icons
                                                  .arrow_downward_outlined),
                                              TextFormField(
                                                controller:
                                                    selectedToDaterContoller,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectToDate(context),
                                                decoration:
                                                    const InputDecoration(
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
                                                  .collection(
                                                      "SchoolListCollection")
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
                                child: const Text("Add New Batch Year"))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : getFireBaseData.getTeacherClassRole.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Scaffold(
                          backgroundColor: cWhite,
                          body: Center(
                            child: Container(
                              height: 300,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white10),
                                boxShadow: const [
                                  BoxShadow(blurRadius: 1, color: Colors.grey),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text("Set Your Class",
                                        style:
                                            GoogleFonts.poppins(fontSize: 25)),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 300,
                                      child:
                                          GetClassTeacherListDropDownButton()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      MaterialButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          color: Colors.red,
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          )),
                                      MaterialButton(
                                          color: Colors.green,
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection(
                                                    "SchoolListCollection")
                                                .doc(Get.find<
                                                        AdminLoginScreenController>()
                                                    .schoolID)
                                                .collection('Teachers')
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .update({
                                              'classID':
                                                  classIDListValue['docid']
                                            }).then((value) => html
                                                    .window.location
                                                    .reload());
                                          },
                                          child: Text(
                                            'Set Class',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                            width: screenSize.width / 6,
                            color: adminePrimayColor,
                            child: Column(
                              children: [
                                // sizedBoxH20,
                                Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: 30.h,
                                    width: 80.w,
                                    child:
                                        Image.asset('assets/images/dujon.png')),
                                Row(
                                  children: [
                                    IconButtonBackWidget(color: Colors.red),
                                    FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(17.w),
                                        child: Text(
                                          'Classteacher Dashboard',
                                          style: GoogleFonts.poppins(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 13.h),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // sizedBoxH30,
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: viewListNames.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                viewListImages[index],
                                                width: 15,
                                                height: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return drawerPages[
                                                            index];
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  viewListNames[index],
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            )),
                        Container(
                          color: Colors.white54,
                          width: screenSize.width * 5 / 6,
                          child: Column(children: [
                            Container(
                              color: Colors.white30,
                              height: 60,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: 30.0.w, left: 30.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      Get.find<AdminLoginScreenController>()
                                          .schoolName,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Obx(() {
                                      getFireBaseData.getClassDetail(
                                          getFireBaseData
                                              .getTeacherClassRole.value);
                                      if (getFireBaseData.className.isEmpty) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            Text(Get.find<GetFireBaseData>()
                                                .className
                                                .value),
                                            IconButton(
                                                onPressed: () async {
                                                  return showDialog(
                                                    context: context,
                                                    barrierDismissible:
                                                        false, // user must tap button!
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            "Set Your Class"),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: ListBody(
                                                            children: <Widget>[
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
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Cancel',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: Colors
                                                                            .white),
                                                              )),
                                                          MaterialButton(
                                                              color:
                                                                  Colors.green,
                                                              onPressed: () {
                                                                () async {
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "SchoolListCollection")
                                                                      .doc(Get.find<
                                                                              AdminLoginScreenController>()
                                                                          .schoolID)
                                                                      .collection(
                                                                          'Teachers')
                                                                      .doc(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                      .update({
                                                                    'classID':
                                                                        classIDListValue[
                                                                            'docid']
                                                                  }).then(
                                                                          (value) async {
                                                                    await getFireBaseData
                                                                        .getTeacherClassRoll();
                                                                    log("message");
                                                                  }).catchError(
                                                                          (e) {
                                                                    log("#################${e.toString()}");
                                                                  });
                                                                };
                                                              },
                                                              child: Text(
                                                                'Set Class',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: Colors
                                                                            .white),
                                                              )),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(Icons.edit))
                                          ],
                                        );
                                      }
                                    }),
                                    Row(
                                      children: [
                                        Text(
                                          'Teacher',
                                          style: GoogleFonts.poppins(),
                                        ),
                                        kwidth20,
                                        Text(
                                            'Batch Year ${getFireBaseData.bYear}'),
                                        IconButton(
                                            onPressed: () async {
                                              showDialog(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Change Batch Year'),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          GetBatchYearListDropDownButton(
                                                            schoolID:
                                                                widget.schoolID,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: MaterialButton(
                                                            color: Colors.red,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'Cancel',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      color: Colors
                                                                          .white),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: MaterialButton(
                                                            color: Colors.blue,
                                                            onPressed: () {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "SchoolListCollection")
                                                                  .doc(widget
                                                                      .schoolID)
                                                                  .set(
                                                                      {
                                                                    'batchYear':
                                                                        schoolBatchYearListValue![
                                                                            'id']
                                                                  },
                                                                      SetOptions(
                                                                          merge:
                                                                              true)).then(
                                                                      (value) async {
                                                                await getFireBaseData
                                                                    .getBatchYearId();
                                                                // ignore: use_build_context_synchronously
                                                                Navigator
                                                                    .pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) {
                                                                      return ClassTeacherAdmin(
                                                                        teacherID:
                                                                            '',
                                                                        schoolID:
                                                                            widget.schoolID,
                                                                        teacherEmail:
                                                                            '',
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              });
                                                            },
                                                            child: Text(
                                                              'Set BatchYear',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      color: Colors
                                                                          .white),
                                                            )),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "SchoolListCollection")
                                                              .doc(widget
                                                                  .schoolID)
                                                              .set(
                                                                  {
                                                                'batchYear':
                                                                    schoolBatchYearListValue![
                                                                        'id']
                                                              },
                                                                  SetOptions(
                                                                      merge:
                                                                          true)).then(
                                                                  (value) async {
                                                            await getFireBaseData
                                                                .getBatchYearId();
                                                            // ignore: use_build_context_synchronously
                                                            Navigator
                                                                .pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                                  return ClassTeacherAdmin(
                                                                      schoolID:
                                                                          '',
                                                                      teacherID:
                                                                          '',
                                                                      teacherEmail:
                                                                          '');
                                                                },
                                                              ),
                                                            );
                                                          });
                                                        },
                                                        child: MaterialButton(
                                                            color: Colors.green,
                                                            onPressed: () {
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
                                                                        'Add BatchYear'),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          ListBody(
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                            child:
                                                                                TextFormField(
                                                                              controller: applynewBatchYearContoller,
                                                                              readOnly: true,
                                                                              onTap: () => _selectDate(context),
                                                                              decoration: const InputDecoration(
                                                                                labelText: 'DD-MM-YYYY',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const Icon(
                                                                              Icons.arrow_downward_outlined),
                                                                          Expanded(
                                                                            child:
                                                                                TextFormField(
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
                                                                    actions: <
                                                                        Widget>[
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'Cancel'),
                                                                        onPressed:
                                                                            () async {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'Create'),
                                                                        onPressed:
                                                                            () async {
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("SchoolListCollection")
                                                                              .doc(Get.find<AdminLoginScreenController>().schoolID)
                                                                              .collection("BatchYear")
                                                                              .doc('${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
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
                                                            child: Text(
                                                              'Add Batch Year',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      color: Colors
                                                                          .white),
                                                            )),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(Icons.replay_outlined)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/icons8-teachers-64.png'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(Icons.logout_outlined),
                                        GoogleMonstserratWidgets(
                                            text: 'logout', fontsize: 13.w),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height - 60,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50),
                                child: GridView.count(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 8.0,
                                    children: List.generate(
                                        dashboardNamesList.length, (index) {
                                      return Center(
                                          child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        pages[index])));
                                          },
                                          child: Card(
                                              elevation: 50,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    dashboardImagesList[index],
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    dashboardNamesList[index],
                                                    style:
                                                        GoogleFonts.poppins(),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ));
                                    })),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
          // getFireBaseData.classTeacherdocid.value.isEmpty?
          // Text('')
          // :Text('')
          // classTeacherdocid

          ////
        ));
  }

  void getTeacherDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection("Teachers")
        .doc(user?.uid)
        .get();
    setState(() {
      teacherClassId = vari.data()?['classID'];
    });
    log(vari.toString());
  }

  submitSubject(
      BuildContext context, TextEditingController subjecController) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Subject'),
          content: SingleChildScrollView(
            child: TextField(
                controller: subjecController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Name of Subject',

                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    )),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                )),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('add'),
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("SchoolListCollection")
                    .doc(Get.find<AdminLoginScreenController>().schoolID)
                    .collection("Classes")
                    .doc(teacherClassId)
                    .collection("Subjects")
                    .doc(subjecController.text.trim().toString())
                    .set({
                  'subject': subjecController.text.trim().toString(),
                  'id': subjecController.text.trim().toString()
                }).then((value) => showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Successfully created'),
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
                        ));
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
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
