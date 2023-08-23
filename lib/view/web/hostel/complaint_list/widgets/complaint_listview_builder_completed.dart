import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/hostel/hostel_complaint/hostel_complaint_controller.dart';
import '../../../../../utils/utils.dart';
import '../../../../constant/constant.dart';
import 'complaint_text_widget.dart';
import 'hostel_complaint_dialogue.dart';

class ComplaintListViewBuilderCompleted extends StatelessWidget {
  ComplaintListViewBuilderCompleted({
    super.key,
  });
  final HostelComplaintController _hostelComplaintController =
      Get.put(HostelComplaintController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _hostelComplaintController.isloading.value
          ? circularProgressIndicator
          : FutureBuilder(
              future: _hostelComplaintController.fetchAllComplaintsCompleted(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(25),
                      itemCount:
                          snapshot.data == null ? 0 : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: ComplaintTextWidget(
                                value: timeStampToDateFormat(
                                    snapshot.data?[index].date ?? 0)),
                            title: Center(
                                child: ComplaintTextWidget(
                                    value: snapshot.data?[index].title ?? "")),
                            trailing: FutureBuilder(
                                future: getStudentData(
                                    classId:
                                        snapshot.data?[index].classId ?? "",
                                    studentId:
                                        snapshot.data?[index].studentId ?? ""),
                                builder: (context, snapshotData) {
                                  if (snapshotData.hasData) {
                                    return ComplaintTextWidget(
                                      value:
                                          snapshotData.data?.studentName ?? "",
                                      fontWeight: FontWeight.bold,
                                    );
                                  } else {
                                    return const ComplaintTextWidget(
                                      value: "",
                                      fontWeight: FontWeight.bold,
                                    );
                                  }
                                }),
                            onTap: () {
                              if (snapshot.data != null) {
                                hostelComplaintDialogue(
                                    complaint: snapshot.data![index],
                                    context: context);
                              }
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
    );
  }
}
