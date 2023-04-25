import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/events_screen/update_event_screens/show_classwise_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../controller/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';
import '../../../../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../create_events_screen.dart';

final TeacherEventController teacherEventController =
    Get.put(TeacherEventController());

class ClassEventsPageList extends StatelessWidget {
  const ClassEventsPageList(
      {super.key, required this.schoolId, required this.classId});
  final String schoolId;
  final String classId;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(backgroundColor: adminePrimayColor),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xFF314755),
              Color(0xFF26a0da),
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                title: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ClassTeacherCreateEventsPage(
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
                    return teacherEventController
                                .classTeacherEventModelData.value ==
                            null
                        ? SizedBox(
                            width: screenSize.width * 0.4,
                            height: screenSize.height,
                            child: Lottie.network(
                              'https://assets10.lottiefiles.com/packages/lf20_7p6kyzmg.json',
                              fit: BoxFit.contain,
                            ),
                          )
                        : teacherEventController.isLoading.value
                            ? SizedBox(
                                width: screenSize.width * 0.4,
                                height: screenSize.height,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  // color: const Color(0xFFE1F8DC),
                                ),
                                width: screenSize.width * 0.4,
                                height: screenSize.height,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      DataTableWidget(
                                        eventName: teacherEventController
                                            .classTeacherEventModelData
                                            .value!
                                            .eventName,
                                        eventsDate: teacherEventController
                                            .classTeacherEventModelData
                                            .value!
                                            .eventDate,
                                        description: teacherEventController
                                            .classTeacherEventModelData
                                            .value!
                                            .description,
                                        chiefGuest: teacherEventController
                                            .classTeacherEventModelData
                                            .value!
                                            .chiefGuest,
                                        participants: teacherEventController
                                            .classTeacherEventModelData
                                            .value!
                                            .participants,
                                        venue: teacherEventController
                                            .classTeacherEventModelData
                                            .value!
                                            .venue,
                                      ),
                                      if (teacherEventController
                                              .classTeacherEventModelData.value ==
                                          null)
                                        const SizedBox()
                                      else
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                              child:
                                                  NoticePageElevatedButtonWidget(
                                                      title: 'Edit',
                                                      function: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              content: ClassTeacherEventShow(
                                                                  schoolId:
                                                                      schoolId,
                                                                  classTeacherEventModel:
                                                                      teacherEventController
                                                                          .classTeacherEventModelData
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
                                                              teacherEventController.deleteEvent(
                                                                  schoolId:
                                                                      schoolId,
                                                                  classId:
                                                                      classId,
                                                                  documentId:
                                                                      teacherEventController
                                                                          .classTeacherEventModelData
                                                                          .value!
                                                                          .eventId,
                                                                  context:
                                                                      context,
                                                                  imageId: teacherEventController
                                                                      .classTeacherEventModelData
                                                                      .value!
                                                                      .imageUid);
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
                          .collection('Events')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              ClassTeacherEventModel data =
                                  ClassTeacherEventModel.fromJson(
                                      snapshot.data!.docs[index].data());
    
                              return GestureDetector(
                                onTap: () {
                                  teacherEventController
                                      .classTeacherEventModelData.value = data;
                                },
                                child: ClassTeacherEventsCardWidget(
                                  date: data.eventDate,
                                  heading: data.eventName,
                                  description: data.description,
                                  venue: data.venue,
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
      ),
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
      width: width * 0.1,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: cWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: cBlack,
          ),
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.eventName,
    required this.eventsDate,
    required this.description,
    required this.chiefGuest,
    required this.participants,
    required this.venue,
  });
  final String eventName;
  final String eventsDate;
  final String description;
  final String chiefGuest;
  final String participants;
  final String venue;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: <DataColumn>[
      const DataColumn(
        label: ClassTeacherNoticeCard(title: 'Event Name'),
      ),
      DataColumn(
        label: ClassTeacherNoticeCard(title: eventName),
      ),
    ], rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Description'),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: description),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Chief Guest'),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: chiefGuest),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Participants'),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: participants),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            ClassTeacherNoticeCard(title: 'Venue'),
          ),
          DataCell(
            ClassTeacherNoticeCard(title: venue),
          ),
        ],
      ),
    ]);
  }
}

class ClassTeacherEventsCardWidget extends StatelessWidget {
  const ClassTeacherEventsCardWidget({
    super.key,
    required this.heading,
    required this.date,
    required this.description,
    required this.venue,
  });
  final String heading;
  final String date;
  final String description;
  final String venue;

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
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFF373B44),
                Color(0xFF4286f4),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text(heading, style: GoogleFonts.sansita(color: cWhite)),
              sizedBoxH10,
              Text(date, style: GoogleFonts.sansita(color: cWhite)),
              sizedBoxH10,
              Text(description, style: GoogleFonts.sansita(color: cWhite)),
              sizedBoxH10,
              Text(venue, style: GoogleFonts.sansita(color: cWhite)),
              sizedBoxH10,
            ],
          )),
        ),
      ),
    );
  }
}

class ClassTeacherNoticeCard extends StatelessWidget {
  const ClassTeacherNoticeCard({
    super.key,
    required this.title,
    this.fontSize = 15,
  });
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        title,
        style: GoogleFonts.sansita(
          fontSize: fontSize,
          color: cWhite,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
