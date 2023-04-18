import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import '../../../../../../../../controller/Getx/admin/meeting_controller.dart';
import '../../../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../../../../../constant/constant.dart';
import '../admin_meeting_show.dart';

final AdminMeetingController adminMeetingController =
    Get.put(AdminMeetingController());

class MeetingDisplay extends StatelessWidget {
  const MeetingDisplay({super.key, required this.schoolId});
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xFFF7D8BA),
        body: SafeArea(
          child: Row(
            children: [
              Obx(() {
                return adminMeetingController.adminMeetingModelData.value ==
                        null
                    ? SizedBox(
                        width: screenSize.width * 0.4,
                        height: screenSize.height,
                        child: Lottie.network(
                          'https://assets5.lottiefiles.com/packages/lf20_twnj9fob.json',
                          fit: BoxFit.fill,
                        ),
                      )
                    : adminMeetingController.isLoading.value
                        ? SizedBox(
                            width: screenSize.width * 0.4,
                            height: screenSize.width,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            width: screenSize.width * 0.4,
                            height: screenSize.height,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  DataTableWidget(
                                    heading: adminMeetingController
                                        .adminMeetingModelData.value!.heading,
                                    categoryOfMeeting: adminMeetingController
                                        .adminMeetingModelData
                                        .value!
                                        .categoryOfMeeting,
                                    date: adminMeetingController
                                        .adminMeetingModelData.value!.date,
                                    membersToBeExpected: adminMeetingController
                                        .adminMeetingModelData
                                        .value!
                                        .membersToBeExpected,
                                    specialGuest: adminMeetingController
                                        .adminMeetingModelData
                                        .value!
                                        .specialGuest,
                                    time: adminMeetingController
                                        .adminMeetingModelData.value!.time,
                                    venue: adminMeetingController
                                        .adminMeetingModelData.value!.venue,
                                  ),
                                  sizedBoxH20,
                                  if (adminMeetingController
                                          .adminMeetingModelData.value ==
                                      null)
                                    const SizedBox()
                                  else
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: NoticePageElevatedButtonWidget(
                                              title: 'Edit',
                                              function: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      content: AdminMeetingShowPage(
                                                          schoolId: schoolId,
                                                          adminMeetingModel:
                                                              adminMeetingController
                                                                  .adminMeetingModelData
                                                                  .value!),
                                                    );
                                                  },
                                                );
                                              }),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: NoticePageElevatedButtonWidget(
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
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () async {
                                                          await adminMeetingController
                                                              .removeMeeting(
                                                                  schoolId:
                                                                      schoolId,
                                                                  meetingId: adminMeetingController
                                                                      .adminMeetingModelData
                                                                      .value!
                                                                      .meetingId,
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
              SizedBox(
                width: screenSize.width * 0.6,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(schoolId)
                      .collection('AdminMeeting')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          AdminMeetingModel data = AdminMeetingModel.fromJson(
                              snapshot.data!.docs[index].data());
                          return GestureDetector(
                            onTap: () => adminMeetingController
                                .adminMeetingModelData.value = data,
                            child: MeetingCardWidget(
                              date: data.date,
                              heading: data.heading,
                              time: data.time,
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
        ));
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
          backgroundColor: const Color(0xFFFEF8DD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: NoticeTextWidget(title: title),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.heading,
    required this.categoryOfMeeting,
    required this.date,
    required this.membersToBeExpected,
    required this.specialGuest,
    required this.time,
    required this.venue,
  });
  final String heading;
  final String categoryOfMeeting;
  final String date;
  final String membersToBeExpected;
  final String specialGuest;
  final String time;
  final String venue;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: <DataColumn>[
      const DataColumn(
        label: NoticeTextWidget(title: 'Heading'),
      ),
      DataColumn(
        label: NoticeTextWidget(title: heading),
      ),
    ], rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Category of Meeting'),
          ),
          DataCell(
            NoticeTextWidget(title: categoryOfMeeting),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Date'),
          ),
          DataCell(
            NoticeTextWidget(title: date),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Expected Members'),
          ),
          DataCell(
            NoticeTextWidget(title: membersToBeExpected),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Special Guest'),
          ),
          DataCell(
            NoticeTextWidget(title: specialGuest),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Time'),
          ),
          DataCell(
            NoticeTextWidget(title: time),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Venue'),
          ),
          DataCell(
            NoticeTextWidget(title: venue),
          ),
        ],
      ),
    ]);
  }
}

class MeetingCardWidget extends StatelessWidget {
  const MeetingCardWidget({
    super.key,
    required this.heading,
    required this.date,
    required this.time,
    required this.venue,
  });
  final String heading;
  final String date;
  final String time;
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
          color: const Color(0xFFFEF8DD),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NoticeTextWidget(title: heading, fontSize: 30),
                sizedBoxH10,
                NoticeTextWidget(title: date),
                sizedBoxH10,
                NoticeTextWidget(title: time),
                sizedBoxH10,
                NoticeTextWidget(title: venue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoticeTextWidget extends StatelessWidget {
  const NoticeTextWidget({
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
          color: Colors.black,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
