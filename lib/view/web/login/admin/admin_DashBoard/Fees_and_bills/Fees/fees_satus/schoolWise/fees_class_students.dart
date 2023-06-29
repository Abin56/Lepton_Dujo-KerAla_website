import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_status_controller.dart';
import '../../../../../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../../../../../model/fees_bills_model/fees_model.dart';
import '../../../../../../../../../utils/utils.dart';

class FeesClassStudents extends StatefulWidget {
  const FeesClassStudents({super.key});

  @override
  State<FeesClassStudents> createState() => _FeesClassStudentsState();
}

class _FeesClassStudentsState extends State<FeesClassStudents> {
  final FeesStatusController feesStatusController =
      Get.put(FeesStatusController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return (Scaffold(
      body: Row(
        children: [
          // SizedBox(
          //   width: screenSize.width / 2,
          //   child: FeesStatusContainerWidget(
          //     screenSize: screenSize,
          //     text: 'Students list',
          //   ),
          // ),
          Expanded(
            child: FutureBuilder(
                future: feesStatusController.getAllStudentsFromClass(
                    feesStatusController.selectedClass),
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
                          trailing: FutureBuilder<bool>(
                              future: paidOrNot(
                                  feesStatusController.selectedMainCategory,
                                  feesStatusController.selectedClass,
                                  snapshot.data?[index].docid ?? "",
                                  feesStatusController.selectedSubCategory),
                              builder: (context, psnapshot) {
                                if (psnapshot.hasData) {
                                  String paidOrNotPaidValue =
                                      psnapshot.data ?? false
                                          ? "Paid"
                                          : "Not Paid";
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(child: Text(paidOrNotPaidValue)),
                                      sizedBoxw20,
                                      Flexible(
                                        child: IconButton(
                                          onPressed: () async {
                                            String content = psnapshot.data ??
                                                    false
                                                ? "Would you like to change it to 'Not Paid'?"
                                                : "Would you like to change it to 'Paid'?";
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MyAlertDialog(
                                                  content: content,
                                                  okButton: () async =>
                                                      await addOrRemove(
                                                              index: index,
                                                              psnapshot:
                                                                  psnapshot,
                                                              snapshota:
                                                                  snapshot)
                                                          .then(
                                                    (value) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      setState(() {});
                                                      showToast(
                                                          msg:
                                                              "Updated Successfully");
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return sizedBoxH10;
                                }
                              }),
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

  Future<bool> paidOrNot(String feesCategoryId, String classId1,
      String studentId, String subCategoryId) async {
    final FeesModel? data = await feesStatusController.getFeesCategoryData(
      feesCategoryId: feesCategoryId,
      classId: classId1,
      subCategoryId: subCategoryId,
    );

    final listOfStudent =
        data?.studentList.map((e) => e.studentId).toList() ?? [];

    if (listOfStudent.contains(studentId)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addOrRemove({
    required AsyncSnapshot<bool> psnapshot,
    required AsyncSnapshot<List<AddStudentModel>> snapshota,
    required int index,
  }) async {
    psnapshot.data ?? false
        ? await feesStatusController.removeStudentToFeePaid(
            categoryId: feesStatusController.selectedMainCategory,
            classId: feesStatusController.selectedClass,
            studentId: snapshota.data?[index].docid ?? "",
            subCategoryId: feesStatusController.selectedSubCategory)
        : await feesStatusController.addStudentToFeePaid(
            categoryId: feesStatusController.selectedMainCategory,
            classId: feesStatusController.selectedClass,
            studentId: snapshota.data?[index].docid ?? "",
            subCategoryId: feesStatusController.selectedSubCategory,
          );
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
