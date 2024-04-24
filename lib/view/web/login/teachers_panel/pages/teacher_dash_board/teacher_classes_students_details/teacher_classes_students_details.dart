import 'package:flutter/material.dart';

class TeacherClassesStudentsDetails extends StatelessWidget {
  final String categorytext;
  final String currentcount;
  final String totalcount;
  final String imagepath;

  const TeacherClassesStudentsDetails(
      {required this.categorytext,
      required this.currentcount,
      required this.totalcount,
      required this.imagepath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 290,
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
      ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 08, top: 0),
                child: Text(
                  categorytext,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 05, right: 20),
                child: Row(
                  children: [
                    Text(
                      "$currentcount/",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      totalcount,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 244, 255),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(imagepath),
          )
        ],
      ),
    );
  }
}
