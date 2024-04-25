import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
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
  const TeacherHome({super.key, required this.teacherEmail, required this.schoolID, required this.teacherID});
    final String schoolID;
  final String teacherID;
  final String teacherEmail;
  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  String teacherClassId = '';
  List<String> dashboardNamesList = [
    'Add Subject', //1
    'Add Student', //2
    'Add Parent', //3
    'Manage Teachers', //4
    'Add Guardian', //5
    // 'Chat with Parents', //6
    'Upload Time Table', //7
    //'Upload Progress Report', //8
    'Upload Events', //9
    'Upload Notice', //10
    'Add Attendance', //
    //'Live Clasees', //11
    //'Recorded Classes' //12
  ];

  List<String> dashboardImagesList = [
    'assets/images/exam.png', //1
    'assets/images/students.png', //2
    'assets/images/admin.png', //3
    'assets/images/teacherr.png', //4
    'assets/images/women.png', //5
    'assets/images/meetings.png', //6
    'assets/images/information.png', //7
    //'assets/images/report.png', //8
    'assets/images/events.png', //9
    'assets/images/notices.png', //10
    'assets/images/attendance.png',
    //'assets/images/video-conference.png',  //11
    //'assets/images/elearning.png',  //12
  ];

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
      //  const UnderMaintanceScreen(), //6

      NewTimeTableScreen(),

      ClassTeacherCreateEventsPage(), //6

      ClassTeacherCreateNoticePage(), //8
      AddAttendnceTeacherHomePage() //9
    ];
    var screenSize = MediaQuery.of(context).size;
    return Expanded(
        child: SizedBox(
      height: screenSize.height - 80,
      child: Padding(
        padding: EdgeInsets.only(right: 50.0.w, left: 50.w),
        child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(dashboardNamesList.length, (index) {
              return Center(
                  child: SizedBox(
                height: 200.w,
                width: 200.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: ((context) => pages[index])));
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
                          )
                        ],
                      )),
                ),
              ));
            })),
      ),
    ));
  }
}