import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/hostel/hostel_complaint/hostel_complaint_controller.dart';
import '../../../../../utils/utils.dart';
import '../../../../constant/responsive_app.dart';
import 'hostel_complaint_dialogue.dart';

class ComplaintListViewBuilder extends StatelessWidget {
  ComplaintListViewBuilder({
    super.key,
  });
  final HostelComplaintController _hostelComplaintController =
      Get.put(HostelComplaintController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _hostelComplaintController.fetchAllComplaints(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(25),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const ListTile(
                      leading: ComplaintTextWidget(
                        value: "Date",
                        fontWeight: FontWeight.bold,
                      ),
                      title: Center(
                          child: ComplaintTextWidget(
                        value: "Title",
                        fontWeight: FontWeight.bold,
                      )),
                      trailing: ComplaintTextWidget(
                        value: "Student Name",
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return ListTile(
                    leading: ComplaintTextWidget(
                        value: timeStampToDateFormat(
                            snapshot.data?[index].date ?? 0)),
                    title: Center(
                        child: ComplaintTextWidget(
                            value: snapshot.data?[index].title ?? "")),
                    trailing: FutureBuilder(
                        future: getStudentData(
                            classId: snapshot.data?[index].classId ?? "",
                            studentId: snapshot.data?[index].studentId ?? ""),
                        builder: (context, snapshotData) {
                          if (snapshotData.hasData) {
                            return ComplaintTextWidget(
                              value: snapshotData.data?.studentName ?? "",
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
                      hostelComplaintDialogue(context);
                    },
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
        });
  }
}

class ComplaintTextWidget extends StatelessWidget {
  const ComplaintTextWidget({super.key, required this.value, this.fontWeight});
  final String value;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveApp.width * .1,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
