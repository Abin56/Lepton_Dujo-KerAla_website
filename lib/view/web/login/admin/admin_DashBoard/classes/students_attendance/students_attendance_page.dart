import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/attendance_controller/attendance_controller.dart';
import '../../../../../../../model/attendance_date_model/attendance_date_model.dart';
import '../../../../../../../model/attendance_subject_model/attendance_subject_model.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Report")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            //select subject dropdown
            MonthSelectDropDownSearchWidget(label: "Select Day"),
            const SizedBox(
              height: 5,
            ),
            //select month dropdown
            // MonthSelectDropDownSearchWidget(label: "Select Day"),
            // const SizedBox(
            //   height: 5,
            // ),
            //select month dropdown
            SubjectSelectDropDownSearchWidget(label: "Select Subject"),
            const SizedBox(
              height: 5,
            ),

            //show all students subject wise data
            Obx(
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
                            child: FutureBuilder(
                                future: attendanceController
                                    .getAllSubjectWiseAttendance(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return DataTable(
                                      showCheckboxColumn: false,
                                      columns: const [
                                        DataColumn(label: Text('Id')),
                                        DataColumn(label: Text('Student Name')),
                                        DataColumn(label: Text('Present')),
                                        //DataColumn(label: Text('Absent')),
                                        //DataColumn(label: Text('Attendance%')),
                                      ],
                                      rows: List.generate(snapshot.data!.length,
                                          (index) {
                                        final student = snapshot.data![index];
                                        final color = index % 2 == 0
                                            ? Colors.white
                                            : Colors.grey.withOpacity(0.3);

                                        return DataRow(
                                          onSelectChanged: (value) {},
                                          color: MaterialStateColor.resolveWith(
                                              (states) => color),
                                          cells: [
                                            DataCell(Text(student.uid)),
                                            DataCell(Text(student.studentName)),
                                            DataCell(Text(student.present
                                                ? "Present"
                                                : "Absent")),
                                            //DataCell(Text(student.absent.toString())),
                                            //DataCell(Text(student.attendancePercentage
                                            //    .toStringAsFixed(2))),
                                          ],
                                        );
                                      }),
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive());
                                  }
                                }),
                          ),
                        ),
                      ),
                    ),
            )
          ],
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
    return DropdownSearch<AttendanceDateModel>(
      asyncItems: (String filter) =>
          attendanceController.getAllAttendanceDateWise(),
      popupProps: const PopupProps.bottomSheet(),
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              labelText: label, border: const OutlineInputBorder())),
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
