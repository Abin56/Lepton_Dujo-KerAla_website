import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SubmissionTable extends StatefulWidget {
  /// Creates the home page.
  const SubmissionTable({Key? key}) : super(key: key);

  @override
  SubmissionTableState createState() => SubmissionTableState();
}

class SubmissionTableState extends State<SubmissionTable> {
  List<Studentsubmission> studentssubmission = <Studentsubmission>[];
  late StudentsubmissionDataSource studentsubmissionDataSource;
  

  @override
  void initState() {
    super.initState();
   studentssubmission = getStudentsubmissionData();
   studentsubmissionDataSource = StudentsubmissionDataSource(studentsubmissionData: studentssubmission);
  }

  @override
  Widget build(BuildContext context) {
    return
     SfDataGrid(
        source: studentsubmissionDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[ 
          GridColumn(
              columnName: 'no',
              label: Container(
                color: Colors.green[200],
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'NO.',
                  ))),
          GridColumn(
              columnName: 'homeworks',
              label: Container(
                color: Colors.green[200],
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('HOMEWORKS'))),
          GridColumn(
              columnName: 'subject',
              label: Container(
                color: Colors.green[200],
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'SUBJECTS',
                    // overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'status',
              label: Container(
                color: Colors.green[200],
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('STATUS'))),
        ],
      
    );
  }

  List<Studentsubmission> getStudentsubmissionData() {
    return [
      Studentsubmission(01, 'Writing', 'Malayalam', 'Checked'),
     Studentsubmission(02, 'Reading', 'English', 'Pending'),
      Studentsubmission(03, 'Assignment', 'Social', 'Checked'),
      Studentsubmission(04, 'Learning', 'Maths', 'Checked'),
      Studentsubmission(05, 'Complete Notes', 'Science', 'Pending'),
      Studentsubmission(06, 'Rewriting', 'GK', 'Pending'),
     Studentsubmission(07, 'Study', 'Chemistry', 'Checked'),
      Studentsubmission(08, 'Peom Writing', 'Hindi', 'Pending'),
      // Employee(10009, 'Gable', 'Developer', 15000),
      // Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Studentsubmission {
  /// Creates the employee class with required details.
  Studentsubmission(this.no, this.homeworks, this.subjects, this.status);

  /// Id of an employee.
  final int no;

  /// Name of an employee.
  final String homeworks;

  /// Designation of an employee.
  final String subjects;

  /// Salary of an employee.
  final String status;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class StudentsubmissionDataSource extends DataGridSource {
   int rowIndex = 0;
  /// Creates the employee data source class with required details.
  StudentsubmissionDataSource({required List<Studentsubmission> studentsubmissionData}) {
    
    _studentsubmissionData = studentsubmissionData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.no),
              DataGridCell<String>(columnName: 'name', value: e.homeworks,),
              DataGridCell<String>(
                  columnName: 'designation', value: e.subjects),
              DataGridCell<String>(columnName: 'status', value: e.status),
            ]))
        .toList();
  }

  List<DataGridRow> _studentsubmissionData = [];

  @override
  List<DataGridRow> get rows => _studentsubmissionData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
     final isEvenRow = rowIndex.isEven;
       rowIndex++;
    return DataGridRowAdapter(
      color: isEvenRow ?Colors.white : Colors.green[100] ,
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}