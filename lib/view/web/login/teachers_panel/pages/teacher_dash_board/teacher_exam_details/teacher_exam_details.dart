
import 'package:flutter/material.dart';

import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'teacher_class_exam_details_graph.dart';

class TeacherExamDetails extends StatelessWidget {
  const TeacherExamDetails({super.key});

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
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Exam Details",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 242, 245),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      color: Colors.blue,
                      iconSize: 20,
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // ...
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
                height: 200,
                width:
                    ResponsiveWebSite.isTablet(context) ? double.infinity : 500,
                color: Colors.white,
                child: const TeacherClassExamDetailsGraph()),
          ),
        ],
      ),
    );
  }
}
