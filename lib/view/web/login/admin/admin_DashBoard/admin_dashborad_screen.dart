// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/Getx/class_teacher/teacher_add_student_controller/teacher_add_student_controller.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/list_of_classes.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/shift_class/shift_classpage.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/students_proctection_group.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/add_teacher.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/list_of_teachers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../model/loginHistory_model/login_history_model.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';
import '../../../widgets/button_container_widget.dart';
import '../../../widgets/drop_DownList/get_batchYear.dart';
import '../../../widgets/drop_DownList/get_classes.dart';
import '../../../widgets/sample/under_maintance.dart';
import 'Fees_and_bills/Fees/fees_and_bills.dart';
import 'Students_ScholarShip/student_scholarship.dart';
import 'achievements/achievements.dart';
import 'admin_meeting/admin_meeting_update/adminMeetingNew/admin_meeting_show.dart';
import 'admin_meeting/meeting_in.dart';
import 'admin_notice/add_new_notices.dart';
import 'admin_notice/admin_notice_new_ui/admin_notice_show_new.dart';
import 'admin_pta/admin_pta_screen.dart';
import 'all_Students/all_students_view_Screen.dart';
import 'alumni_association/alumni_association.dart';
import 'bus_Route/bus_route.dart';
import 'classes/add_class.dart';
import 'create_Admin/add_new_admin.dart';
import 'events/events_screen.dart';
import 'exam_notifications/school_notifications.dart';
import 'food_and_beverages/food_and_bev.dart';
import 'general_instructions/creation_general_instruction_.dart';
import 'login_Register_history/date_wise.dart';
import 'manage_notifications/main_screen_notifications.dart';
import 'mothers_pta/mothers_pta_screen.dart';
import 'non_Teaching_staff/non_teaching_staff.dart';

class AdminDashBoardPage extends StatefulWidget {
  AdminDashBoardPage(
      {super.key,
      required this.schoolID,
      this.wadmin,
      this.loginTime,
      this.date});

  //String id;
  final String schoolID;
  String? wadmin;
  String? loginTime;
  String? date;
  @override
  State<AdminDashBoardPage> createState() => _NewAdminMainPanelState();
}

class _NewAdminMainPanelState extends State<AdminDashBoardPage> {
  TeacherAddStudentController     teacherAddStudentController =
      Get.put(TeacherAddStudentController());
  GetFireBaseData getFireBaseData = Get.put(GetFireBaseData());
  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  DateTime? _selectedDateForApplyDate;
  DateTime? _selectedToDate;
  final _formKey =GlobalKey<FormState>();

  List<String> dashboardNamesList = [
    'Create Admin',
    'Teachers',
    'Classes',
    'General instructions',
    'Notices',
    'Events',
    'Fees and Bills',
    'Meetings',
    'PTA',
    'Mother\'s PTA',
    'Achievements',
    'School Protection\nGroup',
    'Scholarship',
    'Bus Route',
    'Video Conference',
    'Food and Beverages',
    'Exam Notifications',
    'Alumni Associations',
    'Class Promotion',
    'Non-Teaching Staffs',
    'Fess & Bills'
  ];

  List<String> dashboardImagesList = [
    'assets/images/admin.png',
    'assets/images/teacherr.png',
    'assets/images/classes.png',
    'assets/images/information.png',
    'assets/images/notices.png',
    'assets/images/events.png',
    'assets/images/feesandbills.png',
    'assets/images/meetings.png',
    'assets/images/interview.png',
    'assets/images/women.png',
    'assets/images/success.png',
    'assets/images/protection.png',
    'assets/images/graduation.png',
    'assets/images/route.png',
    'assets/images/elearning.png',
    'assets/images/fast-food.png',
    'assets/images/exam.png',
    'assets/images/alumni.png',
    'assets/images/exchange.png',
    'assets/images/steward.png',
    'assets/images/feesandbills.png'
  ];

