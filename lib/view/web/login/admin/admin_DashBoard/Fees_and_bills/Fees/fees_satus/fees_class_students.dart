import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_status_controller.dart';
import 'fees_class_status.dart';

class FeesClassStudents extends StatelessWidget {
  FeesClassStudents(
      {super.key, required this.classId, required this.feesCategory});
  final String classId;
  final String feesCategory;

  final FeesStatusController feesStatusController =
      Get.put(FeesStatusController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return (Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width / 2,
            child: FeesStatusContainerWidget(
              screenSize: screenSize,
              text: 'Students list',
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: feesStatusController.getAllStudentsFromClass(classId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            "${index + 1}",
                            textAlign: TextAlign.center,
                          ),
                          title: Text(snapshot.data?[index].studentName ?? ""),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: FutureBuilder(
                                    future: paidOrNot(feesCategory, classId,
                                        snapshot.data?[index].docid ?? ""),
                                    builder: (context, psnapshot) {
                                      if (psnapshot.hasData) {
                                        return Text(psnapshot.data ?? "");
                                      } else {
                                        return sizedBoxH10;
                                      }
                                    }),
                              ),
                              sizedBoxw20,
                              Flexible(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
                  } else {
                    return sizedBoxH10;
                  }
                }),
          ),
        ],
      ),
    ));
  }

  Future<String> paidOrNot(
      String feesCategoryId, String classId1, String studentId) async {
    final data = await feesStatusController.getFeesCategoryData(
        feesCategoryId, classId1);

    final listOfStudent =
        data?.studentList.map((e) => e.studentId).toList() ?? [];

    if (listOfStudent.contains(studentId)) {
      return "Paid";
    } else {
      return "Not Paid";
    }
  }
}

class FeeContainerButtonWidget extends StatelessWidget {
  const FeeContainerButtonWidget({
    this.color,
    required this.text,
    super.key,
  });
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(2.w))),
      child: Center(
          child: GoogleMonstserratWidgets(
              text: text, fontsize: 14.w, color: cWhite)),
    );
  }
}
