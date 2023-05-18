// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_adjacent_string_concatenation
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/Iconbackbutton.dart';

class ManageTeachers extends StatelessWidget {
  const ManageTeachers({super.key});

  get imageUrl => null;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButtonBackWidget(color: cBlue),
              SizedBox(
                width: 600.w,
              ),
              Text(
                "Manage Teachers",
                style: TextStyle(
                    fontSize: 25.w, fontWeight: FontWeight.bold, color: cBlue),
              )
            ],
          ),
          SizedBox(height: 30.w),
          Container(
            height: 350.h,
            width: 300.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: SizedBox(
                    child: CircleAvatar(
                      radius: 40.w,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 184, 135, 131),
                            radius: 12.w,
                            child: Icon(
                              Icons.camera_alt,
                              size: 15.w,
                              color: Color(0xFF404040),
                            ),
                          ),
                        ),
                        radius: 38.w,
                        backgroundImage: NetworkImage(
                            'https://i.insider.com/5e820b04671de06758588fb8?width=700'),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 16.w),
                    child: GoogleMonstserratWidgets(
                      text: 'Name : ' + ' Malar',
                      fontsize: 25.w,
                      color: cWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 8.w),
                    child: GoogleMonstserratWidgets(
                      text: 'Emp ID : ' + ' 123456',
                      fontsize: 15.w,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 8.w),
                    child: GoogleMonstserratWidgets(
                      text: 'Subject : ' + ' Maths',
                      fontsize: 15.w,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 8.w),
                    child: GoogleMonstserratWidgets(
                      text: 'Std : ' + ' 8A',
                      fontsize: 15.w,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: TextButton(
                      onPressed: () {
                        print('im pressed');
                      },
                      child: Container(
                        height: 40.h,
                        width: 150.w,
                        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 49, 179, 140),
                          borderRadius: BorderRadius.all(Radius.circular(7.h)),
                        ),
                        child: GoogleMonstserratWidgets(
                          text: 'Edit Profile',
                          fontsize: 15.w,
                          color: cWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(16.h),
            ),
          ),
        ],
      ),
    ));
  }
}
