import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/manage_notifications/attendance/manage_Attendance_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreenNotifications extends StatelessWidget {
  const MainScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  GoogleMonstserratWidgets(text: 'Notification Management',fontsize: 16.w,color: cWhite),
          backgroundColor: adminePrimayColor,
        ),
        body: GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
          ),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ManageAttendanceNotifications(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    // .withOpacity(0.9),
                    // border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(211, 122, 117, 117)
                            .withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.w),
                    )),
                height: 40.h,
                width: 40.w,
                child: Card(
                    child: Center(
                        child: GoogleMonstserratWidgets(
                  text: 'Attendance',
                  fontsize: 19.w,
                  color: cBlack,
                  fontWeight: FontWeight.w600,
                ))),
              ),
            )
          ],
        ));
  }
}
