import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/add_attendance/add_attendance_teacher_page.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/add_student/add_student.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/events_screen/create_events_screen.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/guardian-section/add_guardian.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/manage_teachers/all_class_teachers.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/notice_screen/create_notice_screen.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/subject/subject_screen.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/upload_timetable/new_timetable_screen.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/parents-section/add_parent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({
    Key? key,
    required this.teacherEmail,
    required this.schoolID,
    required this.teacherID,
  }) : super(key: key);

  final String schoolID;
  final String teacherID;
  final String teacherEmail;

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  String teacherClassId = '';
  List<String> dashboardNamesList = [
    'Add Subject',
    'Add Student',
    'Add Parent',
    'Manage Teachers',
    'Add Guardian',
    'Upload Time Table',
    'Upload Events',
    'Upload Notice',
    'Add Attendance',
  ];

  List<String> dashboardImagesList = [
    'assets/images/exam.png',
    'assets/images/students.png',
    'assets/images/admin.png',
    'assets/images/teacherr.png',
    'assets/images/women.png',
    'assets/images/meetings.png',
    'assets/images/information.png',
    'assets/images/events.png',
    'assets/images/notices.png',
    'assets/images/attendance.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SubmitSubjectClassTeacher(
        schoolID: Get.find<AdminLoginScreenController>().schoolID,
        teacherClassId: teacherClassId,
      ),
      AddStudentFromClassTeacher(
        schoolID: Get.find<AdminLoginScreenController>().schoolID,
        teacherIDE: widget.teacherEmail,
      ),
      AddParent(
        teacherIDE: widget.teacherEmail,
        schoolID: Get.find<AdminLoginScreenController>().schoolID,
      ),
      AllClassesListViewForTeacher(
        schoolID: Get.find<AdminLoginScreenController>().schoolID,
        classID: teacherClassId,
        teacherID: '',
      ),
      AddGuardian(
        teacherIDE: widget.teacherEmail,
        schoolId: Get.find<AdminLoginScreenController>().schoolID,
      ),
      NewTimeTableScreen(),
      ClassTeacherCreateEventsPage(),
      ClassTeacherCreateNoticePage(),
      AddAttendnceTeacherHomePage(),
    ];

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: adminePrimayColor,
      ),
      body: Expanded(
        child: SizedBox(
          height: screenSize.height - 80,
          child: Padding(
            padding: EdgeInsets.only(right: 50.0.w, left: 50.w),
            child: GridView.count(
              crossAxisCount: ResponsiveWebSite.isMobile(context) ? 2 : 5,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(dashboardNamesList.length, (index) {
                return Center(
                  child: SizedBox(
                    height: ResponsiveWebSite.isMobile(context) ? 400.w : 200.w,
                    width: ResponsiveWebSite.isMobile(context) ? 400.w : 200.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => pages[index])),
                        );
                      },
                      child: Card(
                        elevation: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              dashboardImagesList[index],
                              width: 50.w,
                              height: 50.w,
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Text(
                              dashboardNamesList[index],
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
