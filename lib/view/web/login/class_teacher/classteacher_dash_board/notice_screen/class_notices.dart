import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import '../../../../../../controller/Getx/class_teacher/teacher_notice_controller.dart/teacher_notice_controller.dart';
import '../../../../../../model/class_teacher/class_teacher_notice_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import 'create_notice_screen.dart';
import 'update_notice_screen/show_classwise_notice.dart';

final TeacherNoticeController teacherNoticeController =
    Get.put(TeacherNoticeController());

class ClassNoticeTeacher extends StatelessWidget {
  const ClassNoticeTeacher(
      {super.key, required this.schoolId, required this.classId});
  final String schoolId;
  final String classId;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF1a2980),
          Color(0xFF26d0ce),
        ],
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ClassTeacherCreateNoticePage(
                        classId: classId,
                        schoolId: schoolId,
                      );
                    }));
                  },
                  child: const Text('Create'))),
          body: SafeArea(
            child: Row(
              children: [
                Obx(() {
                  return teacherNoticeController
                              .classTeacherNoticeModelData.value ==
                          null
                      ? SizedBox(
                          width: screenSize.width * 0.4,
                          height: screenSize.width,
                          child: Lottie.network(
                            'https://assets6.lottiefiles.com/packages/lf20_7p6kyzmg.json',
                            fit: BoxFit.fill,
                          ),
                        )
                      : teacherNoticeController.isLoading.value
                          ? SizedBox(
                              width: screenSize.width * 0.4,
                              height: screenSize.height,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              width: screenSize.width * 0.4,
                              height: screenSize.height,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    DataTableWidget(
                                      heading: teacherNoticeController
                                          .classTeacherNoticeModelData
                                          .value!
                                          .heading,
                                      content: teacherNoticeController
                                          .classTeacherNoticeModelData
                                          .value!
                                          .content,
                                      signedBy: teacherNoticeController
                                          .classTeacherNoticeModelData
                                          .value!
                                          .signedBy,
                                      topic: teacherNoticeController
                                          .classTeacherNoticeModelData
                                          .value!
                                          .topic,
                                    ),
                                    sizedBoxH20,
                                    if (teacherNoticeController
                                            .classTeacherNoticeModelData
                                            .value ==
                                        null)
                                      const SizedBox()
                                    else
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            child:
                                                NoticePageElevatedButtonWidget(
                                                    title: 'Edit',
                                                    function: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: ClassTeacherNoticeShow(
                                                                schoolId:
                                                                    schoolId,
                                                                classTeacherNoticeModel:
                                                                    teacherNoticeController
                                                                        .classTeacherNoticeModelData
                                                                        .value!,
                                                                classId:
                                                                    classId),
                                                          );
                                                        },
                                                      );
                                                    }),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child:
                                                NoticePageElevatedButtonWidget(
                                              title: 'Remove',
                                              function: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Confirm Remove'),
                                                      content: const Text(
                                                          'Are you sure you want to remove this Notice'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            teacherNoticeController.deleteNotice(
                                                                schoolId:
                                                                    schoolId,
                                                                classId:
                                                                    classId,
                                                                documentId:
                                                                    teacherNoticeController
                                                                        .classTeacherNoticeModelData
                                                                        .value!
                                                                        .noticeId,
                                                                context:
                                                                    context);
                                                          },
                                                          child: const Text(
                                                              'Remove'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            );
                }),
                Container(
                  // color: const Color(0xFFE1F8DC),
                  width: screenSize.width * 0.6,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('SchoolListCollection')
                        .doc(schoolId)
                        .collection('Classes')
                        .doc(classId)
                        .collection('Notice')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            ClassTeacherNoticeModel data =
                                ClassTeacherNoticeModel.fromJson(
                                    snapshot.data!.docs[index].data());

                            return GestureDetector(
                              onTap: () {
                                teacherNoticeController
                                    .classTeacherNoticeModelData.value = data;
                              },
                              child: ClassTeacherNoticeCardWidget(
                                date: data.date,
                                heading: data.heading,
                                topic: data.topic,
                                signedBy: data.signedBy,
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No Data Found'));
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class NoticePageElevatedButtonWidget extends StatelessWidget {
  const NoticePageElevatedButtonWidget(
      {super.key, required this.title, required this.function});
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.3,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: ClassTeacherNoticeCard(
          title: title,
          color: cBlack,
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.heading,
    required this.content,
    required this.signedBy,
    required this.topic,
  });
  final String heading;
  final String content;
  final String signedBy;
  final String topic;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: <DataColumn>[
      const DataColumn(
        label: ClassTeacherNoticeCard(title: 'Heading', color: cWhite),
      ),
      DataColumn(
        label: ClassTeacherNoticeCard(title: heading, color: cWhite),
      ),
    ], rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Content', color: cWhite),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: content, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Topic', color: cWhite),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: topic, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Signed By', color: cWhite),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: signedBy, color: cWhite),
          ),
        ],
      ),
    ]);
  }
}

class ClassTeacherNoticeCardWidget extends StatelessWidget {
  const ClassTeacherNoticeCardWidget({
    super.key,
    required this.heading,
    required this.date,
    required this.topic,
    required this.signedBy,
  });
  final String heading;
  final String date;
  final String topic;
  final String signedBy;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: screenSize.width * .14,
        width: screenSize.width * .17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF77a1d3),
              Color(0xFF79cbca),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text(
                heading,
                style: GoogleFonts.sansita(color: cWhite),
              ),
              sizedBoxH10,
              Text(
                date,
                style: GoogleFonts.sansita(color: cWhite),
              ),
              sizedBoxH10,
              Text(
                topic,
                style: GoogleFonts.sansita(color: cWhite),
              ),
              sizedBoxH10,
              Text(
                signedBy,
                style: GoogleFonts.sansita(color: cWhite),
              ),
              sizedBoxH10,
            ],
          )),
        ),
      ),
    );
  }
}

class ClassTeacherNoticeCard extends StatelessWidget {
  const ClassTeacherNoticeCard(
      {super.key,
      required this.title,
      this.fontSize = 15,
      this.color = cBlack});
  final String title;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        title,
        style: GoogleFonts.sansita(
          fontSize: fontSize,
          color: color,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
