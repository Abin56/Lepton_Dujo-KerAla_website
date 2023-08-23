import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/add_attendance_controller/add_attendance_controller.dart';

class ShowStudentsClassWiseAttendanceDataPage extends StatelessWidget {
  ShowStudentsClassWiseAttendanceDataPage({super.key});
  final AddAttendanceController _addAttendanceController =
      Get.put(AddAttendanceController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: adminePrimayColor,
        title: const Text("Students List"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Obx(
          () => _addAttendanceController.isLoading.value
              ? circularProgressIndicator
              : ListView(
                  shrinkWrap: true,
                  children: [
                    FutureBuilder(
                        future: _addAttendanceController.fetchAllStudentsData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => ListTile(
                                    title: Text(
                                        snapshot.data?[index].studentName ??
                                            " "),
                                    trailing: TextButton(
                                      onPressed: () {
                                        bool isContains =
                                            _addAttendanceController
                                                .studentsListToAdd
                                                .contains(snapshot
                                                        .data?[index].docid ??
                                                    " ");
                                        if (isContains) {
                                          _addAttendanceController
                                              .studentsListToAdd
                                              .remove(
                                                  snapshot.data?[index].docid ??
                                                      " ");
                                        } else {
                                          _addAttendanceController
                                              .studentsListToAdd
                                              .add(
                                                  snapshot.data?[index].docid ??
                                                      " ");
                                        }
                                      },
                                      child: _addAttendanceController
                                              .studentsListToAdd
                                              .contains(
                                                  snapshot.data?[index].docid ??
                                                      " ")
                                          ? const Text("Present")
                                          : const Text("Absent"),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: Text("No data found"),
                            );
                          }
                        }),
                    ButtonBar(
                        alignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: size.width / 3,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await _addAttendanceController
                                      .submitFunction();
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text("Submit")),
                          ),
                        ])
                  ],
                ),
        ),
      ),
    );
  }
}
