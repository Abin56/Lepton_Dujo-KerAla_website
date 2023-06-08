import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/attendance_controller/attendance_controller.dart';
import '../../../../../../../model/attendance_date_model/attendance_date_model.dart';
import '../../../../../../../model/attendance_subject_model/attendance_subject_model.dart';
import '../../../../../../constant/constant.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Report")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MonthSelectDropDownSearchWidget(
              label: "Select Month",
            ),
            sizedBoxH10,
            //select subject dropdown
            DaySelectDropDownSearchWidget(label: "Select Day"),
            sizedBoxH10,

            //select month dropdown
            SubjectSelectDropDownSearchWidget(label: "Select Subject"),
            sizedBoxH10,

            //show all students subject wise data
            MonthWiseAttendanceWidget()
          ],
        ),
      ),
    );
  }
}

class DateWiseAttendanceWidget extends StatelessWidget {
  DateWiseAttendanceWidget({
    super.key,
  });

  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => attendanceController.subjectId.value.isEmpty
          ? const SizedBox()
          : Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: StreamBuilder(
                        stream:
                            attendanceController.getAllSubjectWiseAttendance(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DataTable(
                              showCheckboxColumn: false,
                              columns: const [
                                DataColumn(label: Text('Student Name')),
                                DataColumn(label: Text('Present/Absent')),
                                DataColumn(label: Text('Edit')),
                              ],
                              rows:
                                  List.generate(snapshot.data!.length, (index) {
                                final student = snapshot.data![index];
                                final color = index % 2 == 0
                                    ? Colors.white
                                    : Colors.grey.withOpacity(0.3);

                                return DataRow(
                                  onSelectChanged: (value) {},
                                  color: MaterialStateColor.resolveWith(
                                      (states) => color),
                                  cells: [
                                    DataCell(Text(student.studentName)),
                                    DataCell(Text(
                                      student.present ? "Present" : "Absent",
                                      style: TextStyle(
                                          color: student.present
                                              ? Colors.green
                                              : Colors.red),
                                    )),
                                    DataCell(IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    const Text('Confirmation'),
                                                content: student.present
                                                    ? const Text(
                                                        'Are you sure you want to change Absent?')
                                                    : const Text(
                                                        'Are you sure you want to change Present?'),
                                                actions: [
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Obx(
                                                      () => attendanceController
                                                              .isLoading.value
                                                          ? circularProgressIndicator
                                                          : const Text(
                                                              'Confirm'),
                                                    ),
                                                    onPressed: () {
                                                      attendanceController
                                                          .updateStudentAttendance(
                                                              student
                                                                  .studentName,
                                                              student.present
                                                                  ? false
                                                                  : true);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.edit))),
                                    //DataCell(Text(student.attendancePercentage
                                    //    .toStringAsFixed(2))),
                                  ],
                                );
                              }),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                        }),
                  ),
                ),
              ),
            ),
    );
  }
}

class MonthWiseAttendanceWidget extends StatelessWidget {
  MonthWiseAttendanceWidget({
    super.key,
  });

  final AttendanceController attendanceController =
      Get.put(AttendanceController());

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
            child: StreamBuilder(
                stream: attendanceController.getAllSubjectWiseAttendance(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DataTable(
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text('Student Name')),
                        DataColumn(label: Text('Present Days')),
                        DataColumn(label: Text('Absent Days')),
                        DataColumn(label: Text('Total')),
                        DataColumn(label: Text('Percentage')),
                      ],
                      rows: List.generate(snapshot.data!.length, (index) {
                        final student = snapshot.data![index];
                        final color = index % 2 == 0
                            ? Colors.white
                            : Colors.grey.withOpacity(0.3);

                        return DataRow(
                          onSelectChanged: (value) {},
                          color:
                              MaterialStateColor.resolveWith((states) => color),
                          cells: const [
                            DataCell(Text("")),
                            DataCell(Text("")),
                            DataCell(Text("")),
                            DataCell(Text("")),
                            DataCell(Text("")),
                          ],
                        );
                      }),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                }),
          ),
        ),
      ),
    );
  }
}

class MonthSelectDropDownSearchWidget extends StatelessWidget {
  MonthSelectDropDownSearchWidget({
    super.key,
    required this.label,
  });
  final String label;
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      asyncItems: (String filter) =>
          attendanceController.getAllAttendanceMonthWise(),
      popupProps: const PopupProps.bottomSheet(),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
      itemAsString: (String? u) => u ?? "",
      onChanged: (String? data) =>
          attendanceController.monthId.value = data ?? "",
    );
  }
}

class DaySelectDropDownSearchWidget extends StatelessWidget {
  DaySelectDropDownSearchWidget({
    super.key,
    required this.label,
  });
  final String label;
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<AttendanceDateModel>(
      asyncItems: (String filter) =>
          attendanceController.getAllAttendanceDateWise(),
      popupProps: const PopupProps.bottomSheet(),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
      itemAsString: (AttendanceDateModel u) => u.dDate,
      onChanged: (AttendanceDateModel? data) =>
          attendanceController.dateId.value = data!.docid,
    );
  }
}

class SubjectSelectDropDownSearchWidget extends StatelessWidget {
  SubjectSelectDropDownSearchWidget({
    super.key,
    required this.label,
  });
  final String label;
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<AttendanceSubjectModel>(
        asyncItems: (String filter) => attendanceController.getAllSubject(),
        popupProps: const PopupProps.bottomSheet(),
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                labelText: label, border: const OutlineInputBorder())),
        itemAsString: (AttendanceSubjectModel u) => u.subject,
        onChanged: (AttendanceSubjectModel? data) {
          attendanceController.subjectId.value = data!.docid;
          attendanceController.getAllSubjectWiseAttendance();
        });
  }
}
