import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/exam_notifications/school_notifications.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/exam_notifications/state_level_notifications.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';

class SelectType extends StatefulWidget {
  SelectType({super.key, required this.schoolID});

  String schoolID;

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: screenSize.height * 1.4,
            width: screenSize.width * 1 / 2,
            color: adminePrimayColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButtonBackWidget(
                  color: cWhite,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ! Admin ',
                        style: ralewayStyle.copyWith(
                          fontSize: 42.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      sizedBoxH20,
                      Text(
                        'Exam Notifications',
                        style: ralewayStyle.copyWith(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.width / 3,
                        width: screenSize.width / 2,
                        child: LottieBuilder.network(
                            'https://assets6.lottiefiles.com/packages/lf20_zbfgbsde.json'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width / 10,
                  right: screenSize.width / 10,
                  top: screenSize.height / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SchoolLevelNotifications(
                                  schoolID: widget.schoolID))));
                    },
                    child: SizedBox(
                      width: screenSize.width / 3.5,
                      height: screenSize.height / 4,
                      child: Card(
                        color: const Color.fromARGB(255, 68, 165, 245),
                        child: Center(
                            child: Text('School Level Examinations',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const StateLevelNotifications())));
                    },
                    child: SizedBox(
                      width: screenSize.width / 3.5,
                      height: screenSize.height / 4,
                      child: Card(
                        color: const Color.fromARGB(255, 245, 86, 75),
                        child: Center(
                            child: Text(
                          'Public Level Examinations',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
