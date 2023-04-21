import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../controller/Getx/admin/notice_controller.dart';
import '../../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../admin_notice_update.dart/show_admin_notice.dart';

final AdminNoticeController adminNoticeController =
    Get.put(AdminNoticeController());

class NoticeDisplay extends StatelessWidget {
  NoticeDisplay({super.key, required this.schoolId});
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF4b6cb7),
          Color(0xFF182848),
        ],
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Row(
              children: [
                Obx(() {
                  return adminNoticeController.adminNoticeModelData.value ==
                          null
                      ? SizedBox(
                          width: screenSize.width * 0.4,
                          height: screenSize.width,
                          child: Lottie.network(
                            'https://assets6.lottiefiles.com/packages/lf20_K7aZUG.json',
                            fit: BoxFit.fill,
                          ),
                        )
                      : adminNoticeController.isLoading.value
                          ? SizedBox(
                              width: screenSize.width * 0.4,
                              height: screenSize.width,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                // color: const Color(0xFFE1F8DC),
                              ),
                              width: screenSize.width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    SizedBox(
                                      width: screenSize.width * 0.3,
                                      height: screenSize.width * .20,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            adminNoticeController
                                                .adminNoticeModelData
                                                .value!
                                                .imageUrl,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Center(
                                                child: Text(
                                                  'Image Not Found',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    DataTableWidget(
                                      heading: adminNoticeController
                                          .adminNoticeModelData.value!.heading,
                                      chiefGuest: adminNoticeController
                                          .adminNoticeModelData
                                          .value!
                                          .chiefGuest,
                                      dateOfSubmission: adminNoticeController
                                          .adminNoticeModelData
                                          .value!
                                          .dateOfSubmission,
                                      dateOfOccassion: adminNoticeController
                                          .adminNoticeModelData
                                          .value!
                                          .dateofoccation,
                                      publishedDate: adminNoticeController
                                          .adminNoticeModelData
                                          .value!
                                          .publishedDate,
                                      signedBy: adminNoticeController
                                          .adminNoticeModelData.value!.signedBy,
                                      venue: adminNoticeController
                                          .adminNoticeModelData.value!.venue,
                                    ),
                                    if (adminNoticeController
                                            .adminNoticeModelData.value ==
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
                                                            content: AdminNoticeShow(
                                                                schoolId:
                                                                    schoolId,
                                                                adminNoticeModel:
                                                                    adminNoticeController
                                                                        .adminNoticeModelData
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
                                                            await adminNoticeController.removeNotice(
                                                                schoolId:
                                                                    schoolId,
                                                                noticeId: adminNoticeController
                                                                    .adminNoticeModelData
                                                                    .value!
                                                                    .noticeId,
                                                                context:
                                                                    context,
                                                                noticeImageId:
                                                                    adminNoticeController
                                                                        .adminNoticeModelData
                                                                        .value!
                                                                        .imageId,
                                                                signImageId:
                                                                    adminNoticeController
                                                                        .adminNoticeModelData
                                                                        .value!
                                                                        .signedImageId);
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
                        .doc(Get.find<AdminLoginScreenController>().schoolID)
                        .collection(Get.find<GetFireBaseData>().bYear.value)
                        .doc(Get.find<GetFireBaseData>().bYear.value)
                        .collection('adminNotice')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            AdminNoticeModel data = AdminNoticeModel.fromJson(
                                snapshot.data!.docs[index].data());
                            return GestureDetector(
                              onTap: () {
                                adminNoticeController
                                    .adminNoticeModelData.value = data;
                              },
                              child: NoticeCardWidget(
                                date: data.dateofoccation,
                                heading: data.heading,
                                uploadedDate: data.publishedDate,
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
        child: NoticeTextWidget(title: title),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.heading,
    required this.chiefGuest,
    required this.dateOfSubmission,
    required this.dateOfOccassion,
    required this.publishedDate,
    required this.signedBy,
    required this.venue,
  });
  final String heading;
  final String chiefGuest;
  final String dateOfSubmission;
  final String dateOfOccassion;
  final String publishedDate;
  final String signedBy;
  final String venue;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: <DataColumn>[
      const DataColumn(
        label: NoticeTextWidget(title: 'Heading', color: cWhite),
      ),
      DataColumn(
        label: NoticeTextWidget(title: heading, color: cWhite),
      ),
    ], rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Chief Guest', color: cWhite),
          ),
          DataCell(
            NoticeTextWidget(title: chiefGuest, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Date Of Submission', color: cWhite),
          ),
          DataCell(
            NoticeTextWidget(title: dateOfSubmission, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Date Of Ocassion', color: cWhite),
          ),
          DataCell(
            NoticeTextWidget(title: dateOfOccassion, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Published Date', color: cWhite),
          ),
          DataCell(
            NoticeTextWidget(title: publishedDate, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Signed By', color: cWhite),
          ),
          DataCell(
            NoticeTextWidget(title: signedBy, color: cWhite),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Venue', color: cWhite),
          ),
          DataCell(
            NoticeTextWidget(title: venue, color: cWhite),
          ),
        ],
      ),
    ]);
  }
}

class NoticeCardWidget extends StatelessWidget {
  NoticeCardWidget({
    super.key,
    required this.heading,
    required this.date,
    required this.uploadedDate,
    required this.venue,
  });
  final String heading;
  final String date;
  final String uploadedDate;
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
            color: Colors.white),
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
                NoticeTextWidget(title: uploadedDate),
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
  const NoticeTextWidget(
      {super.key,
      required this.title,
      this.fontSize = 15,
      this.color = Colors.black});
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
