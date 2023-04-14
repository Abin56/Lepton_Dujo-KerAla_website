import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UploadTimetableScreen extends StatelessWidget {
   UploadTimetableScreen({super.key, required this.numberOfPeriodsinString}); 

  String numberOfPeriodsinString; 
  late int numberOfPeriod; 
  List<String>dayList = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;  
     numberOfPeriod =  int.parse(numberOfPeriodsinString);
     print(numberOfPeriod);
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Timetables'),
        ),
        body: Column(
          children: [
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Text('Monday'), 
                   SizedBox( 
                  width: 125,
                  child: TextField(
                      //  controller: numberOfPeriodsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 18,),
                          hintText: 'First',
                        ),
                        style: TextStyle(fontSize: 19),
                      ),
                ), 
                    SizedBox( 
                      width: 125,
                      child: TextField(
                       // controller: numberOfPeriodsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 19),
                          hintText: 'Second',
                        ),
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    SizedBox( 
                      width: 125,
                      child: TextField(
                      //  controller: numberOfPeriodsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 19),
                          hintText: 'Third',
                        ),
                        style: TextStyle(fontSize: 19),
                      ),
                    ), 
                     SizedBox( 
                      width: 125,
                      child: TextField(
                      //  controller: numberOfPeriodsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 19),
                          hintText: 'Fourth',
                        ),
                        style: TextStyle(fontSize: 19),
                      ),
                    ), 
                     SizedBox( 
                      width: 125,
                      child: TextField(
                      //  controller: numberOfPeriodsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 19),
                          hintText: 'Fifth',
                        ),
                        style: TextStyle(fontSize: 19),
                      ),
                    ), 

                     SizedBox( 
                      width: 125,
                      child: TextField(
                      //  controller: numberOfPeriodsController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 19),
                          hintText: 'Sixth',
                        ),
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                ],
            )
          ],
        ));
  }
}
