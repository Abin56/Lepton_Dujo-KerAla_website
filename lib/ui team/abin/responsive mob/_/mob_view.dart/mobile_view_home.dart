// ignore_for_file: prefer_const_constructors

import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/mob_view.dart/feature_tile.dart';
import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/mob_view.dart/mob_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../view/constant/constant.dart';




class MobHomePage extends StatelessWidget {
  const MobHomePage({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {


    String imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";







    /////////////////////////
    
 
 
    String description = "Any schools from Kerala can register on\n"
    "LEPTON DuJo. LEPTON Dujo is a mobile \n"
    "application with student login,parent, \n"
    "teacher login";
    return  Scaffold(
      backgroundColor: Color(0xFF17BDB5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
      
                  Container(
                    color: Color(0xFF17BDB5),
                    width: double.infinity,
                    height: 70.h,
                    child: Row(
                      children: [
                        SizedBox(width: 15.h,),
                        Icon(Icons.menu),
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
                      child: Image.network(imageUrl)),

                  FeatureTile(iconImageUrl: "boy.png", title: description, topMargin: 290.0,),

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
              
                title: GoogleMonstserratWidgets(text: 'Use Your Web ',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                          "Keep Going,\n"
                              "Let them study!",style:
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
              
                title: GoogleMonstserratWidgets(text: 'Use Your Web ',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                     child: Image.asset('assets/images/intitute.png',fit:  BoxFit.cover,)),


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
                          "Watch and Guide,\n"
                              "Let them study!",style:
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
               SizedBox(height: 5,),
               GestureDetector(
                onTap: () {
                  showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
              
                title: GoogleMonstserratWidgets(text: 'Use Your Web ',fontsize: 16.h,fontWeight: FontWeight.w600),
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
                          "Watch and Guide,\n"
                              "Let them study!",style:
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
              
                title: GoogleMonstserratWidgets(text: 'Use Your Web ',fontsize: 16.h,fontWeight: FontWeight.w600),
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
              Divider(color: cBlack,),
              sizedBoxH20,
              FooterMob()
            ],
          ),
        ),
      ),

);
}
}