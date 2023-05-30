// ignore_for_file: prefer__fields, must_be_immutable, prefer_final_fields, prefer_const_constructors

import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/footer_mob.dart';
import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/footerhomep.dart';
import 'package:dujo_kerala_website/utils/responsive.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/home/create_school/create_school.dart';
import 'package:dujo_kerala_website/view/web/login/loginscreen.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../view/constant/constant.dart';
import 'FeatureTile.dart';
import '_drawer.dart';

class HomePageResponse extends StatelessWidget {
  HomePageResponse({super.key});

  String _imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";

  String _description = "Any schools from Kerala can register on\n"
      "Lepton DuJo. Lepton Dujo is a mobile \n"
      "application with student login,parent, \n"
      "teacher login";

  Uri _faceBookUrl =
      Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
  Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
  Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
  Uri _utubeUrl = Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
  Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

  Future<void> _launchFacebookUrl() async {
    if (!await launchUrl(_faceBookUrl)) {
      throw 'Could not launch $_faceBookUrl';
    }
  }

  Future<void> _launchTwitterUrl() async {
    if (!await launchUrl(_twitterUrl)) {
      throw 'Could not launch $_twitterUrl';
    }
  }

  Future<void> _launchyouTubeUrl() async {
    if (!await launchUrl(_utubeUrl)) {
      throw 'Could not launch $_utubeUrl';
    }
  }

  Future<void> _launchInstaUrl() async {
    if (!await launchUrl(_instaUrl)) {
      throw 'Could not launch $_instaUrl';
    }
  }

  Future<void> _launchleptonUrl() async {
    if (!await launchUrl(_leptonUrl)) {
      throw 'Could not launch $_leptonUrl';
    }
  }

  List<String> containerNames = [
    'DuJo Schools',
    'DuJo Colleges',
    'DuJo Institution ',
    'DuJo Professional',
  ];

