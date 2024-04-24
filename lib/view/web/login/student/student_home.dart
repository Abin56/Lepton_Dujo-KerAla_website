import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/login/student/app_bar/student_appBar.dart';
import 'package:dujo_kerala_website/view/web/login/student/drawer/student_drawer.dart';
import 'package:dujo_kerala_website/view/web/login/student/student_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';



class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                AppBarStudentPanel(),
                pages[selectedIndex],
              ],
            ),
            drawer: Container(
              color: cWhite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,bottom: 550),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset(
                                'webassets/images/leptonlogo.png',
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
                      DrawerSelectedPagesSectionOfStudent(
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

List<Widget> pages = [
  StudentDashBoardScreen(),
  Center(
    child: Text(sideMenu[2]),
  ),
  Center(
    child: Text(sideMenu[3]),
  ),
  Center(
    child: Text(sideMenu[4]),
  ),
  Center(
    child: Text(sideMenu[5]),
  ),
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
