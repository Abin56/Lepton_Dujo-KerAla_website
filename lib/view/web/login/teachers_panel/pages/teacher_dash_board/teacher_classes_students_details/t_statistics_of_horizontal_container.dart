import 'package:flutter/material.dart';

import 'teacher_classes_students_details.dart';



class TStatisticsOfHorizontalContainer extends StatelessWidget {
  const TStatisticsOfHorizontalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 10,
        ),
        TeacherClassesStudentsDetails(
          categorytext: 'Total Classes',
          currentcount: "04",
          totalcount: "06",
          imagepath: "assets/png/roll-call.png",
        ),
        SizedBox(
          width: 10,
        ),
        TeacherClassesStudentsDetails(
          categorytext: 'Total Students',
          currentcount: "40",
          totalcount: "60",
          imagepath: "assets/png/graduating-student.png",
        ),
        SizedBox(
          width: 10,
        ),
        TeacherClassesStudentsDetails(
          categorytext: 'Total Lessons',
          currentcount: "30",
          totalcount: "50",
          imagepath: "assets/png/exam_studenttest.png",
        ),
        SizedBox(
          width: 10,
        ),
        TeacherClassesStudentsDetails(
          categorytext: 'Total Hours',
          currentcount: "15",
          totalcount: "20",
          imagepath: "assets/images/work.png",
        ),
      ],
    );
  }
}
