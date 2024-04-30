import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/screens/dash_board/sections/attendence/others/others_attendence.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/screens/dash_board/sections/attendence/total_students_attendence.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/screens/dash_board/sections/exam_status/exam_status.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/screens/dash_board/sections/totalStudent_graph/totalStudent.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/screens/dash_board/sections/total_members/total_members_section.dart';
import 'package:flutter/material.dart';

class TeacherDashBoardSections extends StatelessWidget {
  const TeacherDashBoardSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 1000 : 670,
      color: const Color.fromARGB(255, 240, 241, 243),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: TextFontWidget(
                  text: 'Teacher Dashboard',
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 25, left: ResponsiveWebSite.isMobile(context) ? 05 : 10),
                child: const TotalMembersSection(),

                ///.............. Total Members Section
              ),
              ResponsiveWebSite.isMobile(context)
                  ? const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: TotalStudentAttendanceContainer(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child:
                              OthersTodayAttendanceContainer(), /////////........ Others --- Attendance
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, right: 0, left: 0),
                          child: TotalStudentContainer(),
                        ),
                      ],
                    )
                  : const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 0, left: 10),
                            child: TotalStudentAttendanceContainer(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 0, left: 10),
                            child:
                                OthersTodayAttendanceContainer(), /////////........ Others --- Attendance
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 0, left: 10),
                            child: TotalStudentContainer(),
                          ),
                        ],
                      ),
                    ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: ExamStatusContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
