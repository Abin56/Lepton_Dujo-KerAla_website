
import 'package:dujo_kerala_website/view/web/login/teachers_panel/pages/teacher_dash_board/teaching_activity/teachers_activity_graph.dart';
import 'package:flutter/material.dart';

class TeachingActivity extends StatelessWidget {
  const TeachingActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Progress Bar",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
                width: 150,
                height: 150,
                color: Colors.white,
                child: const TeacherActivityGraph()),
          ),
          const Text(
            "mcxn cm c ncmnmbjknnbkjvjhvkjb",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // foreground
                ),
                onPressed: () {},
                child: const Text('View Details'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
