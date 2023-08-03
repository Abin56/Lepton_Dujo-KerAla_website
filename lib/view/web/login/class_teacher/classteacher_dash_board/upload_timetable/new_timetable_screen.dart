// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NewTimeTableScreen extends StatefulWidget {
  String firebaseColor='';
   NewTimeTableScreen({
    super.key,
  });

  @override
  State<NewTimeTableScreen> createState() => _NewTimeTableScreenState();
}

class _NewTimeTableScreenState extends State<NewTimeTableScreen> {
  final _formKey = GlobalKey<FormState>();


  String dropdownValue1 = 'Select Day';
  String dropdownValue2 = 'Select Subject';
  String dropdownValue3 = 'Select Teacher';
  String selectedPeriod = 'Period 1';
  String selectedTime1 = 'Start Time  ';
  String selectedTime2 = 'End Time  ';
  //Color selectedColor = const Color(0x00fcfcfc);
  Color selectedColor = Colors.amber;
  bool loadingStatus = false;

  //values
  String dayName = '';
  String subjectName = '';
  String teacherName = '';
  String periodNumber = '';

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  Future<void> addTimeTableDataToFirebase() async {
    log('Colorrrrrrrrrrrrrrrrrrrrrrrrrrrr$widget.firebaseColor');
    // String uid = const Uuid().v1();
    await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(Get.find<GetFireBaseData>().classIDD.value)
        .collection('timetables')
        .doc(dayName)
        .set({'dayName': dayName});

    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(Get.find<GetFireBaseData>().classIDD.value)
        .collection('timetables')
        .doc(dayName)
        .collection(dayName)
        .doc(selectedPeriod)
        .set({
      'period': {
        'periodName': subjectName,
        'periodTeacher': teacherName,
        'startTime': startTimeController.text,
        'endTime': endTimeController.text,
        'color': 'Co${widget.firebaseColor}',
        'timeStamp': selectedPeriod
      }
    });
  }

