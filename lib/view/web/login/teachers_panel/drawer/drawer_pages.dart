// ignore_for_file: must_be_immutable


import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/dashboard_textFontWidget.dart';
import 'package:flutter/material.dart';

class DrawerSelectedPagesSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  DrawerSelectedPagesSection({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assests/png/dashboard.png')),
          tileColor: selectedIndex == 0
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
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
         ListTile(
          leading: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/png/3d-house.png')),
          tileColor: selectedIndex == 0
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 0;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'Home',
              ),
            ],
          ),
        ),
        sizedBoxH10,
        ListTile(
          leading: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/events.png')),
          tileColor: selectedIndex == 1
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 1;
            onTap.call(index);
          },
          title: DashboardTextFontWidget(
            title: 'Event',
          ),
        ),
        sizedBoxH10,
        ListTile(
          leading: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/notice.png')),
          tileColor: selectedIndex == 1
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 1;
            onTap.call(index);
          },
          title: DashboardTextFontWidget(
            title: 'Notice',
          ),
        ),
        sizedBoxH10,
        ListTile(
          leading: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/students.png')),
          tileColor: selectedIndex == 1
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 1;
            onTap.call(index);
          },
          title: DashboardTextFontWidget(
            title: 'Students List',
          ),
        ),
        sizedBoxH10,
         ListTile(
          leading: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/students.png')),
          tileColor: selectedIndex == 1
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 1;
            onTap.call(index);
          },
          title: DashboardTextFontWidget(
            title: 'My Students ',
          ),
        ),
        sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 25,
        //       width: 25,
        //       child: Image.asset('assets/images/notice.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Notice',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 2
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 2;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students List',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 3
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 3;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'My Students',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 4
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 4;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Non teaching staffs',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/users.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'User categories',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 5
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 5;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 6
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 6;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 7
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 7;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Non teaching staffs',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/exam.png')),
        //   title: DashboardTextFontWidget(
        //     title: ' Examinations',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 8
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 8;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Class Test',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 9
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 9;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'School Test',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 10
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 10;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'School level exams',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 11
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 11;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Public level exams',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/results.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Results',
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
        //     ),
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
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 14
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 14;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Non teaching staffs',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/notice.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Notices',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 15
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 15;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 16
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 4;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 17
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 17;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Parents',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/banner.png')),
        //   title: DashboardTextFontWidget(
        //     title: 'Events',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 18
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 18;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Students',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 19
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 19;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 20
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 20;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Parents',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ExpansionTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/meetings.png')),
        //   textColor: Colors.amber,
        //   title: DashboardTextFontWidget(
        //     title: 'Meetings',
        //   ),
        //   children: <Widget>[
        //     ListTile(
        //       tileColor: selectedIndex == 21
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 21;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'PTA',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 22
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 22;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Mothers PTA',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 23
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 23;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Parents Meeting',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 24
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 24;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Teachers Meeting',
        //       ),
        //     ),
        //     ListTile(
        //       tileColor: selectedIndex == 25
        //           ? themeColorBlue.withOpacity(0.1)
        //           : Colors.transparent,
        //       onTap: () {
        //         index = 25;
        //         onTap.call(index);
        //       },
        //       title: DashboardTextFontWidget(
        //         title: 'Custom Meeting',
        //       ),
        //     ),
        //   ],
        // ),
        // sizedBoxH10,
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/notification.png')),
        //   tileColor: selectedIndex == 26
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 26;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Notifications',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/tracking.png')),
        //   tileColor: selectedIndex == 27
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 27;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Bus Tracking',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   tileColor: selectedIndex == 28
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 28;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Create Admin',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   tileColor: selectedIndex == 29
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 29;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'General Instructions',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   tileColor: selectedIndex == 30
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 30;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'General Instructions',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   tileColor: selectedIndex == 31
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 31;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Fees and bills',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   tileColor: selectedIndex == 32
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 32;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Alumni Associations',
        //   ),
        // ),
        // sizedBoxH10,
        // ListTile(
        //   tileColor: selectedIndex == 33
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 33;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Class promotions',
        //   ),
        // ),
      ],
    );
  }
}
