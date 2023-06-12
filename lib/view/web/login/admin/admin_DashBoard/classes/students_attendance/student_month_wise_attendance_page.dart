import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/attendance_controller/month_wise_attendance_controller.dart';
import '../../../../../../constant/constant.dart';

class StudentMonthWiseAttendancePage extends StatelessWidget {
  StudentMonthWiseAttendancePage({super.key});
  final MonthWiseAttendanceController monthWiseAttendanceController =
      Get.put(MonthWiseAttendanceController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //clearing all data before back button press
        monthWiseAttendanceController.monthWiseSubjectId.value = "";
        monthWiseAttendanceController.monthWiseMonthId.value = "";
        monthWiseAttendanceController.studentNames.value = [];
        monthWiseAttendanceController.monthWiseAllAttendanceData = [];
        monthWiseAttendanceController.subjectIds.value = [];

        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Monthly Attendance Report"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              MonthSelectDropDownSearchWidgetMonthly(
                label: "Select Month",
              ),
              sizedBoxH10,
              //select month dropdown
              SubjectSelectDropDownSearchWidget(label: "Select Subject"),
              sizedBoxH10,
              //show all students subject wise data
              MonthWiseAttendanceWidget(),
              sizedBoxH10,
            ],
          ),
        ),
      ),
    );
  }
}

class MonthSelectDropDownSearchWidgetMonthly extends StatelessWidget {
  MonthSelectDropDownSearchWidgetMonthly({
    super.key,
    required this.label,
  });
  final String label;
  final MonthWiseAttendanceController monthAttendanceController =
      Get.put(MonthWiseAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => monthAttendanceController.isLoadinggetMonth.value
        ? circularProgressIndicator
        : DropdownSearch<String>(
            asyncItems: (String filter) =>
                monthAttendanceController.getAllAttendanceMonths(),
            popupProps: const PopupProps.bottomSheet(),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
            itemAsString: (String? u) => u ?? "",
            selectedItem:
                monthAttendanceController.monthWiseMonthId.value.isEmpty
                    ? label
                    : monthAttendanceController.monthWiseMonthId.value,
            onChanged: (String? data) async {
              monthAttendanceController.monthWiseMonthId.value = data ?? "";
              await monthAttendanceController
                  .fetchPercentageWiseData()
                  .then((value) {
                monthAttendanceController.fetchAllSubjectIds(
                    monthAttendanceController.monthWiseAllAttendanceData);
                monthAttendanceController.createStudentsNameList();
              });
            }));
  }
}

class SubjectSelectDropDownSearchWidget extends StatelessWidget {
  SubjectSelectDropDownSearchWidget({
    super.key,
    required this.label,
  });
  final String label;
  final MonthWiseAttendanceController monthAttendanceController =
      Get.put(MonthWiseAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => monthAttendanceController.isLoadinggetMonth.value ||
            monthAttendanceController.isLoadingfetchallList.value
        ? circularProgressIndicator
        : DropdownSearch<StudentSubjectModelAllData>(
            items: monthAttendanceController.fetchAllSubjectIds(
                monthAttendanceController.monthWiseAllAttendanceData),
            popupProps: const PopupProps.bottomSheet(),
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: label, border: const OutlineInputBorder())),
            itemAsString: (StudentSubjectModelAllData u) => u.subject,
            onChanged: (StudentSubjectModelAllData? data) {
              monthAttendanceController.monthWiseSubjectId.value = data!.docid;
            }));
  }
}

class MonthWiseAttendanceWidget extends StatelessWidget {
  MonthWiseAttendanceWidget({
    super.key,
  });

  final MonthWiseAttendanceController monthAttendanceController =
      Get.put(MonthWiseAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Obx(() {
              if (monthAttendanceController.monthWiseSubjectId.value.isEmpty) {
                return const SizedBox();
              }
              return monthAttendanceController.isLoadinggetStudentName.value
                  ? circularProgressIndicator
                  : DataTable(
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text('Student Name')),
                        DataColumn(label: Text('Present Days')),
                        DataColumn(label: Text('Absent Days')),
                        DataColumn(label: Text('Total Days')),
                        DataColumn(label: Text('Percentage')),
                      ],
                      rows: List.generate(
                          monthAttendanceController.studentNames.length,
                          (index) {
                        final Map<String, num> student =
                            monthAttendanceController
                                .calculateMonthlyAttendance(
                                    monthAttendanceController
                                        .monthWiseAllAttendanceData,
                                    monthAttendanceController
                                        .monthWiseSubjectId.value,
                                    monthAttendanceController
                                        .studentNames[index]);
                        final color = index % 2 == 0
                            ? Colors.white
                            : Colors.grey.withOpacity(0.3);

                        return DataRow(
                          onSelectChanged: (value) {},
                          color:
                              MaterialStateColor.resolveWith((states) => color),
                          cells: [
                            DataCell(Text(
                              monthAttendanceController.studentNames[index],
                            )),
                            DataCell(Text(
                              student["present"].toString(),
                              style: const TextStyle(color: Colors.green),
                            )),
                            DataCell(Text(student["absent"].toString(),
                                style: const TextStyle(color: Colors.red))),
                            DataCell(Text(student["total"].toString())),
                            DataCell(
                                Text("${student["percentage"].toString()}%")),
                          ],
                        );
                      }),
                    );
            }),
          ),
        ),
      ),
    );
  }
}




     

    