  List<String> assetsimages = [
    "assets/images/attitude_girl.png",
    "assets/images/college.png",
    "assets/images/intitute.png",
    "assets/images/professional.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17BDB5),
      body: ResponsiveWidget.isSmallScreen(context)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: const Color(0xFF17BDB5),
                        width: double.infinity,
                        height: 70.h,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15.h,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExploreDrawer(),
                                    ));
                              },
                              icon: const Icon(Icons.menu),
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            Image.asset(
                              "assets/images/leptdujo.png",
                              height: 130.h,
                              width: 100.h,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 75.h),
                          child: Image.network(_imageUrl)),
                      FeatureTile(
                        iconImageUrl: "boy.png",
                        title: _description,
                        topMargin: 325.0.h,
                      ),
                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "women1.png",
                          title: "Add Teacher Add classes Create and publish\n"
                              "notice Create and share events info"),
                      FeatureTile(
                          topMargin: 450.0.h,
                          iconImageUrl: "web_port.png",
                          title:
                              "A web portal is therefore adding the school infra \n"),
                      FeatureTile(
                          topMargin: 700.0.h,
                          iconImageUrl: "admin_login.png",
                          title: "Admin Login -   Add Teacher, Add classes,\n "
                              "Create and Publish Notices, Add Pta Members\n"
                              "Create and share events info, Mannage Meetings\n"
                              "Manage Recorded and Live Classes\n"),
                      FeatureTile(
                          topMargin: 825.0.h,
                          iconImageUrl: "class_teacher.png",
                          title: "ClassTeacher Login - Manage Student list, \n"
                              "Manage Subject, Manage Parent's list,\n"
                              "Manage Teacher's list,Upload progress reports \n"
                              "Create and upload timetable,Chat with parents\n"
                              "Online classes, Upload recorded classes\n"),
                      FeatureTile(
                          topMargin: 955.0.h,
                          iconImageUrl: "record.png",
                          title:
                              "Teacher Login -Manage Timetable, Manage Classes\n"
                              "Create Teaching Notes, Share Exam results\n"
                              "Upload Study Materials, Upload recorded classes\n"
                              "Schedule and conduct Online Classes"),
                      FeatureTile(
                          topMargin: 1080.0.h,
                          iconImageUrl: "students.png",
                          title: "Student Login - View assigned homework\n"
                              "View Schedule exam and test results, View notice\n"
                              "View Bus route on google Maps, View timetable \n"
                              "View Schedule events, View Progress report\n"
                              "Attent Live and view recorded class"),
                      FeatureTile(
                          topMargin: 1205.0.h,
                          iconImageUrl: "parents.png",
                          title:
                              "Parent login - Live Attendance, Progress Report\n"
                              "Live School bus tracking, Leave letter\n"
                              "Exam Result, Events and notice , Chat with teachers"),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.h, top: 165.h),
                            child: Text(
                              "Watch and Guide,\n"
                              "Let them study!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.h,
                                  color: cWhite),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 350.h, top: 120.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "DuJo Schools",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20.h,
                                      color: cWhite),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 310.h, top: 150.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/dujo_logo.png",
                                  height: 40.h,
                                  width: 70.h,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 450.h,
                            width: 450.h,
                            margin: EdgeInsets.only(left: 2.h, top: 68.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/attitude_girl 2.png",
                                  height: 250.h,
                                  width: 250.h,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  sizedBoxH10,
                  sizedBoxH10,
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop to laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Schools',
                        fontsize: 20.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  sizedBoxH30,

                  ////////////////////////////////////////
                  ///

                  Stack(
                    children: [
                      SizedBox(
                          // margin: EdgeInsets.only(top: 50.h),
                          height: 300.h,
                          width: double.infinity,
                          // color: cBlue,

                          child: Image.asset(
                            'assets/images/college.png',
                            fit: BoxFit.cover,
                          )),

                      ///////////////

                      FeatureTile(
                        iconImageUrl: "record.png",
                        topMargin: 325.0.h,
                        title:
                            "All the collages affiliated to any university in kerala \n"
                            "can register in DuJo colleges.",
                      ),
                      FeatureTile(
                        topMargin: 450.h,
                        iconImageUrl: "record.png",
                        title: "Live classes and recorded classes ",
                      ),

                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "class_teacher.png",
                          title:
                              "Add Teacher, Add classes, Create and publish\n"
                              "notice Create and share events info"),

                      FeatureTile(
                          topMargin: 700.h,
                          iconImageUrl: "chatgpt.png",
                          title:
                              "Intergrated CHAT GPT will help students to prepare\n"
                              " assigenments and project"),

                      FeatureTile(
                          topMargin: 825.h,
                          iconImageUrl: "study_material.png",
                          title: "Study material upload."),

                      FeatureTile(
                          topMargin: 955.h,
                          iconImageUrl: "live.png",
                          title: "Live doubt clearing."),

                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.h, top: 12.h),
                            child: Text(
                              "Keep Going, we provide\n"
                              "Everything you need",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 17.h,
                                  color: cWhite),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 249.h, top: 42.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "DuJo Colleges",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12.h,
                                      color: cWhite),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 208.h, top: 10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/dujo_logo.png",
                                  height: 40.h,
                                  width: 70.h,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  sizedBoxH10,
                  sizedBoxH10,
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop to laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Colleges',
                        fontsize: 20.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  sizedBoxH30,

                  ////////////////////////////////////

                  Stack(
                    children: [
                      SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: Container(
                              color: cred,
                              child: Image.asset(
                                'assets/images/intitute.png',
                                fit: BoxFit.cover,
                              ))),
                      FeatureTile(
                        iconImageUrl: "boy.png",
                        topMargin: 280.0,
                        title: " Dujo is designed for coaching center \n"
                            "and finishing schools",
                      ),
                      FeatureTile(
                          topMargin: 450.0.h,
                          iconImageUrl: "teacher.jpg",
                          title: "Add Teacher Add classes Create and publish \n"
                              "notice Create and share events info"),
                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "live.png",
                          title: "Live doubt clearing"),
                      FeatureTile(
                          topMargin: 700.h,
                          iconImageUrl: "live.png",
                          title: "Live mock tests"),
                      FeatureTile(
                          topMargin: 825.h,
                          iconImageUrl: "record.png",
                          title: "Hybrid courses"),
                      FeatureTile(
                          topMargin: 955.h,
                          iconImageUrl: "record.png",
                          title: "Recorded courses"),
                      FeatureTile(
                          topMargin: 1080.h,
                          iconImageUrl: "live.png",
                          title: "Live courses"),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.h, top: 10.h),
                            child: Text(
                              "Its in you, Awake\n"
                              " And chase your dream",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12.h,
                                  color: cWhite),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 305.h, top: 125.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "DuJo Institutions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12.h,
                                      color: cWhite),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 240.h, top: 98.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/dujo_logo.png",
                                  height: 40.h,
                                  width: 70.h,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  sizedBoxH10,
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop to laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Institutions',
                        fontsize: 12.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  sizedBoxH30,

                  ////////////////////////////////////////////

                  Stack(
                    children: [
                      SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: Image.asset("assets/images/professional.png",
                              fit: BoxFit.cover)),
                      FeatureTile(
                        iconImageUrl: "professional.png",
                        topMargin: 325.0.h,
                        title:
                            "Any educationals profitionals can register their\n"
                            " profile DuJo profitonails",
                      ),
                      FeatureTile(
                          topMargin: 450.h,
                          iconImageUrl: "teacher.jpg",
                          title: "Add Teacher Add classes Create and publish \n"
                              "notice Create and share events info"),
                      FeatureTile(
                          topMargin: 575.h,
                          iconImageUrl: "professional.png",
                          title:
                              "Professionals can invites their students to \n"
                              "join the app"),
                      FeatureTile(
                          topMargin: 635,
                          iconImageUrl: "live.png",
                          title: "Live doubt clearing"),
                      FeatureTile(
                          topMargin: 750,
                          iconImageUrl: "mock_test.png",
                          title: "Live mock tests"),
                      FeatureTile(
                          topMargin: 865,
                          iconImageUrl: "record.png",
                          title: "Hybrid courses"),
                      FeatureTile(
                          topMargin: 980,
                          iconImageUrl: "record.png",
                          title: "Recorded courses"),
                      FeatureTile(
                          topMargin: 1095,
                          iconImageUrl: "live.png",
                          title: "Live courses"),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.h, top: 110.h),
                            child: Text(
                              "Logon, feed your mind\n"
                              "Change the world",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 25.h,
                                  color: cBlack),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 280.h, top: 64.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "DuJo Professionals",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20.h,
                                      color: cBlack),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 235.h, top: 28.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/dujo_logo.png",
                                  height: 40.h,
                                  width: 70.h,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  sizedBoxH10,
                  sizedBoxH10,
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: GoogleMonstserratWidgets(
                                text: 'Login in desktop to laptop',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w600),
                            content: Container(
                                child: GoogleMonstserratWidgets(
                                    text: 'To get better Experience ',
                                    fontsize: 14.h,
                                    fontWeight: FontWeight.w600)),
                            actions: <Widget>[
                              TextButton(
                                child: GoogleMonstserratWidgets(
                                    text: 'Close',
                                    fontsize: 16.h,
                                    fontWeight: FontWeight.w600),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8.h))),
                      height: 50.h,
                      width: 260.h,
                      child: Center(
                          child: GoogleMonstserratWidgets(
                        text: 'Register Professionals',
                        fontsize: 12.h,
                        color: cWhite,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),

                  sizedBoxH20,
                  // const Divider(
                  //   color: cBlack,
                  // ),
                  sizedBoxH20,
                  FooterMob()
                ],
              ),
            )
          :

          //////////////////////////////////////// web
          ///
          ///
          ///
          ///
          ///
          ///
          ///
          ///
          ///
          ///

          ListView(children: [
              Padding(
                padding: EdgeInsets.only(right: 80.0.w, left: 80.w),
                child: SizedBox(
                  //
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // fgkjsdl;fjal;dfjs
                        //color: cBlue,
                        width: 450.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.phone),
                                SizedBox(
                                  width: 5.h,
                                ),
                                Text(
                                  '+91 8891436651',
                                  style: GoogleFonts.poppins(
                                      color: adminePrimayColor,
                                      //Color(0xFF17BDB5),
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.h),
                            Row(
                              children: [
                                const Icon(Icons.mail),
                                SizedBox(
                                  width: 5.h,
                                ),
                                Text(
                                  'leptondujo@gmail.com',
                                  style: GoogleFonts.poppins(
                                      // adminePrimayColor,
                                      color: adminePrimayColor,
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      //SizedBox(width: 20.h),
                      //SizedBox(width: 20.h),
                      // SizedBox(width: 20.h),
                      // SizedBox(width: 20.h),
                      // SizedBox(width: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 200.w),
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Enter Your School ID'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          GetSchoolListDropDownButton()
                                        ],
                                        // children: [
                                        //   // TextFormField(
                                        //   //   controller:schoolIdController,
                                        //   // )
                                        // ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ok'),
                                        onPressed: () async {
                                          if (schoolListValue['docid'] ==
                                              null) {
                                            return showDialog(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Alert'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: const <Widget>[
                                                        Text(
                                                            'Sorry you have no access to delete')
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('Ok'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            await Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const LoginScreen();
                                              },
                                            ));
                                          }
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.bold,
                                  color: cred),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.w),
                        child: Container(
                          //  width: MediaQuery.of(context).size.hidth / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  _launchFacebookUrl();
                                },
                                child: Image.asset(
                                  'assets/images/frdd.png',
                                  height: 25.h,
                                  width: 38.w,
                                  color: adminePrimayColor,
                                  //Color(0xFF17BDB5),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () {
                                  _launchInstaUrl();
                                },
                                child: Image.asset(
                                  'assets/images/instag.png',
                                  height: 40.h,
                                  width: 40.w,
                                  color: adminePrimayColor,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () {
                                  _launchTwitterUrl();
                                },
                                child: Image.asset(
                                  'assets/images/twitt.png',
                                  height: 29.h,
                                  width: 30.w,
                                  color: adminePrimayColor,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () {
                                  _launchyouTubeUrl();
                                },
                                child: Image.asset(
                                  'assets/images/utube.png',
                                  height: 28.h,
                                  width: 28.w,
                                  color: adminePrimayColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 80.0.w, left: 80.w, top: 25.h),
                child: Container(
                  // color: cWhite,
                  width: MediaQuery.of(context).size.width,
                  height: 600.h,
                  color: const Color(0xFF17BDB5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          //  / mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // color: cBlue,
                              width: 140.w,
                              height: 100.h,
                              child: Image.asset(
                                'assets/images/leptdujo.png',
                                // color: Color(0xFF17BDB5).hithOpacity(0.5),
                                width: 170.h,
                                height: 170.h,
                              ),
                            ),
                            // sizedBoxH40,
                            // sizedBoxH40,
                            // sizedBoxH20,
                            Padding(
                              padding: EdgeInsets.only(top: 85.h),
                              child: Container(
                                // color: cred,
                                child: Text(
                                  'Watch And Guide,\nLet Them Study',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 45.w,
                                    fontWeight: FontWeight.bold,
                                    color: adminePrimayColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            sizedBoxH20,
                            sizedBoxH20,
                            // sizedBoxH20,
                            MaterialButton(
                              //padding: EdgeInsets.all(20),
                              height: 60.h,
                              minWidth: 250.w,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SchoolProfile.route);
                              },
                              color: adminePrimayColor,
                              child: Text(
                                'Create School Profile',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),

              sizedBoxH100,
              //sizedBoxH40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextContainerWidget(
                    text: 'DuJo SCHOOLS',
                    text1: "* Add Teacher Add classes Create and publish"
                        "notice Create and share events info",
                    text2:
                        "* A web portal is therefore adding the school infra ",
                    text3: "* Admin Login -   Add Teacher, Add classes,"
                        "Create and Publish Notices, Add Pta Members"
                        "Create and share events info,\n"
                        "Mannage Meetings  Manage Recorded and Live Classes",
                    text4: "* Admin Login -    Add Teacher, Add classes,"
                        "Create and Publish Notices, Add  Pta Members\n"
                        "Create and share events info, Mannage Meetings"
                        "Manage Recorded and Live Classes",
                    text5: "* Teacher Login -Manage Timetable, Manage Classes"
                        "Create Teaching \n"
                        " Notes, Share Exam results Upload Study Materials, Upload recorded classes"
                        "Schedule and conduct Online Classes",
                    text6: "* Student Login - View assigned homework"
                        "View Schedule exam and \n"
                        "test results, View notice"
                        "View Bus route on google Maps, View timetable "
                        "View Schedule events, View Progress report"
                        "Attent \n"
                        " Live and view recorded class",
                    text7: "* Parent login - Live Attendance, Progress Report"
                        "Live School bus tracking, Leave letter"
                        "Exam Result, Events and notice , Chat with teachers",
                    text8: '',
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  ImageContainerWidget(
                    Imagename: 'Schoolsfin.png',
                  )
                ],
              ),

              sizedBoxH40,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageContainerWidget(
                    Imagename: 'college.png',
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  TextContainerWidget(
                    text: 'DuJo COLLEGES',
                    text1:
                        "* All the collages affiliated to any university in kerala "
                        "can register in DuJo colleges.",
                    text2: "* Live classes and recorded classes  ",
                    text3: "* Add Teacher, Add classes, Create and publish\n"
                        "notice Create and share events info",
                    text4:
                        "* Intergrated CHAT GPT will help students to prepare\n"
                        " assigenments and project",
                    text5: "*Study material upload.",
                    text6: "* Live doubt clearing.",
                    text7: "",
                    text8: '',
                  )
                ],
              ),
              sizedBoxH40,

/////////////////////////////////////////////////////////////////////////////////////

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextContainerWidget(
                    text: 'DuJo PROFESSIONALS',
                    text1:
                        "* Any educationals profitionals can register their\n"
                        " profile DuJo profitonails",
                    text2: "* Add Teacher Add classes Create and publish \n"
                        "notice Create and share events info",
                    text3: "* Professionals can invites their students to \n"
                        "join the app",
                    text4: "* Admin Login -   Add Teacher, Add classes,\n "
                        "Create and Publish Notices, Add Pta Members\n"
                        "Create and share events info, Mannage Meetings\n"
                        "Manage Recorded and Live Classes\n",
                    text5: "* Live doubt clearing",
                    text6: "* Live mock tests",
                    text7: "* Hybrid courses",
                    text8: 'Live courses',
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  ImageContainerWidget(
                    Imagename: 'professional.png',
                  )
                ],
              ),
              sizedBoxH40,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageContainerWidget(
                    Imagename: 'intitute.png',
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  TextContainerWidget(
                    text: 'DuJo INSTITUTIONS',
                    text1: "* Dujo is designed for coaching center \n"
                        "and finishing schools",
                    text2: "* Add Teacher Add classes Create and publish \n"
                        "notice Create and share events info",
                    text3: "* Live doubt clearing",
                    text4: "* Live mock tests",
                    text5: "* Hybrid courses",
                    text6: "* Recorded courses",
                    text7: "* Live courses",
                    text8: '',
                  ),
                ],
              ),
              sizedBoxH40,

              FooterHomeP()
            ]),
    );
  }
}

class ImageContainerWidget extends StatelessWidget {
  String Imagename;
  ImageContainerWidget({
    required this.Imagename,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.h,
      width: 550.w,
      decoration: BoxDecoration(
          //  border: Border.all(),
          // color: cWhite,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Image.asset('assets/images/$Imagename', fit: BoxFit.cover),
    );
  }
}

class TextContainerWidget extends StatelessWidget {
  String text;
  String text1;
  String text2;
  String text3;
  String text4;
  String text5;
  String text6;
  String text7;
  String text8;

  TextContainerWidget({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.w),
      height: 550.h,
      width: 550.w,
      decoration: BoxDecoration(
          //  border: Border.all(),
          // color: cWhite,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH10,
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text,
                fontsize: 18.w,
                fontWeight: FontWeight.w900,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text1,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text2,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text3,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text4,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text5,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text6,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text7,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
            sizedBoxH10,
            GoogleMonstserratWidgets(
                text: text8,
                fontsize: 15.w,
                fontWeight: FontWeight.w600,
                color: cWhite),
          ]),
    );
  }
}
