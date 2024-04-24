import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class HomeWorkTable extends StatefulWidget {
  /// Creates the home page.
  const HomeWorkTable({Key? key}) : super(key: key);

  @override
  HomeWorkTableState createState() => HomeWorkTableState();
}

class HomeWorkTableState extends State<HomeWorkTable> {
  List<Student> students = <Student>[];
  late StudentDataSource studentDataSource;
  

  @override
  void initState() {
    super.initState();
   students = getStudentData();
   studentDataSource = StudentDataSource(studentData: students);
  }

  @override
  Widget build(BuildContext context) {
    return
     SfDataGrid(
        source: studentDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[ 
          GridColumn(
              columnName: 'no',
              label: Container(
                color: Colors.blue[100],
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'NO.',
                  ))),
          GridColumn(
              columnName: 'homeworks',
              label: Container(
                color: Colors.blue[100],
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('HOMEWORKS'))),
          GridColumn(
              columnName: 'subject',
              label: Container(
                color: Colors.blue[100],
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'SUBJECTS',
                   // overflow: TextOverflow.clip,
                  ))),
          GridColumn(
              columnName: 'time',
              label: Container(
                color: Colors.blue[100],
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('TIME'))),
        ],
      
    );
  }

  List<Student> getStudentData() {
    return [
      Student(01, 'Writing', 'Malayalam', 2),
     Student(02, 'Reading', 'English', 30),
      Student(03, 'Assignment', 'Social', 15),
      Student(04, 'Learning', 'Maths', 15),
      Student(05, 'Complete Notes', 'Science', 1),
      Student(06, 'Rewriting', 'GK', 10),
     Student(07, 'Study', 'Chemistry', 15),
      Student(08, 'Peom Writing', 'Hindi', 5),
      // Employee(10009, 'Gable', 'Developer', 15000),
      // Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Student {
  /// Creates the employee class with required details.
  Student(this.no, this.homeworks, this.subjects, this.time);

  /// Id of an employee.
  final int no;

  /// Name of an employee.
  final String homeworks;

  /// Designation of an employee.
  final String subjects;

  /// Salary of an employee.
  final int time;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class StudentDataSource extends DataGridSource {
   int rowIndex = 0;
  /// Creates the employee data source class with required details.
  StudentDataSource({required List<Student> studentData}) {
    
    _studentData = studentData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.no),
              DataGridCell<String>(columnName: 'name', value: e.homeworks,),
              DataGridCell<String>(
                  columnName: 'designation', value: e.subjects),
              DataGridCell<int>(columnName: 'salary', value: e.time),
            ]))
        .toList();
  }

  List<DataGridRow> _studentData = [];

  @override
  List<DataGridRow> get rows => _studentData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
     final isEvenRow = rowIndex.isEven;
       rowIndex++;
    return DataGridRowAdapter(
      color: isEvenRow ?Colors.white : Colors.blue[50] ,
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}