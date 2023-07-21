import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/add_attendance_controller/add_attendance_controller.dart';
import '../../../../../constant/constant.dart';
import 'show_student_class_wise_data.dart';

class AddAttendnceHomePage extends StatelessWidget {
  AddAttendnceHomePage({super.key});

  final AddAttendanceController _addAttendanceController =
      Get.put(AddAttendanceController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                //select class
                DropdownSearch<Map<String, dynamic>>(
                  asyncItems: (String filter) =>
                      _addAttendanceController.fetchAllClass(),
                  itemAsString: (Map<String, dynamic> u) => u["className"],
                  onChanged: (Map<String, dynamic>? data) =>
                      _addAttendanceController.selectClassData = data ?? {},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Class",
                        border: OutlineInputBorder()),
                  ),
                ),
                sizedBoxH20,

                //select month
                DropdownSearch<Map<String, dynamic>>(
                  asyncItems: (String filter) =>
                      _addAttendanceController.fetchAllMonths(),
                  itemAsString: (Map<String, dynamic> u) => u["id"],
                  onChanged: (Map<String, dynamic>? data) =>
                      _addAttendanceController.selectMonthId =
                          data?["id"] ?? "",
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Month",
                        border: OutlineInputBorder()),
                  ),
                ),
                sizedBoxH20,

                //select date
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Select Date"),
                  readOnly: true,
                  controller: _addAttendanceController.dateTextController,
                  onTap: () async {
                    await _addAttendanceController.callDatePicker(
                        context: context);
                    await _addAttendanceController.fetchAllStudentsData();
                  },
                ),
                sizedBoxH20,
                //select month
                DropdownSearch<int>(
                  items: _addAttendanceController.periodLists,
                  itemAsString: (int u) => u.toString(),
                  onChanged: (int? data) {
                    if (data != null) {
                      _addAttendanceController.selectedPeriod = data;
                    }
                  },
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Period",
                        border: OutlineInputBorder()),
                  ),
                ),
                sizedBoxH20,
                //select month
                DropdownSearch<Map<String, dynamic>>(
                  asyncItems: (String filter) =>
                      _addAttendanceController.fetchAllSubjects(),
                  itemAsString: (Map<String, dynamic> u) => u["subjectName"],
                  onChanged: (Map<String, dynamic>? data) =>
                      _addAttendanceController.selectedSubject = data ?? {},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Subject",
                        border: OutlineInputBorder()),
                  ),
                ),

                sizedBoxH20,
                ButtonBar(
                    alignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: size.width / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_addAttendanceController
                                      .dateTextController.text.isEmpty ||
                                  _addAttendanceController
                                      .selectClassData.isEmpty ||
                                  _addAttendanceController
                                      .selectMonthId.isEmpty ||
                                  _addAttendanceController.selectedPeriod ==
                                      0 ||
                                  _addAttendanceController
                                      .selectedSubject.isEmpty) {
                                return showToast(
                                    msg: "All field are mandatory");
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ShowStudentsClassWiseAttendanceDataPage(),
                                  ),
                                );
                              }
                            },
                            child: const Text("Submit")),
                      ),
                    ])

                //student listview
              ],
            ),
          ),
        ),
      ),
    );
  }
}
