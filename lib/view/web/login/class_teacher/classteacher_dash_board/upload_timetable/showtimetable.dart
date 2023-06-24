import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class ShowTimeTable extends StatefulWidget {
  ShowTimeTable({super.key, required this.mon, required this.tues, required this.wed, required this.thurs, required this.fri});

  DocumentSnapshot<Map<String, dynamic>> mon;
  DocumentSnapshot<Map<String, dynamic>> tues; 
  DocumentSnapshot<Map<String, dynamic>> wed; 
  DocumentSnapshot<Map<String, dynamic>> thurs; 
  DocumentSnapshot<Map<String, dynamic>> fri;

  @override
  State<ShowTimeTable> createState() => _ShowTimeTableState();
}

class _ShowTimeTableState extends State<ShowTimeTable> {
  List<String> periodList = [
    'firstPeriod',
    'secondPeriod',
    'thirdPeriod',
    'fourthPeriod',
    'fifthPeriod',
    'sixthPeriod',
    'seventhPeriod'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(backgroundColor: adminePrimayColor),
        body: Center(
          child: ListView.separated( 
            shrinkWrap: true, 
            physics: const ScrollPhysics(),
              separatorBuilder: (context, index) {
                return sizedBoxH10;
              },
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          width: 100, 
                          height: 100,
                          color: Colors.orange,
                          child: Center(
                            child: Text(widget.mon.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ), 
                      Flexible(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.orange,
                          child: Center(
                            child: Text(widget.tues.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 100, 
                          height: 100,
                          color: Colors.orange,
                          child: Center(
                            child: Text(widget.wed.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 100, 
                          height: 100,
                          color: Colors.orange,
                          child: Center(
                            child: Text(widget.thurs.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.orange,
                          child: Center(
                            child: Text(widget.fri.data()![(index == 3)
                                ? 'fouthPeriod'
                                
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
