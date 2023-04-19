import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/ui%20team/manage_teachers.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/upload_timetable/select_class.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../model/create_classModel/create_classModel.dart';
import '../../../../../ui team/manage_teacher_create.dart';
import '../../../../colors/colors.dart';
import '../../../../fonts/fonts.dart';
import '../../../home/dujo_home.dart';
import '../../admin/admin_DashBoard/classes/list_of_classes.dart';
import '../add_student/add_student.dart';
import '../parents-section/add_parent.dart';
import 'events_screen/create_events_screen.dart';
import 'events_screen/update_event_screens/list_classwise_event.dart';
import 'guardian-section/add_guardian.dart';
import 'manage_teachers/all_class_teachers.dart';
import 'notice_screen/class_notices.dart';
import 'notice_screen/create_notice_screen.dart';

class ClassTeacherAdmin extends StatefulWidget {
  const ClassTeacherAdmin({
    super.key,
    required this.schoolID,
    required this.teacherID,
    required this.teacherEmail,
  });

  //String id;
  final String schoolID;
  final String teacherID;
  final String teacherEmail;

  @override
  State<ClassTeacherAdmin> createState() => _NewAdminMainPanelState();
}

class _NewAdminMainPanelState extends State<ClassTeacherAdmin> {
  TextEditingController subjectController = TextEditingController();
  String teacherClassId = '';
  List<String> dashboardNamesList = [
    'Add Subject', //1
    'Add Student', //2
    'Add Parent', //3
    'Manage Teachers', //4
    'Add Guardian', //5
    'Chat with Parents', //6
    'Upload Time Table', //7
    'Upload Progress Report', //8
    'Upload Events', //9
    'Upload Notice', //10
    'Live Clasees', //11
    'Recorded Classes' //12
  ];

  List<String> dashboardImagesList = [
    'assets/images/exam.png', //1
    'assets/images/students.png', //2
    'assets/images/admin.png', //3
    'assets/images/teacherr.png', //4
    'assets/images/women.png', //5
    'assets/images/meetings.png', //6
    'assets/images/information.png', //7
    'assets/images/report.png', //8
    'assets/images/events.png', //9
    'assets/images/notices.png', //10
    'assets/images/video-conference.png', //11
    'assets/images/elearning.png', //12
  ];

  List<String> viewListNames = [
    'Events', //1
    'Notice', //2
    'Students List' //3
  ];
  List<String> viewListImages = [
    'assets/images/events.png', //1
    'assets/images/notices.png', //2
    'assets/images/students.png', //3
  ];