  Future<void> getSubjectsListFromFirebase() async {
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(Get.find<GetFireBaseData>().classIDD.value)
        .collection('subjects')
        .get();

    List<Map<String, dynamic>> llist =
        snap.docs.map((doc) => doc.data()).toList();

    log(llist[0]['subjectName']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubjectsListFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child:
          //widget.schoolID == TeacherLoginIDSaver.findUser
          //?
          Scaffold(
        //  backgroundColor:
        appBar: AppBar(
          title: const Text("Create Timetable"),
          backgroundColor: adminePrimayColor,
        ),
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                color: const Color.fromARGB(255, 6, 71, 157),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //  IconButtonBackWidget(color: cWhite),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GoogleMonstserratWidgets(
                            text: 'Create TimeTable',
                            fontsize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 300,
                            width: screenSize.width / 2,
                            child: LottieBuilder.network(
                                'https://assets10.lottiefiles.com/packages/lf20_SPA6bgo7nO.json'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //color: const Color.fromARGB(255, 6, 71, 157),
              ),
              Container(
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // GoogleMonstserratWidgets(
                      //   text: "Create TimeTable",
                      //   fontsize: 30,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        width: 450,
                        child: DropdownButton<String>(
                          underline: Container(),
                          isExpanded: true,
                          value: dropdownValue1,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                            dayName = newValue!;
                          },
                          items: <String>[
                            'Select Day',
                            'Monday',
                            'Tuesday',
                            'Wednesday',
                            'Thursday',
                            'Friday',
                            'Saturday'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 22.0),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          width: 450,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(Get.find<AdminLoginScreenController>()
                                    .schoolID)
                                .collection(
                                    Get.find<GetFireBaseData>().bYear.value)
                                .doc(Get.find<GetFireBaseData>().bYear.value)
                                .collection('classes')
                                .doc(Get.find<GetFireBaseData>().classIDD.value)
                                .collection('subjects')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Error fetching data');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              List<String> dropdownValues = snapshot.data!.docs
                                  .map((doc) => doc['subjectName'] as String)
                                  .toList();

                              return DropdownButton<String>(
                                underline: Container(),
                                value: subjectName.isEmpty ? null : subjectName,
                                items: dropdownValues.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (selectedValue) {
                                  // Handle dropdown value change
                                  setState(() {
                                    subjectName = selectedValue!;
                                  });

                                  log('tN$subjectName');
                                  log('dv${dropdownValues[0]}');
                                },
                              );
                            },
                          )
          
                          ),
                      const SizedBox(height: 22.0),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          width: 450,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(Get.find<AdminLoginScreenController>()
                                    .schoolID)
                                .collection(
                                    Get.find<GetFireBaseData>().bYear.value)
                                .doc(Get.find<GetFireBaseData>().bYear.value)
                                .collection('classes')
                                .doc(Get.find<GetFireBaseData>().classIDD.value)
                                .collection('teachers')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Error fetching data');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              List<String> dropdownValues = snapshot.data!.docs
                                  .map((doc) => doc['teacherName'] as String)
                                  .toList();

                              return DropdownButton<String>(
                                underline: Container(),
                                value:
                                    teacherName.isNotEmpty ? teacherName : null,
                                items: dropdownValues.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (selectedValue) {
                                  // Handle dropdown value change
                                  setState(() {
                                    teacherName = selectedValue!;
                                  });

                                  log('tN$teacherName');
                                  log('dv${dropdownValues[0]}');
                                },
                              );
                            },
                          )),

                      const SizedBox(height: 22.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        width: 450,
                        child: DropdownButton<String>(
                          underline: Container(),
                          isExpanded: true,
                          value: selectedPeriod,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedPeriod = newValue!;
                            });
                          },
                          items: <DropdownMenuItem<String>>[
                            for (String number in [
                              'Period 1',
                              'Period 2',
                              'Period 3',
                              'Period 4',
                              'Period 5',
                              'Period 6',
                              'Period 7',
                              'Period 8',
                              'Period 9',
                              'Period 10'
                            ])
                              DropdownMenuItem<String>(
                                value: number,
                                child: Text(number.toString()),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      GoogleMonstserratWidgets(
                        text: "Add Time Slot",
                        fontsize: 25,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: startTimeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Start Time',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: endTimeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'End Time',
                              ),
                            ),
                          ),
                        ),


                      ]),
                      const SizedBox(
                        height: 16,
                      ),
                      GoogleMonstserratWidgets(
                        text: "Select Color",
                        fontsize: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        width: 450,
                        child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: selectedColor,
                          onChanged: (Color? newValue) {
                            setState(() {
                              log(newValue!.toString());
                              selectedColor = newValue;
                             String result =selectedColor.toString().substring(29, selectedColor.toString().length - 1);
                            widget.firebaseColor=result;
                              log('COL :${selectedColor.toString().substring(29, selectedColor.toString().length - 1)}');
                            });
                          },
                          items: [
                            Colors.amber,
                            Colors.red,
                            Colors.green,
                            Colors.blue,
                            Colors.yellow,
                            Colors.brown,
                            Colors.deepOrange,
                            Colors.deepPurple,
                            Colors.lime,
                            Colors.indigo,
                            Colors.grey
                          ].map<DropdownMenuItem<MaterialColor>>(
                              (MaterialColor value) {
                            return DropdownMenuItem<MaterialColor>(
                              value: value,
                              child: Container(
                                height: 30,
                                width: 50,
                                color: value,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: (loadingStatus == true)
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    loadingStatus = true;
                                  });
                                  await addTimeTableDataToFirebase();
                                  setState(() {
                                    dropdownValue1 = 'Select Day';
                                    dropdownValue2 = 'Select Subject';
                                    dropdownValue3 = 'Select Teacher';
                                    teacherName = '';
                                    subjectName = '';
                                    selectedPeriod = 'Period 1';
                                    startTimeController.clear();
                                    endTimeController.clear();
                                    loadingStatus = false;
                                  });

                                  log(dayName);
                                  log(teacherName);
                                  log(subjectName);
                                  // Handle button press
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAdmin(),));
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(150, 45)),
                                ),
                                child: const Text("Submit")),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
