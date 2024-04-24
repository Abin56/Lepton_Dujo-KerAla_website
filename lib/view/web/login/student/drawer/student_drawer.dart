// ignore_for_file: must_be_immutable

import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/dashboard_textFontWidget.dart';
import 'package:flutter/material.dart';

class DrawerSelectedPagesSectionOfStudent extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  DrawerSelectedPagesSectionOfStudent({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: selectedIndex == 0 ? themeColorBlue.withOpacity(0.1) : Colors.transparent,
          child: ListTile(
            leading:
                SizedBox(height: 20, width: 20, child: Image.asset('webassets/png/dashboard.png')),
            onTap: () {
              index = 0;
              onTap.call(index);
            },
            title: Row(
              children: [
                DashboardTextFontWidget(
                  title: 'Dashboard',
                ),
              ],
            ),
          ),
        ), ////////////////////////////////.........................................
        // const SizedBox(
        //   height: 10,
        // ),
        // Container(
        //   color: selectedIndex == 1
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   child: ListTile(
        //     leading: SizedBox(
        //         height: 20,
        //         width: 20,
        //         child: Image.asset('webassets/png/blackboard.png')),
        //     onTap: () {
        //       index = 1;
        //       onTap.call(index);
        //     },
        //     title: DashboardTextFontWidget(
        //       title: 'Class',
        //     ),
        //   ),
        // ), ///////////////////////////////////////////.........................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 25,
        //       width: 25,
        //       child: Image.asset('webassets/png/attendance.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Attendance',
        //   ),
        //   children: <Widget>[
        //     Container(
        //       color: selectedIndex == 2
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       child: ListTile(
        //         onTap: () {
        //           index = 2;
        //           onTap.call(index);
        //         },
        //         title: DashboardTextFontWidget(
        //           title: 'Students',
        //         ),
        //       ),
        //     ), ////////////////////////////////........sub....
        //     ListTile(
        //       tileColor: selectedIndex == 3
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 3;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ), ///////////////////////..........sub........
        //   ],
        // ), ///////////////////////////////////.................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/exam.png')),
        //   title: DashboardTextFontWidget(
        //     title: ' Examinations',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 4
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 5;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Class Test',
        //       ),
        //     ), /////////////////////////////....sub
        //     ListTile(
        //       tileColor: selectedIndex == 6
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 6;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'School Test',
        //       ),
        //     ), ////////////////////........sub
        //   ],
        // ), ///////////////////////////////////////////////.....................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/results.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Results',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 7
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 7;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students',
        //       ),
        //     ), /////////////.....sub......
        //     ListTile(
        //       tileColor: selectedIndex == 8
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 8;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ), /////////////////sub.................
        //   ],
        // ), /////////////////////////////////////////////////.................
        // const SizedBox(
        //   height: 10,
        // ),
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/notice.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Notices',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 9
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 9;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students',
        //       ),
        //     ), //////////////...sub....
        //     ListTile(
        //       tileColor: selectedIndex == 10
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 10;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ), ////////////.....sub....
        //     ListTile(
        //       tileColor: selectedIndex == 11
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 11;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Parents',
        //       ),
        //     ), ////////.........sub....
        //   ],
        // ), /////////////////////////////////////////////////.......................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/banner.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Events',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 12
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 12;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students',
        //       ),
        //     ), ///////.....sub....
        //     ListTile(
        //       tileColor: selectedIndex == 13
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 13;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ), ////////.......sub....
        //     ListTile(
        //       tileColor: selectedIndex == 14
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 14;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Parents',
        //       ),
        //     ), ///////////////////...sub.....
        //   ],
        // ), /////////////////////////////////..................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/meetings.png')),
        //   textColor: Colors.amber,
        //   title: DashboardTextFontWidget(
        //     title: 'Meetings',
        //   ),
        //   children: <Widget>[
        //     // ListTile(
        //     //   tileColor: selectedIndex == 21
        //     //       ? themeColorBlue.withOpacity(0.1)
        //     //       : Colors.transparent,
        //     //   onTap: () {
        //     //     index = 21;
        //     //     onTap.call(index);
        //     //   },
        //     //   title: DashboardTextFontWidget(
        //     //     title: 'PTA',
        //     //   ),
        //     // ),
        //     // ListTile(
        //     //   tileColor: selectedIndex == 22
        //     //       ? themeColorBlue.withOpacity(0.1)
        //     //       : Colors.transparent,
        //     //   onTap: () {
        //     //     index = 22;
        //     //     onTap.call(index);
        //     //   },
        //     //   title: DashboardTextFontWidget(
        //     //     title: 'Mothers PTA',
        //     //   ),
        //     // ),
        //     ListTile(
        //       tileColor: selectedIndex == 15
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 15;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Parents Meeting',
        //       ),
        //     ), //////////...../sub.........
        //     ListTile(
        //       tileColor: selectedIndex == 16
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 16;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers Meeting',
        //       ),
        //     ), ////////////..........sub...
        //   ],
        // ), //////////////////////////////...........................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/notification.png')),
        //   tileColor: selectedIndex == 17
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 17;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Notifications',
        //   ),
        // ), //////////////////////////////////.......................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/student.png')),
        //   tileColor: selectedIndex == 18
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 18;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Student',
        //   ),
        // ), //////////////////////////////////........................
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/teacher (1).png')),
        //   tileColor: selectedIndex == 19
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 19;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Teacher',
        //   ),
        // ), /////////////////////////////......................
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/parents.png')),
        //   tileColor: selectedIndex == 20
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 20;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Parent',
        //   ),
        // ), //////////////////////////////////////........................
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/createadmin.png')),
        //   tileColor: selectedIndex == 21
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 21;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Create Admin',
        //   ),
        // ), //////////////////////////////////////.................................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/generalinstruction.png')),
        //   tileColor: selectedIndex == 22
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 22;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'General Instructions',
        //   ),
        // ), ///////////////////////////////////...................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/achive.png')),
        //   tileColor: selectedIndex == 23
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 23;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Achievements',
        //   ),
        // ), //////////////////////////////////////...........................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/fees&bills.png')),
        //   tileColor: selectedIndex == 24
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 24;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Fees and Bills',
        //   ),
        // ), ///////////////////////////////////////...............................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/batchhistory.png')),
        //   tileColor: selectedIndex == 25
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 25;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Batch History',
        //   ),
        // ), ///////////////////////////////.............................
        // const SizedBox(
        //   height: 10,
        // ),
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('webassets/png/timetable.png')),
        //   tileColor: selectedIndex == 26
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 26;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'TimeTable',
        //   ),
        // ), ////////////////////////////////////........................
        // const SizedBox(
        //   height: 10,
        // ),
      ],
    );
  }
}
