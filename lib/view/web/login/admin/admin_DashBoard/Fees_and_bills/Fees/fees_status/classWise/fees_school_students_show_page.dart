import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_class_controller.dart';
import '../../fees_create/widgets/fees_left_side_widget.dart';

class FeesClassStudents extends StatelessWidget {
  FeesClassStudents({super.key});
  final FeesClassController _feesController = Get.put(FeesClassController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return (Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FeesHalfContainerWidget(
              screenSize: screenSize,
              text: 'Fees',
              callback: () async {
                Navigator.of(context).pop();
                _feesController.selectedFeesModel.value = null;
                _feesController.selectedClass = {};
              },
            ),
          ),
          Obx(
            () => Expanded(
              child: _feesController.isLoading.value
                  ? circularProgressIndicator
                  : FutureBuilder(
                      future: _feesController.fetcAllStudentsFromClass(
                        classId:
                            _feesController.selectedFeesModel.value?.classId ??
                                "",
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return ListView.separated(
                            itemCount: snapshot.data!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == snapshot.data!.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await _feesController.submit();
                                    },
                                    child: const Text("Submit"),
                                  ),
                                );
                              }
                              final bool isConatain = _feesController
                                      .selectedFeesModel.value?.studentList
                                      .contains(snapshot.data?[index].docid) ??
                                  false;
                              return ListTile(
                                leading: Text(
                                  "${index + 1}",
                                  textAlign: TextAlign.center,
                                ),
                                title: Text(
                                    snapshot.data?[index].studentName ?? ""),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                        child: Text(
                                            isConatain ? "Paid" : "Unpaid")),
                                    sizedBoxw20,
                                    Flexible(
                                      child: IconButton(
                                        onPressed: () async {
                                          if (!isConatain) {
                                            _feesController.selectedFeesModel
                                                .value?.studentList
                                                .add(snapshot
                                                        .data?[index].docid ??
                                                    "");
                                            _feesController.selectedFeesModel
                                                .refresh();
                                          } else {
                                            _feesController.selectedFeesModel
                                                .value?.studentList
                                                .remove(snapshot
                                                        .data?[index].docid ??
                                                    "");
                                            _feesController.selectedFeesModel
                                                .refresh();
                                          }
                                        },
                                        icon: isConatain
                                            ? const Icon(
                                                Icons.remove,
                                              )
                                            : const Icon(
                                                Icons.add,
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                          );
                        } else {
                          return sizedBoxH10;
                        }
                      }),
            ),
          )
        ],
      ),
    ));
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
