
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/list_of_classes.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/events_screen/update_event_screens/list_classwise_event.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/my_stuents/my_students_list.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/notice_screen/class_notices.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/teachers_panel_screen.dart';
import 'package:dujo_kerala_website/view/web/login/teachers_panel/drawer/drawer_pages.dart';
import 'package:dujo_kerala_website/view/web/login/teachers_panel/teachers_appbar/teachers_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

import 'pages/teacher_dash_board/teachers_dashboard.dart';

class TeachersHomeScreen extends StatefulWidget {
  const TeachersHomeScreen({super.key});

  @override
  State<TeachersHomeScreen> createState() => _TeachersHomeScreenState();
}
final AdminLoginScreenController adminLoginScreenController = Get.put(AdminLoginScreenController());
class _TeachersHomeScreenState extends State<TeachersHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                const AppBarTeachersPanel(),
                pages[selectedIndex],
              ],
            ),
            drawer: Container(
              color: cWhite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 350),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Image.asset(
                                'assets/images/leptonlogo5.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            GooglePoppinsWidgets(
                              text: "LEPTON DUJO",
                              fontsize: 20,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 12),
                        child: Text(
                          "Main Menu",
                          style: TextStyle(
                              color: cBlack.withOpacity(
                                0.4,
                              ),
                              fontSize: 12),
                        ),
                      ),
                      sizedBoxH10,
                      DrawerSelectedPagesSection(
                        selectedIndex: selectedIndex,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
  String teacherClassId = '';
List<Widget> pages = [
  const TeacherDashBoardScreen(),
  // ClassTeacherAdmin(
  //                 schoolID: adminLoginScreenController.schoolID,
  //                 teacherID: "value.user?.uid ?? """,
  //                 teacherEmail: "value.user?.email ?? """),
  //  ClassEventsPageList(
  //       classId: "teacherClassId",
  //       schoolId: adminLoginScreenController.schoolID,
  //     ), //1
  //     ClassNoticeTeacher(
  //       schoolId:adminLoginScreenController.schoolID,
  //       classId: "teacherClassId",
  //     ), //2
      // ListOfClassesScreen(),
      // MyStudentsListViewScreen(),
  Center(
    child: Text(sideMenu[6]),
  ),
  Center(
    child: Text(sideMenu[7]),
  ),
  Center(
    child: Text(sideMenu[8]),
  ),
  Center(
    child: Text(sideMenu[9]),
  ),
  Center(
    child: Text(sideMenu[10]),
  ),
  Center(
    child: Text(sideMenu[11]),
  ),
];
List<String> sideMenu = [
  'Attendence',
  'Food Manage',
  'Rooms Manage',
  'Leave Requests',
  'Visitors Pass',
  'Students Manage',
  'Students Payment',
  'Employee Manage',
  'Bill Manage',
  'Notice Board',
  'Settings',
  'Rules',
];
