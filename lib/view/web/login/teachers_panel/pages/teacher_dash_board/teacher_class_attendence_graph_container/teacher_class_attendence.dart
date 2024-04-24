import 'package:flutter/material.dart';

import 'teacher_class_attendence_graph.dart';

class TeacherClassAttendence extends StatelessWidget {
  const TeacherClassAttendence({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(10, 0, 0, 0),
          offset: Offset(
            0.5,
            0.5,
          ),
          blurRadius: 1.0,
          spreadRadius: 1.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ], borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
              "Class Attendence",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: const TeacherClassAttendenceGraph()),
          ),
        ],
      ),
    );
  }
}