  @override
  void initState() {
    getTeacherDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SubmitSubjectClassTeacher(
          schoolID: widget.schoolID,
          subjecController: subjectController,
          teacherClassId: teacherClassId), //1
      AddStudentFromClassTeacher(
        schoolID: widget.schoolID,
        teacherIDE: widget.teacherEmail,
      ), //2
      AddParent(schoolID: widget.schoolID), //3
      // AllClassesListViewForTeacher(
      //   schoolID: widget.schoolID,
      //   classID: teacherClassId,
      //   teacherID: '',
      // ),
      ManageTeachers(), //4
      AddGuardian(schoolId: widget.schoolID), //5
      AddGuardian(schoolId: widget.schoolID), //6
      SelectClassForTimeTable(schoolID: widget.schoolID), //7
      AddGuardian(schoolId: widget.schoolID), //8
      ClassTeacherCreateEventsPage(
        schoolId: widget.schoolID,
        classId: teacherClassId,
      ), //9
      ClassTeacherCreateNoticePage(
        schoolId: widget.schoolID,
        classId: teacherClassId,
      ), //10/10
    ];
    List<Widget> drawerPages = [
      ClassEventsPageList(
        classId: teacherClassId,
        schoolId: widget.schoolID,
      ), //1
      ClassNoticeTeacher(
        schoolId: widget.schoolID,
        classId: teacherClassId,
      ), //2
      ListOfClassesScreen(schoolID: widget.schoolID),
    ];
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Container(
              width: screenSize.width / 6,
              color: Colors.black,
              child: Column(
                children: [
                  const FittedBox(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Teacher Admin Panel',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: cWhite),
                    ),
                  )),
                  // sizedBoxH30,
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: viewListNames.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  viewListImages[index],
                                  width: 15,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return drawerPages[index];
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    viewListNames[index],
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              )),
          Container(
            color: Colors.white54,
            width: screenSize.width * 5 / 6,
            child: Column(children: [
              Container(
                color: Colors.white30,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Teacher Dashboard',
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            'Teacher',
                            style: GoogleFonts.poppins(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/icons8-teachers-64.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.logout_outlined)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height - 60,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0, left: 50),
                  child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      children:
                          List.generate(dashboardNamesList.length, (index) {
                        return Center(
                            child: SizedBox(
                          height: 200,
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => pages[index])));
                            },
                            child: Card(
                                elevation: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      dashboardImagesList[index],
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      dashboardNamesList[index],
                                      style: GoogleFonts.poppins(),
                                    )
                                  ],
                                )),
                          ),
                        ));
                      })),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void getTeacherDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Teachers")
        .doc(widget.teacherEmail)
        .get();
    setState(() {
      teacherClassId = vari.data()!['classIncharge'];
    });
    log(vari.toString());
  }

  submitSubject(
      BuildContext context, TextEditingController subjecController) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Subject'),
          content: SingleChildScrollView(
            child: TextField(
                controller: subjecController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Name of Subject',

                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    )),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                )),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('add'),
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("SchoolListCollection")
                    .doc(widget.schoolID)
                    .collection("Classes")
                    .doc(teacherClassId)
                    .collection("Subjects")
                    .doc(subjecController.text.trim().toString())
                    .set({
                  'subject': subjecController.text.trim().toString(),
                  'id': subjecController.text.trim().toString()
                }).then((value) => showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Successfully created'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ));
              },
            ),
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class SubmitSubjectClassTeacher extends StatelessWidget {
  const SubmitSubjectClassTeacher({
    super.key,
    required this.subjecController,
    required this.schoolID,
    required this.teacherClassId,
  });
  final TextEditingController subjecController;
  final String schoolID;
  final String teacherClassId;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          child: Row(children: [
            Container(
              color: Color.fromARGB(255, 12, 34, 133),
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi Admin ',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width / 20,
                  ),
                  Text(
                    'Welcome',
                    style: GoogleFonts.aclonica(
                      fontSize: 25.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width / 3.5,
                    width: screenSize.width / 1,
                    child: LottieBuilder.network(
                        "https://assets6.lottiefiles.com/packages/lf20_KWUxUaGUE7.json"),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: screenSize.width / 8),
                child: Container(
                    height: screenSize.height * 1 / 1,
                    width: screenSize.width * 1 / 3,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Container(
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 500,
                        // ),
                        child: Container(
                          width: screenSize.width / 6,
                          //height: screenSize.width/30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: screenSize.width / 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border()),
                                child: TextField(
                                    controller: subjecController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        hintText: 'Name of Subject',
                                        prefixIcon: Icon(Icons.subject_rounded,
                                            color: Color.fromARGB(
                                                255, 14, 11, 168)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          borderSide: BorderSide(),
                                        )),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18,
                                    )),
                              ),
                              SizedBox(
                                height: screenSize.width / 30,
                              ),
                              Container(
                                width: screenSize.width / 8,
                                height: screenSize.width / 30,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: containerColor[8]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  child: const Text('Add',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  onPressed: () async {
                                    FirebaseFirestore.instance
                                        .collection("SchoolListCollection")
                                        .doc(schoolID)
                                        .collection("Classes")
                                        .doc(teacherClassId)
                                        .collection("Subjects")
                                        .doc(subjecController.text
                                            .trim()
                                            .toString())
                                        .set({
                                      'subject': subjecController.text
                                          .trim()
                                          .toString(),
                                      'id': subjecController.text
                                          .trim()
                                          .toString()
                                    }).then((value) => showDialog(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Message'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: const <Widget>[
                                                        Text(
                                                            'Successfully created'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('ok'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: screenSize.width / 38,
                              ),
                              Container(
                                width: screenSize.width / 8,
                                height: screenSize.width / 30,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: containerColor[8]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]))))
          ]),
        ),
      ])),

      // Container(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 500,
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //           controller: subjecController,
      //           decoration: InputDecoration(
      //               filled: true,
      //               fillColor: const Color.fromARGB(255, 255, 255, 255),
      //               hintText: 'Name of Subject',

      //               // prefixIcon: Icon(Icons.email),
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(19),
      //                 borderSide: BorderSide.none,
      //               )),
      //           style: const TextStyle(
      //             color: Color.fromARGB(255, 0, 0, 0),
      //             fontSize: 18,
      //           )),
      //       TextButton(
      //         child: const Text('add'),
      //         onPressed: () async {
      //           FirebaseFirestore.instance
      //               .collection("SchoolListCollection")
      //               .doc(schoolID)
      //               .collection("Classes")
      //               .doc(teacherClassId)
      //               .collection("Subjects")
      //               .doc(subjecController.text.trim().toString())
      //               .set({
      //             'subject': subjecController.text.trim().toString(),
      //             'id': subjecController.text.trim().toString()
      //           }).then((value) => showDialog(
      //                     context: context,
      //                     barrierDismissible: false, // user must tap button!
      //                     builder: (BuildContext context) {
      //                       return AlertDialog(
      //                         title: const Text('Message'),
      //                         content: SingleChildScrollView(
      //                           child: ListBody(
      //                             children: const <Widget>[
      //                               Text('Successfully created'),
      //                             ],
      //                           ),
      //                         ),
      //                         actions: <Widget>[
      //                           TextButton(
      //                             child: const Text('ok'),
      //                             onPressed: () {
      //                               Navigator.of(context).pop();
      //                             },
      //                           ),
      //                         ],
      //                       );
      //                     },
      //                   ));
      //         },
      //       ),
      //       TextButton(
      //         child: const Text('cancel'),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
