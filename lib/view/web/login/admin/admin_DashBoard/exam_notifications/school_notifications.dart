import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/exam_notifications/exam_timetable.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../../../constant/constant.dart';

class SchoolLevelNotifications extends StatefulWidget {
  SchoolLevelNotifications({super.key, required this.schoolID});

  String schoolID;

  @override
  State<SchoolLevelNotifications> createState() =>
      _SchoolLevelNotificationsState();
}

final formKey = GlobalKey<FormState>();

class _SchoolLevelNotificationsState extends State<SchoolLevelNotifications> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController chaptersToCover = TextEditingController();

  String radioButton = "";
  String? gender;
  addExamNotifications() {
    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('SchoolLevelExamNotifications')
        .doc()
        .set({
      'examName': name.text,
      'examDate': date.text,
      'examDescription': description.text,
      'syllabusToCover': chaptersToCover.text
    });
  }

  final int _stackIndex = 1;

  String _singleValue = "Text alignment right";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: adminePrimayColor,
        // appBar: AppBar(
        //   title: Text(
        //     'Exam Notifications',
        //     style: GoogleFonts.poppins(),
        //   ),
        //   backgroundColor: adminePrimayColor,
        // ),
        body: Column(
      children: [
        HeadingContainer(screenSize: screenSize),
        Container(
          color: cWhite,
          child: Row(
            children: [
              Container(
                height: screenSize.height * 0.85,
                width: screenSize.width / 2,
                color: adminePrimayColor,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 300.h, left: 200.w),
                      child: SizedBox(
                        height: 100.h,
                        width: 500.w,
                        child: ListTile(
                          leading: const Icon(Icons.add),
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: ((context) {
                                  return Center(
                                    child: AlertDialog(
                                      title: const Text(
                                          'Add New Exam Notification'),
                                      content: SizedBox(
                                        width: 400.w,
                                        height: 600.h,
                                        child: Form(
                                          key: formKey,
                                          child: ListView(
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Exam",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  const Divider(),
                                                  RadioButton(
                                                    description: "Text ",
                                                    value:
                                                        "Text alignment right",
                                                    groupValue: _singleValue,
                                                    onChanged: (value) =>
                                                        setState(
                                                      () => _singleValue =
                                                          value ?? '',
                                                    ),
                                                    activeColor: Colors.red,
                                                    textStyle: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  RadioButton(
                                                    description: "Text",
                                                    value:
                                                        "Text alignment left",
                                                    groupValue: _singleValue,
                                                    fillColor: Colors.amber,
                                                    onChanged: (value) =>
                                                        setState(
                                                      () => _singleValue =
                                                          value ?? '',
                                                    ),
                                                    textPosition:
                                                        RadioButtonTextPosition
                                                            .left,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                validator: checkFieldEmpty,
                                                controller: name,
                                                decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(),
                                                    labelText:
                                                        'Name of Examination',
                                                    labelStyle:
                                                        GoogleFonts.poppins()),
                                                style: GoogleFonts.poppins(),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                  validator: checkFieldEmpty,
                                                  controller: date,
                                                  decoration: InputDecoration(
                                                      border:
                                                          const OutlineInputBorder(),
                                                      labelText:
                                                          'Date of Commencement of Exam',
                                                      labelStyle: GoogleFonts
                                                          .poppins()),
                                                  style: GoogleFonts.poppins()),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                validator: checkFieldEmpty,
                                                controller: description,
                                                maxLines: 10,
                                                decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(),
                                                    labelText: 'Description',
                                                    alignLabelWithHint:
                                                        true, // Align the label with the hint text
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 16.h,
                                                            left: 10.w),
                                                    labelStyle:
                                                        GoogleFonts.poppins()),
                                                style: GoogleFonts.poppins(),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                validator: checkFieldEmpty,
                                                controller: chaptersToCover,
                                                decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(),
                                                    labelText:
                                                        'Syllabus to cover',
                                                    labelStyle:
                                                        GoogleFonts.poppins()),
                                                style: GoogleFonts.poppins(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        MaterialButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(20.h),
                                          child: MaterialButton(
                                            color: Colors.green,
                                            onPressed: () async {
                                              bool? result = formKey
                                                  .currentState
                                                  ?.validate();
                                              if (name.text.isNotEmpty &&
                                                  date.text.isNotEmpty &&
                                                  description.text.isNotEmpty &&
                                                  chaptersToCover
                                                      .text.isNotEmpty) {
                                                addExamNotifications();
                                              } else {
                                                print(
                                                    'empty fields are not allowed!');
                                              }

                                              if (result == true) {
                                                // check if form validation passed
                                                showToast(
                                                    msg:
                                                        'Exam Notification successfully added ');
                                              }
                                              // clearFields();
                                            },
                                            child: Text(
                                              'Add',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }));
                          },
                          title: Text(
                            'Add new Notification',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20.h),
                          ),
                        ),
                      ),
                    ),

                    //),
                  ],
                ),
              ),
              Row(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 8.w, bottom: 10.h),
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width / 4.2,
                        color: Colors.white,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(widget.schoolID)
                                .collection('SchoolLevelExamNotifications')
                                .snapshots(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: Container(
                                      color: Colors.blueGrey,
                                      child: ListTile(
                                        leading:
                                            const Icon(Icons.notification_add),
                                        tileColor: Colors.white,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      ExamTimeTable())));

                                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => SchoolExamMainPage(sn: snapshot.data!.docs[index]))));
                                        },
                                        title: Text(
                                          snapshot.data!.docs[index]
                                              ['examName'],
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 17.h),
                                        ),
                                        subtitle: Text(
                                          'Date of examination: ' +
                                              snapshot.data!.docs[index]
                                                  ['examDate'],
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13.h),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            })),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 8.w, bottom: 10.h),
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width / 4.2,
                        color: cWhite,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(widget.schoolID)
                                .collection('SchoolLevelExamNotifications')
                                .snapshots(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.blueGrey,
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.notification_add),
                                      tileColor: Colors.white,
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: ((context) => SchoolExamMainPage(sn: snapshot.data!.docs[index]))));
                                      },
                                      title: Text(
                                        snapshot.data!.docs[index]['examName'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 17.h),
                                      ),
                                      subtitle: Text(
                                        'Date of examination: ' +
                                            snapshot.data!.docs[index]
                                                ['examDate'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 13.h),
                                      ),
                                    ),
                                  );
                                },
                              );
                            })),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: adminePrimayColor,
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: screenSize.width / 2,
              child: Row(
                children: [
                  IconButtonBackWidget(color: cWhite),
                  SizedBox(width: 250.w),
                  Text(
                    "Exam Notification",
                    style: TextStyle(fontSize: 20.h, color: cWhite),
                  )
                ],
              )),
          Container(
            color: cWhite,
            height: 60.h,
            width: screenSize.width / 4,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 18.h, bottom: 10.h),
              child: Text(
                "School level Exam",
                style: TextStyle(color: Colors.black, fontSize: 25.h),
              ),
            ),
          ),
          Container(
            color: cWhite,
            height: 60.h,
            width: screenSize.width / 4,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 18.h, bottom: 10.h),
              child: Text(
                "Public Exam",
                style: TextStyle(fontSize: 25.h),
              ),
            ),
          )
        ],
      ),
    );
  }
}
