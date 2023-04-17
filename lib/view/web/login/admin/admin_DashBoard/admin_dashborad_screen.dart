import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/list_of_classes.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/research_and_development/research_and_development.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/students_proctection_group.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_summary/students_summary.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/add_teacher.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/list_of_teachers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
import 'package:lottie/lottie.dart';
import '../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../model/loginHistory_model/login_history_model.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';
import '../../../home/dujo_home.dart';
import 'sampoorna/sampoorna_home.dart';
import '../../../widgets/button_container_widget.dart';
import '../../../widgets/drop_DownList/get_batchYear.dart';
import 'Students_ScholarShip/student_scholarship.dart';
import 'achievements/achievements.dart';
import 'admin_notice copy/admin_notice_new_ui/admin_notice_show_new.dart';
import 'admin_notice/add_new_notices.dart';
import 'all_Students/all_students_view_Screen.dart';
import 'alumini_accocation/alumni_assocation.dart';
import 'bus_Route/bus_route.dart';
import 'classes/add_class.dart';
import 'create_Admin/add_new_admin.dart';
import 'events/events_screen.dart';
import 'exam_notifications/select_type.dart';
import 'feesandupdates/fees_and_update.dart';
import 'food_and_beverages/food_and_bev.dart';
import 'general_instructions/creation_general_instruction_.dart';
import 'live_classes/live_classes.dart';
import 'login_Register_history/date_wise.dart';
import 'meetings_section/meeting_section.dart';
import 'mothers pta/mothers_pta.dart';
import 'non_Teaching_staff/non_teaching_staff.dart';
import 'pTA_section/pta_admin_panel.dart';

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
  GetFireBaseData getFireBaseData = Get.put(GetFireBaseData());
  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  DateTime? _selectedDateForApplyDate;
  DateTime? _selectedToDate;

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
    'Student Protection Group',
    'Scholarship',
    'Bus Route',
    'Student Summary',
    'Research and\nDevelopment',
    'School Calendar',
    'Online Classes',
    'Recorded Classes',
    'Food and Beverages',
    'Exam Notifications',
    'Alumni Associations',
    'Fees in Classwise',
    'Non-Teaching Staffs',
    'Generate TC',
    'Generate Summary',
    'Sampoorna'
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
    'assets/images/students.png',
    'assets/images/research-and-development.png',
    'assets/images/calendar.png',
    'assets/images/elearning.png',
    'assets/images/video-conference.png',
    'assets/images/fast-food.png',
    'assets/images/exam.png',
    'assets/images/alumni.png',
    'assets/images/tuition.png',
    'assets/images/steward.png',
    'assets/images/file-transfer.png',
    'assets/images/report.png',
    'assets/images/folders.png',
  ];

  List<String> viewListNames = [
    'All Students',
    'School'
        'Teachers',
    'Classes',
    'Notices',
    'Meetings',
    'PTA',
    'Login History',
    // 'Parents',
  ];
  List<String> viewListImages = [
    'assets/images/students.png',
    // 'assets/images/admin.png'
    'assets/images/teacherr.png',
    'assets/images/classes.png',
    'assets/images/notices.png',
    'assets/images/meetings.png',
    'assets/images/interview.png',
    'assets/images/admin.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      AddNewAdmin(schoolID: widget.schoolID), //1
      AddTeacherSectionScreen(schoolID: widget.schoolID), //2
      AddClassesSectionScreen(
        schoolID: widget.schoolID,
      ), //3
      CreationGeneralInstruction(schoolId: widget.schoolID), //4
      AddNewNotices(schoolId: widget.schoolID), //5
      EventsUpdates(schoolID: widget.schoolID), //6
      const FeesUpdates(), // MeetingCreates(schoolId: widget.schoolID), //7
      MeetingCreates(
        schoolId: widget.schoolID,
      ), //8
      PtaMemberAdmin(id: widget.schoolID), //9
      const MothersPta(), //10
      Achievements(schoolID: widget.schoolID), //11
      StudentProtectionGroup(), //12
      AdminScholarships(schoolID: widget.schoolID), //13
      const BusRoute(), //14
      const StudentSummary(), //15
      const StudentSummary(), //16
      const ResearchDevelopment(), //17
      const LiveClasses(), //18
      AddNewNotices(schoolId: widget.schoolID), //19
      FoodBeverages(), //AddNewNotices(schoolId: widget.schoolID), //20
      SelectType(schoolID: widget.schoolID), //21
      //const FoodBeverages(), //22
      const AlumniAssocation(), //23
      const FeesUpdates(), //24
      NonTeachingLogin(schoolID: widget.schoolID), //25t6yg
      AdminScholarships(schoolID: widget.schoolID), //26
      SampoornaHomeScreen(schoolId: widget.schoolID), //28
    ];
    List<Widget> drawerPages = [
      AllStudentList(),
      ListOfSchoolTeachers(schoolID: widget.schoolID),
      ListOfClassesScreen(schoolID: widget.schoolID),
      NoticeDisplay(
        schoolId: widget.schoolID,
      ),
      PtaMemberAdmin(id: widget.schoolID),
      PtaMemberAdmin(id: widget.schoolID),
      DateWiseLoginScreen(schoolID: widget.schoolID),
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
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        child: ListView.builder(
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                              return drawerPages[index];
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
                            })),
                    Container(
                      color: Colors.white54,
                      width: screenSize.width * 5 / 6,
                      child: Column(children: [
                        Container(
                          color: Colors.white30,
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 30.0, left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Admin Dashboard',
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Administrator',
                                      style: GoogleFonts.poppins(),
                                    ),
                                    SizedBox(
                                      width: screenSize.height / 12,
                                    ),
                                    Text('Batch Year ${getFireBaseData.bYear}'),
                                    IconButton(
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
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
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Cancel',
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      )),
                                                  SizedBox(
                                                    width:
                                                        screenSize.width / 15,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "SchoolListCollection")
                                                            .doc(
                                                                widget.schoolID)
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
                                                      child: Text(
                                                        'Set BatchYear',
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.replay_outlined)),
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/icons8-teachers-64.png'),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: () async {
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
                                                        'Are You Sure want to logout?')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('cancel'),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('ok'),
                                                  onPressed: () async {
                                                    log(LoginTimeIDSavingClass
                                                        .date);
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            "SchoolListCollection")
                                                        .doc(Get
                                                                .find<
                                                                    AdminLoginScreenController>()
                                                            .schoolID)
                                                        .collection(Get
                                                                .find<
                                                                    AdminLoginScreenController>()
                                                            .batchYearID)
                                                        .doc(Get
                                                                .find<
                                                                    AdminLoginScreenController>()
                                                            .batchYearID)
                                                        .collection(
                                                            "LoginHistory")
                                                        .doc(LoginTimeIDSavingClass
                                                            .date)
                                                        .collection(
                                                            LoginTimeIDSavingClass
                                                                .date)
                                                        .doc(
                                                            LoginTimeIDSavingClass
                                                                .id)
                                                        .set(
                                                            {
                                                          'logOutTime':
                                                              DateTime.now()
                                                                  .toString(),
                                                        },
                                                            SetOptions(
                                                                merge:
                                                                    true)).then(
                                                            (value) {
                                                      html.window.location
                                                          .reload();

                                                      // Navigator.pushReplacement(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //     builder: (context) {
                                                      //       return DujoHomePage();
                                                      //     },
                                                      //   ),
                                                      // );
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.logout_outlined),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height - 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 50.0, left: 50),
                            child: GridView.count(
                                crossAxisCount: 5,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 8.0,
                                children: List.generate(27, (index) {
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
                                                style: GoogleFonts.poppins(),
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
}
