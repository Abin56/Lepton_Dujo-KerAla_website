import 'package:flutter/material.dart';

class ExamTimeTable extends StatefulWidget {
  ExamTimeTable({super.key});
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  State<ExamTimeTable> createState() => _ExamTimeTableState();
}

class _ExamTimeTableState extends State<ExamTimeTable> {
  @override
  Widget build(BuildContext context) {
    List listTilesClassName = [
      "SUBJECTS",
      "LKG",
      "UKG",
      "STD 1",
      "STD 2",
      "STD 3",
      "STD 4",
      "STD 5",
      "STD 6",
      "STD 7",
      "STD 8",
      "STD 9",
      "STD 10",
      "STD 11",
      "STD 12"
    ];
    List listTilesSubjects = [
      "Subject1",
      "Subject2",
      "Subject3",
      "Subject4",
      "Subject5",
      "Subject6",
      "Subject7",
      "Subject8",
      "Subject9",
      "Subject10",
      "Subject11",
      "Subject12",
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listTilesClassName.length,
              itemBuilder: (context, index) {
                if (index == listTilesClassName.length - 1) {
                  return Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(listTilesClassName[index]),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(listTilesClassName[index]),
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                height: 600,
                width: 100,
                child: ListView.builder(
                  itemCount: listTilesSubjects.length,
                  itemBuilder: (context, index) {
                    if (index == listTilesSubjects.length - 1) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        color: Colors.red,
                        child: Center(
                          child: Text(listTilesSubjects[index]),
                        ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text(listTilesSubjects[index]),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
