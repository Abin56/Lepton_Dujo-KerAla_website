// ignore_for_file: prefer_final_fields

import 'package:dujo_kerala_website/utils/responsive.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/home/create_school/create_school.dart';
import 'package:dujo_kerala_website/view/web/home/footer/footerhomep.dart';
import 'package:dujo_kerala_website/view/web/login/loginscreen.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../view/constant/constant.dart';
import '../../../../view/web/home/mob_view.dart/feature_tile.dart';
import '_drawer.dart';

class HomePageResponse extends StatelessWidget {
   HomePageResponse({super.key});

  String _imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";
 
    String _description = "Any schools from Kerala can register on\n"
    "Lepton DuJo. Lepton Dujo is a mobile \n"
    "application with student login,parent, \n"
    "teacher login";

    
  final Uri _faceBookUrl =
      Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
  final Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
  final Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
  final Uri _utubeUrl =
      Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
  final Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

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
      ?  SingleChildScrollView(
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
                        SizedBox(width: 15.h,),
                        IconButton(
                          onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ExploreDrawer(),));
                        },
                        icon: const Icon(Icons.menu),
                        ),
                        SizedBox(width: 20.h,),
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

                  FeatureTile(iconImageUrl: "boy.png", title: _description, topMargin: 290.0,),

                  FeatureTile(topMargin: 520, iconImageUrl: "women1.png", title: "Add Teacher Add classes Create and publish\n"
                      "notice Create and share events info"),


                       FeatureTile(topMargin: 405.0, iconImageUrl: "web_port.png", title: "A web portal is therefore adding the school infra \n" ),



                       FeatureTile(topMargin: 635.0, iconImageUrl: "admin_login.png", title: "Admin Login -   Add Teacher, Add classes,\n " 
                       "Create and Publish Notices, Add Pta Members\n"
                       "Create and share events info, Mannage Meetings\n"
                       "Manage Recorded and Live Classes\n"
                       ),
      
      
                       FeatureTile(topMargin: 750.0, iconImageUrl: "class_teacher.png", title: "ClassTeacher Login - Manage Student list, \n"
                       "Manage Subject, Manage Parent's list,\n"
                       "Manage Teacher's list,Upload progress reports \n"
                       "Create and upload timetable,Chat with parents\n"
                       "Online classes, Upload recorded classes\n"),
      
      
                       FeatureTile(topMargin: 865.0, iconImageUrl: "record.png", title: "Teacher Login -Manage Timetable, Manage Classes\n"
                       "Create Teaching Notes, Share Exam results\n"
                       "Upload Study Materials, Upload recorded classes\n"
                       "Schedule and conduct Online Classes"
                       ),
      
      
                       FeatureTile(topMargin: 980.0, iconImageUrl: "students.png", title: "Student Login - View assigned homework\n"
                       "View Schedule exam and test results, View notice\n"
                       "View Bus route on google Maps, View timetable \n"
                       "View Schedule events, View Progress report\n"
                       "Attent Live and view recorded class"
                        ),
      
      
                       FeatureTile(topMargin: 1095.0, iconImageUrl: "parents.png", title: "Parent login - Live Attendance, Progress Report\n"
                       "Live School bus tracking, Leave letter\n"
                       "Exam Result, Events and notice , Chat with teachers"
                        ),
                      
                      
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.w,top: 180.w),
                        child: Text(
                          "Watch and Guide,\n"
                              "Let them study!",style:
                        TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.h,
                            color: cWhite),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 340.w,top: 208.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Schools",style:
                            TextStyle(
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
                        margin: EdgeInsets.only(left: 310.w,top: 175.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/dujo_logo.png",
                              height: 40.w,
                              width: 70.w,),
                            Text(
                              "",style:
                            TextStyle(
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
                        height: 450.w,
                              width: 450.w,
                        margin: EdgeInsets.only(left: 2.w,top: 68.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/attitude_girl 2.png",
                              height: 250.w,
                              width: 250.w,),
                            Text(
                              "",style:
                            TextStyle(
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
              
                title: GoogleMonstserratWidgets(text: 'Login in desktop to laptop',fontsize: 16.h,fontWeight: FontWeight.w600),
                content: Container(
                  child: GoogleMonstserratWidgets(text:'To get better Experience ',fontsize: 14.h,fontWeight: FontWeight.w600)),
                actions: <Widget>[
                  TextButton(
                    child: GoogleMonstserratWidgets(text: 'Close',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                    borderRadius: BorderRadius.all(
                    Radius.circular(8.w))),
                          height: 50.h,
                          width: 260.h,
                         
                        child: Center(child: 
                        GoogleMonstserratWidgets(
                          text: 'Register Schools',fontsize: 20.h,
                          color: cWhite,fontWeight: FontWeight.w600,)
                        ),),
               ),
      
      
               sizedBoxH30,
      
      
               ////////////////////////////////////////
               ///
               
      
      
              Stack(
                children: [
                  SizedBox(
                     // margin: EdgeInsets.only(top: 50.h),
                     height: 300.w,
                              width:double.infinity,
                    // color: cBlue,
                    
                        
      
                     child: Image.asset('assets/images/college.png',fit:  BoxFit.cover,)),
      
      
                      ///////////////
      
                  FeatureTile(iconImageUrl: "record.png", topMargin: 290.0, title: "All the collages affiliated to any university in kerala \n"
                  "can register in DuJo colleges.",
                  ),
                  FeatureTile(topMargin:405 , iconImageUrl: "record.png", title: "Live classes and recorded classes ",),

                  FeatureTile(topMargin: 520, iconImageUrl: "class_teacher.png", title: "Add Teacher, Add classes, Create and publish\n"
                      "notice Create and share events info"),

                      FeatureTile(topMargin: 635, iconImageUrl: "chatgpt.png", title: "Intergrated CHAT GPT will help students to prepare\n"
                      " assigenments and project"),

                      FeatureTile(topMargin: 750, iconImageUrl: "study_material.png", title: "Study material upload."),

                      FeatureTile(topMargin: 865, iconImageUrl: "live.png", title: "Live doubt clearing."),
                      
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 68.w,top: 18.w),
                        child: Text(
                          "Keep Going, we provide\n"
                              "Everything you need",style:
                        TextStyle(
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
                        margin: EdgeInsets.only(left: 242.w,top: 42.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Colleges",style:
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 18.h,
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
                        margin: EdgeInsets.only(left: 203.w,top: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/dujo_logo.png",
                              height: 40.w,
                              width: 70.w,),
                            Text(
                              "",style:
                            TextStyle(
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
              
                title: GoogleMonstserratWidgets(text: 'Login in desktop to laptop',fontsize: 16.h,fontWeight: FontWeight.w600),
                content: Container(
                  child: GoogleMonstserratWidgets(text:'To get better Experience ',fontsize: 14.h,fontWeight: FontWeight.w600)),
                actions: <Widget>[
                  TextButton(
                    child: GoogleMonstserratWidgets(text: 'Close',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                    borderRadius: BorderRadius.all(
                    Radius.circular(8.w))),
                          height: 50.h,
                          width: 260.h,
                         
                        child: Center(child: 
                        GoogleMonstserratWidgets(
                          text: 'Register Colleges',fontsize: 20.h,
                          color: cWhite,fontWeight: FontWeight.w600,)
                        ),),
               ),
      
      
               sizedBoxH30,
      
      
              ////////////////////////////////////
              
              
              
              
              Stack(
                children: [
                   SizedBox(
                    
                     height: 300.w,
                              width:double.infinity,
                     child: Container(
                      color:cred,
                      child: Image.asset('assets/images/intitute.png',fit:BoxFit.cover,))),


                  FeatureTile(iconImageUrl: "boy.png",topMargin: 290.0, title:" Dujo is designed for coaching center \n""and finishing schools",),

                  FeatureTile(topMargin: 405.0, iconImageUrl: "teacher.jpg", title: "Add Teacher Add classes Create and publish \n"
                      "notice Create and share events info"),

                      FeatureTile(topMargin: 520, iconImageUrl: "live.png", title: "Live doubt clearing"),
                    
                      FeatureTile(topMargin: 635, iconImageUrl: "live.png", title: "Live mock tests"),
      
                      FeatureTile(topMargin: 750, iconImageUrl: "record.png", title: "Hybrid courses"),
      
                      FeatureTile(topMargin: 865, iconImageUrl: "record.png", title: "Recorded courses"),
      
                      FeatureTile(topMargin: 980, iconImageUrl: "live.png", title: "Live courses"),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w,top: 10.w),
                        child: Text(
                          "Its in you, Awake\n"
                              " And chase your dream",style:
                        TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 25.h,
                            color: cWhite),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 320.w,top: 45.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Institution",style:
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 22.h,
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
                        margin: EdgeInsets.only(left: 240.w,top: 98.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/dujo_logo.png",
                              height: 40.w,
                              width: 70.w,),
                            Text(
                              "",style:
                            TextStyle(
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
               const SizedBox(height: 5,),
               GestureDetector(
                onTap: () {
                  showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
              
                title: GoogleMonstserratWidgets(text: 'Login in desktop to laptop',fontsize: 16.h,fontWeight: FontWeight.w600),
                content: Container(
                  child: GoogleMonstserratWidgets(text:'To get better Experience ',fontsize: 14.h,fontWeight: FontWeight.w600)),
                actions: <Widget>[
                  TextButton(
                    child: GoogleMonstserratWidgets(text: 'Close',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                    borderRadius: BorderRadius.all(
                    Radius.circular(8.w))),
                          height: 50.h,
                          width: 260.h,
                         
                        child: Center(child: 
                        GoogleMonstserratWidgets(
                          text: 'Register Institution',fontsize: 18.h,
                          color: cWhite,fontWeight: FontWeight.w600,)
                        ),),
               ),
      
      
               sizedBoxH30,
      
      
              ////////////////////////////////////////////
             
             
              Stack(
                children: [
                  SizedBox(
                     height: 300.w,
                              width:double.infinity,
                      child: Image.asset("assets/images/professional.png",fit:  BoxFit.cover)),


                  FeatureTile(iconImageUrl: "professional.png",topMargin: 290.0, title: "Any educationals profitionals can register their\n"" profile DuJo profitonails",),

                  FeatureTile(topMargin: 405, iconImageUrl: "teacher.jpg", title: "Add Teacher Add classes Create and publish \n"
                      "notice Create and share events info"),

                      FeatureTile(topMargin: 520, iconImageUrl: "professional.png", title: "Professionals can invites their students to \n"
                      "join the app"),

      
                    FeatureTile(topMargin:635, iconImageUrl: "live.png", title: "Live doubt clearing"),
                    
                      FeatureTile(topMargin: 750, iconImageUrl: "mock_test.png", title: "Live mock tests"),
      
                      FeatureTile(topMargin: 865, iconImageUrl: "record.png", title: "Hybrid courses"),
      
                      FeatureTile(topMargin: 980, iconImageUrl: "record.png", title: "Recorded courses"),
      
                      FeatureTile(topMargin: 1095, iconImageUrl: "live.png", title: "Live courses"),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w,top: 110.w),
                        child: Text(
                          "Logon, feed your mind\n"
                              "Change the world",style:
                        TextStyle(
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
                        margin: EdgeInsets.only(left: 280.w,top: 64.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Professionals",style:
                            TextStyle(
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
                        margin: EdgeInsets.only(left: 235.w,top: 28.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/dujo_logo.png",
                              height: 40.w,
                              width: 70.w,),
                            Text(
                              "",style:
                            TextStyle(
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
              
                title: GoogleMonstserratWidgets(text: 'Login in desktop to laptop',fontsize: 16.h,fontWeight: FontWeight.w600),
                content: Container(
                  child: GoogleMonstserratWidgets(text:'To get better Experience ',fontsize: 14.h,fontWeight: FontWeight.w600)),
                actions: <Widget>[
                  TextButton(
                    child: GoogleMonstserratWidgets(text: 'Close',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                    borderRadius: BorderRadius.all(
                    Radius.circular(8.w))),
                          height: 50.h,
                          width: 260.h,
                         
                        child: Center(child: 
                        GoogleMonstserratWidgets(
                          text: 'Register Professional',fontsize: 18.h,
                          color: cWhite,fontWeight: FontWeight.w600,)
                        ),),
               ),
      
      
               sizedBoxH30,
      
      
           //   sizedBoxH20,
              const Divider(color: cBlack,),
              sizedBoxH20,
            //  FooterMob()
            ],
          ),
        )
      :


      //////////////////////////////////////// web  
      ///
      ///
      ///
      ///



      ListView(children: [
          Padding(
            padding: EdgeInsets.only(right: 80.0.w, left: 80.w),
            child: SizedBox(
              //
              height: 60.w,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // fgkjsdl;fjal;dfjs
                    //color: cBlue,
                    width: 400.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '+91 8891436651',
                              style: GoogleFonts.poppins(
                                  color: 
                                 adminePrimayColor,
                                  //Color(0xFF17BDB5),
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.mail),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'leptondujo@gmail.com',
                              style: GoogleFonts.poppins(
                              // adminePrimayColor,
                                 color:adminePrimayColor,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),

                  Padding(
                    padding: EdgeInsets.only(left: 220.w),
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
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
                                      if (schoolListValue['docid'] == null) {
                                        return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Alert'),
                                              content: SingleChildScrollView(
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
                                                    Navigator.of(context).pop();
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
                    padding:  EdgeInsets.only(left: 40.w),
                    child: Container(
                    //  width: MediaQuery.of(context).size.width / 4,
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
                              color:adminePrimayColor,
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
                              color:adminePrimayColor,
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
                              color:adminePrimayColor,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              _launchyouTubeUrl() ;
                            },
                            child: Image.asset(
                              'assets/images/utube.png',
                              height: 28.h,
                              width: 28.w,
                              color:adminePrimayColor,
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
            padding: EdgeInsets.only(
              right: 80.0.w,
              left: 80.w,
            ),
            child: Container(
               //color: cBlue,
              width: MediaQuery.of(context).size.width,
              height: 500.h,
              color: const Color(0xFF17BDB5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                    //  / mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180.w,
                          child: Image.asset(
                            'assets/images/leptdujo.png',
                            // color: Color(0xFF17BDB5).withOpacity(0.5),
                            width: 170.w,
                            height: 170.h,
                          ),
                        ),
                        // sizedBoxH40,
                        // sizedBoxH40,
                        // sizedBoxH20,
                        Padding(
                          padding: EdgeInsets.only(top: 120.h),
                          child: Text(
                            'Watch And Guide,\nLet Them Study',
                            style: GoogleFonts.montserrat(
                              fontSize: 50.w,
                              fontWeight: FontWeight.bold,
                              color:adminePrimayColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          //padding: EdgeInsets.all(20),
                          height: 60.h,
                          minWidth: 250.w,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SchoolProfile();
                              },
                            ));
                          },
                          color:adminePrimayColor,
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
          const SizedBox(
            height: 100,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text(
          //       'Dujo Schools',
          //       style: GoogleFonts.poppins(
          //           fontSize: 20.w,
          //           fontWeight: FontWeight.w500,
          //           color: Colors.white.withOpacity(0.7)),
          //     ),
          //     Text(
          //       'Dujo Colleges',
          //       style: GoogleFonts.poppins(
          //           fontSize: 20.w,
          //           fontWeight: FontWeight.w500,
          //           color: Colors.white.withOpacity(0.7)),
          //     ),
          //     Text('Dujo Institution',
          //         style: GoogleFonts.poppins(
          //             fontSize: 20.w,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.white.withOpacity(0.7))),

          //             Text('Dujo Professionals',
          //         style: GoogleFonts.poppins(
          //             fontSize: 20.w,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.white.withOpacity(0.7))),
          //   ],
          // ),
          GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: List.generate(4, (index) {
                return Padding(
                  padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                  child: Center(
                      child: SizedBox(
                    height: 600.w,
                    width: 850.w,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => pages[index])));
                      },
                      child: Card(
                          color: Colors.white.withOpacity(0.5),
                          elevation: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                assetsimages[index],fit: BoxFit.cover,
                                width: 550,
                                height: 280,
                              ),
                              // LottieBuilder.network(
                              //   lottieFiles[index],
                              //   width: 220,
                              //   height: 220,
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                containerNames[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:adminePrimayColor,
                                ),
                              )                      
                                                                                ],
                          )),
                    ),
                  )),
                );
              })),
             const SizedBox(height: 100,),
          FooterHomeP()
        ]),
);
}
}