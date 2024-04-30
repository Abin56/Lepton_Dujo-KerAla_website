import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/Fees_and_bills/Fees/fees_and_bills.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/Students_ScholarShip/student_scholarship.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/achievements/achievements.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_meeting/meeting_in.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_notice/add_new_notices.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_pta/admin_pta_screen.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/alumni_association/alumni_association.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/attendance_edit/add_attendance_home_page.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/bus_Route/bus_route.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/add_class.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/create_Admin/add_new_admin.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/events/events_screen.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/exam_notifications/school_notifications.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/food_and_beverages/food_and_bev.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/general_instructions/creation_general_instruction_.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/mothers_pta/mothers_pta_screen.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/non_Teaching_staff/non_teaching_staff.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/shift_class/shift_classpage.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/students_proctection_group.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/add_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key, required this.schoolID});

  final String schoolID;
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
    'Food and Beverages',
    'Exam Notifications',
    'Alumni Associations',
    'Class Promotion',
    'Non-Teaching Staffs',
    'Add Attendance',
    // 'Handle Parents with\n Multiple Children'
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
    'assets/images/fast-food.png',
    'assets/images/exam.png',
    'assets/images/alumni.png',
    'assets/images/exchange.png',
    'assets/images/steward.png',
    'assets/images/attendance.png',
    'assets/images/admin.png',
    'assets/images/attendance.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      AddNewAdmin(schoolID: widget.schoolID), //1-create admin
      AddTeacherSectionScreen(schoolID: widget.schoolID), //2-Teachers
      AddClassesSectionScreen(
        schoolID: widget.schoolID,
      ), //3-classes
      CreationGeneralInstruction(schoolId: widget.schoolID), //4-general instructions
      AddNewNotices(schoolId: widget.schoolID), //5-notices
      EventsUpdates(schoolID: widget.schoolID), //6-events
      const FeesAndBillsWeb(), //fees and bills
      MeetingCreates(
        schoolId: widget.schoolID,
      ), //8-Meetings\
      AdminPtaScreen(), //9-PTA
      MothersPtaScreen(), //10-Mothers PTA
      Achievements(schoolID: widget.schoolID), //11-Achievements
      StudentProtectionGroup(), //12-Students Protection Group
      AdminScholarships(schoolID: widget.schoolID), //13-ScholarShip

      const BusRoute(), //14-Bus Route
      FoodBeverages(schoolID: widget.schoolID),
      SchoolLevelNotifications(schoolID: widget.schoolID),
      AlumniAssociation(),
      ShiftClassPage(),
      NonTeachingLogin(schoolID: widget.schoolID),
      AddAttendnceHomePage(),
      // const HandleParentsWithMultipleChildren()
    ];

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: adminePrimayColor,
      ),
      body: Expanded(
        child: SizedBox(
          height: screenSize.height - 60,
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0, left: 50),
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
      ),
    );
  }
}
