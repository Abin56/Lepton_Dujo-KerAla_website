import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/screens/dash_board/sections/attendence/student_attendence_graph.dart';
import 'package:flutter/material.dart';

class TotalStudentAttendanceContainer extends StatelessWidget {
  const TotalStudentAttendanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 320 : 420,
      width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
      decoration:
          BoxDecoration(color: Colors.white, border: Border.all(color: cBlack.withOpacity(0.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20),
            child: TextFontWidget(
              text: "Student Attendance",
              fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: ResponsiveWebSite.isMobile(context) ? 220 : 310,
            child: const StudentsAttendenceCircleGraph(),
          ),
          SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 04,
                            width: 100,
                            color: const Color.fromARGB(255, 48, 79, 254),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 05),
                          child: TextFontWidget(
                            text: 'Present',
                            fontsize: 12.5,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 06),
                          child: TextFontWidget(
                            text: '500',
                            fontsize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 01,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 04,
                            width: 100,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 05),
                          child: TextFontWidget(
                            text: 'Absent',
                            fontsize: 12.5,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 06),
                          child: TextFontWidget(
                            text: '500',
                            fontsize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