  List<String> viewListNames = [
    'All Students',
    'All Teachers',
    'Classes',
    'Notices',
    'Meetings',
    'PTA',
    'Non-Teaching Staffs',
    'Login History',
    'Manage Notifications',
    'Dujo Cart',
  ];
  List<String> viewListImages = [
    'assets/images/students.png',
    'assets/images/teacherr.png',
    'assets/images/classes.png',
    'assets/images/notices.png',
    'assets/images/meetings.png',
    'assets/images/interview.png',
    'assets/images/steward.png',
    'assets/images/admin.png',
    'assets/images/notification.png',
    'assets/images/shoppincart.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      AddNewAdmin(schoolID: widget.schoolID), //1-create admin
      AddTeacherSectionScreen(schoolID: widget.schoolID), //2-Teachers
      AddClassesSectionScreen(
        schoolID: widget.schoolID,
      ), //3-classes
      CreationGeneralInstruction(
          schoolId: widget.schoolID), //4-general instructions
      AddNewNotices(schoolId: widget.schoolID), //5-notices
      EventsUpdates(schoolID: widget.schoolID), //6-events
      const UnderMaintanceScreen(), //fees and bills
      MeetingCreates(
        schoolId: widget.schoolID,
      ), //8-Meetings
      AdminPtaScreen(), //9-PTA
      MothersPtaScreen(), //10-Mothers PTA
      Achievements(schoolID: widget.schoolID), //11-Achievements
      StudentProtectionGroup(), //12-Students Protection Group
      AdminScholarships(schoolID: widget.schoolID), //13-ScholarShip

      const BusRoute(), //14-Bus Route
   
      const UnderMaintanceScreen(), //18
      FoodBeverages(schoolID: widget.schoolID),
      SchoolLevelNotifications(schoolID: widget.schoolID),
      AlumniAssociation(),
      ShiftClassPage(),
      NonTeachingLogin(schoolID: widget.schoolID),
      const FeesAndBillsWeb(),
      
    ];
    List<Widget> drawerPages = [
      AllStudentList(),
      ListOfSchoolTeachers(schoolID: widget.schoolID),
      ListOfClassesScreen(),
      NoticeDisplay(
        schoolId: widget.schoolID,
      ),
      MeetingDisplay(
        schoolId: widget.schoolID,
      ),
      AdminPtaScreen(),
      const UnderMaintanceScreen(),
   
      DateWiseLoginScreen(schoolID: widget.schoolID),
      const MainScreenNotifications()
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
                              height: 100.w,
                              width: 300.w,
                              child: GetBatchYearListDropDownButton(
                                schoolID: widget.schoolID,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                FirebaseFirestore.instance
                                    .collection("SchoolListCollection")
                                    .doc(widget.schoolID)
                                    .set({
                                  'batchYear': schoolBatchYearListValue!['id']
                                }, SetOptions(merge: true)).then((value) async {
                                  await getFireBaseData.getBatchYearId();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AdminDashBoardPage(
                                            loginTime:
                                                LoginTimeIDSavingClass.id,
                                            schoolID: widget.schoolID);
                                      },
                                    ),
                                  );
                                });
                              },
                              child: ButtonContainerWidget(
                                curving: 20,
                                colorindex: 0,
                                height: 60.w,
                                width: 200.w,
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
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Add BatchYear'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      applynewBatchYearContoller,
                                                  readOnly: true,
                                                  onTap: () =>
                                                      _selectDate(context),
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'DD-MM-YYYY',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              const Icon(Icons
                                                  .arrow_downward_outlined),
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      selectedToDaterContoller,
                                                  readOnly: true,
                                                  onTap: () =>
                                                      _selectToDate(context),
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'To',
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
                                                  .doc(widget.schoolID)
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
              : Row(
                  children: [
                    Container(
                        width: screenSize.width / 6,
                        color: adminePrimayColor,
                        child: ListView(
                          children: [
                            GestureDetector(
                             // onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FeesAndBillsWeb())),
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  height: 30.h,
                                  width: 80.w,
                                  child: Image.asset('assets/images/dujon.png')),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back,
                                      color: cred, size: 22.w),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.w),
                                  child: Text(
                                    'Admin Dashboard',
                                    style: GoogleFonts.poppins(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15.w),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Home',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewListNames.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(20.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          viewListImages[index],
                                          width: 15.w,
                                          height: 15.w,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return drawerPages[index];
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            viewListNames[index],
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,fontSize: 14.w),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                            Container(
                              margin: EdgeInsets.only(left: 25.w),
                                width: 80.w,
                                      height: 40.h,
                              child: GestureDetector(
                                onTap: () {
                                                     print("object");
                                                     addstudent(context);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(

                                      width: 20.w,
                                      height: 10.h,
                                      child: Image.asset('assets/images/students.png')),
                                    GooglePoppinsWidgets(
                                      text: 'Add Student',
                                      fontsize: 13.w,
                                      color: cWhite,
                                     // fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      color: Colors.white54,
                      width: screenSize.width * 5 / 6,
                      child: Column(children: [
                          Container(
                          color: Colors.white30,
                          height: 60.w,
                          child: Padding(
                            padding: EdgeInsets.only(right: 30.0.w, left: 30.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  Get.find<AdminLoginScreenController>()
                                      .schoolName,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,fontSize: 14.w),
                                ),
                                SizedBox(
                                  width: screenSize.height / 12,
                                ),
                                Text('Batch Year ${getFireBaseData.bYear}'),
                                Tooltip(
                                    message: "Class promotion",
                                    child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Change Batch Year'),
                                                content: SingleChildScrollView(
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
                                                        const EdgeInsets.all(
                                                            20.0),
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
                                                        const EdgeInsets.all(
                                                            20.0),
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
                                                            Navigator
                                                                .pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                                  return AdminDashBoardPage(
                                                                      loginTime:
                                                                          LoginTimeIDSavingClass
                                                                              .id,
                                                                      schoolID:
                                                                          widget
                                                                              .schoolID);
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
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              "SchoolListCollection")
                                                          .doc(widget.schoolID)
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
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return AdminDashBoardPage(
                                                                  loginTime:
                                                                      LoginTimeIDSavingClass
                                                                          .id,
                                                                  schoolID: widget
                                                                      .schoolID);
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
                                                                      TextFormField(
                                                                        controller:
                                                                            applynewBatchYearContoller,
                                                                        readOnly:
                                                                            true,
                                                                        onTap: () =>
                                                                            _selectDate(context),
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          labelText:
                                                                              'DD-MM-YYYY',
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        ),
                                                                      ),
                                                                      const Icon(
                                                                          Icons
                                                                              .arrow_downward_outlined),
                                                                      TextFormField(
                                                                        controller:
                                                                            selectedToDaterContoller,
                                                                        readOnly:
                                                                            true,
                                                                        onTap: () =>
                                                                            _selectToDate(context),
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          labelText:
                                                                              'To',
                                                                          border:
                                                                              OutlineInputBorder(),
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
                                                                      Navigator.of(
                                                                              context)
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
                                                                          .collection(
                                                                              "SchoolListCollection")
                                                                          .doc(Get.find<AdminLoginScreenController>()
                                                                              .schoolID)
                                                                          .collection(
                                                                              "BatchYear")
                                                                          .doc(
                                                                              '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                                                                          .set({
                                                                        'id':
                                                                            '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                                                                      }).then((value) {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        Navigator.of(context)
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
                                        child: SizedBox(
                                          height: 30.h,
                                          width: 60.w,
                                          child: Image.asset(
                                              "assets/images/Shiftbutton.png"),
                                        ))),
                                SizedBox(
                                  width: 8.w,
                                ),
                                GestureDetector(
                                  onTap: () async {
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
                                                log("school id${Get.find<AdminLoginScreenController>().schoolID}");
                                                log("batch year${Get.find<GetFireBaseData>().bYear.value}");
                                                log("dateee${LoginTimeIDSavingClass.date}");
                                                log("idddddddd${LoginTimeIDSavingClass.id.toString()}");
                                                await FirebaseFirestore.instance
                                                    .collection(
                                                        "SchoolListCollection")
                                                    .doc(Get.find<AdminLoginScreenController>()
                                                        .schoolID)
                                                    .collection(Get.find<
                                                            GetFireBaseData>()
                                                        .bYear
                                                        .value)
                                                    .doc(Get.find<
                                                            GetFireBaseData>()
                                                        .bYear
                                                        .value)
                                                    .collection("LoginHistory")
                                                    .doc(LoginTimeIDSavingClass
                                                        .date)
                                                    .collection(
                                                        LoginTimeIDSavingClass
                                                            .date)
                                                    .doc(LoginTimeIDSavingClass
                                                        .id)
                                                    .set(
                                                        {
                                                      'logOutTime':
                                                          DateTime.now()
                                                              .toString(),
                                                    },
                                                        SetOptions(
                                                            merge: true)).then(
                                                        (value) => html
                                                            .window.location
                                                            .reload());
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
                                            const Icon(
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
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: screenSize.height - 60,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 50.0, left: 50),
                              child: GridView.count(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 8.0,
                                  children: List.generate(
                                      dashboardNamesList.length, (index) {
                                    return Center(
                                        child: SizedBox(
                                      height: 200.w,
                                      width: 200.w,
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
                                                  width: 55.w,
                                                  height: 55.w,
                                                ),
                                                SizedBox(
                                                  height: 20.w,
                                                ),
                                                Text(
                                                  dashboardNamesList[index],
                                                  style: GoogleFonts.poppins(fontSize: 14.w),
                                                )
                                              ],
                                            )),
                                      ),
                                    ));
                                  })),
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
        ));
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
         addstudent(BuildContext context) async {
                                  TextEditingController phoneNumberController =
                                      TextEditingController();

                                  TextEditingController studentNameController =
                                      TextEditingController();
                                  TextEditingController addmissionController =
                                      TextEditingController();

                                  return showDialog(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Add student'),
                                        content: SingleChildScrollView(
                                          child: Form(
                                            key: _formKey,
                                            child: ListBody(
                                              children: <Widget>[
                                                const GetClassesListDropDownButton(),
                                                TextFormField(
                                                  validator: checkFieldEmpty,
                                                  controller:
                                                      studentNameController,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          'Enter student name'),
                                                ),
                                                TextFormField(
                                                  validator: checkFieldPhoneNumberIsValid,
                                                  controller:
                                                      phoneNumberController,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          'Enter phone number'),
                                                ),
                                                TextFormField(
                                                  validator: checkFieldEmpty,
                                                  controller:
                                                      addmissionController,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          'Enter admission number'),
                                                ),
                                              ],
                                            ),
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
                                            child: const Text('Add student'),
                                            onPressed: () async {

                                              if(_formKey.currentState!.validate()){
                                                log('class id${classesListValue!['docid']}');
                                              teacherAddStudentController
                                                  .admincreateStudent(
                                                    classID:classesListValue!['docid'] ,
                                                      studentModel:
                                                          AddStudentModel(
                                                studentName:
                                                    studentNameController.text
                                                        .trim(),
                                                parentPhoneNumber:
                                                    phoneNumberController.text
                                                        .trim(),
                                                admissionNumber:
                                                    addmissionController.text
                                                        .trim(),
                                                classID: classesListValue!['docid'],
                                                createDate:
                                                    DateTime.now().toString(),
                                              ));
                                               clearAdminAdd();
                                              }
                                             
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                 
                                }
                                void clearAdminAdd() {
                                  phoneNumberController .clear();
                                  // studentNameController .clear();
                                  // addmissionController .clear();
                                }
                                 
}

