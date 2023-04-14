import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../model/teacher/add_teacher_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';

class AddTeacherSectionScreen extends StatelessWidget {
  String schoolID;
  TextEditingController emailIDController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController employeeID = TextEditingController();
  AddTeacherSectionScreen({super.key, required this.schoolID});

  @override
  Widget build(BuildContext context) {
    log(schoolID);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(
          backgroundColor: adminePrimayColor,
          title: Text(
            'ADD NEW TEACHER',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: cWhite,
            ),
          )),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi ! Admin \n   Create Teacher  Profile',
                    style: ralewayStyle.copyWith(
                      fontSize: 40.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: screenSize.width / 2,
                    child: LottieBuilder.network(
                        'https://assets5.lottiefiles.com/packages/lf20_ikvz7qhc.json'),
                  )
                ],
              ),
              color: adminePrimayColor,
            ),
            Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 80, bottom: 10, left: 100, right: 100),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30, bottom: 10, left: 100, right: 100),
                  child: TextField(
                    controller: emailIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30, bottom: 10, left: 100, right: 100),
                  child: TextField(
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30, bottom: 10, left: 100, right: 100),
                  child: TextField(
                    controller: employeeID,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Employee ID',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF26A69A),
                              Color.fromARGB(255, 9, 49, 45),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 3, 39, 68),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          log('pres');
                          final teacherDetails = AddTeachersModel(
                              teacherEmail: emailIDController.text.trim(),
                              teacherPhNo: phoneNumber.text.trim(),
                              id: emailIDController.text.trim(),
                              teacherName: nameController.text.trim(),
                              employeeID: employeeID.text.trim(),
                              joinDate: DateTime.now().toString());
                          CreateTeachersAddToFireBase().createSchoolController(
                              teacherDetails, context, schoolID);
                        },
                        child: Text('Add Teacher'),
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
