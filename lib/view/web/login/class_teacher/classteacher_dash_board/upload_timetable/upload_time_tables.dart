import 'package:flutter/material.dart';

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
          title: const Text('Upload Timetables'),
        ),
        body: Column(
          children: [
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                const Text('Monday'), 
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
                          hintStyle: const TextStyle(fontSize: 18,),
                          hintText: 'First',
                        ),
                        style: const TextStyle(fontSize: 19),
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
                          hintStyle: const TextStyle(fontSize: 19),
                          hintText: 'Second',
                        ),
                        style: const TextStyle(fontSize: 19),
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
                          hintStyle: const TextStyle(fontSize: 19),
                          hintText: 'Third',
                        ),
                        style: const TextStyle(fontSize: 19),
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
                          hintStyle: const TextStyle(fontSize: 19),
                          hintText: 'Fourth',
                        ),
                        style: const TextStyle(fontSize: 19),
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
                          hintStyle: const TextStyle(fontSize: 19),
                          hintText: 'Fifth',
                        ),
                        style: const TextStyle(fontSize: 19),
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
                          hintStyle: const TextStyle(fontSize: 19),
                          hintText: 'Sixth',
                        ),
                        style: const TextStyle(fontSize: 19),
                      ),
                    ),
                ],
            )
          ],
        ));
  }
}
