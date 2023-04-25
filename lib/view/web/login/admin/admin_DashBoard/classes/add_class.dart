import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../model/create_classModel/create_classModel.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';
import '../teacher_section/class_listing_drop_down.dart';


class AddClassesSectionScreen extends StatelessWidget {
  String schoolID;
  TextEditingController classNameController = TextEditingController();
  TextEditingController classIDController = TextEditingController();
  TextEditingController classInChargeController = TextEditingController();
  AddClassesSectionScreen({super.key, required this.schoolID});

   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    log(schoolID);
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 71, 157),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 6, 71, 157),
            title: Text(
              'ADD NEW ClASS',
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
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hi ! Admin \n  Create Class Profile',
                        style: GoogleFont.headTextStyleBold),
                    SizedBox(
                      height: 300,
                      width: screenSize.width / 2,
                      child: LottieBuilder.network(
                          'https://assets9.lottiefiles.com/packages/lf20_bjyiojos.json'),
                    )
                  ],
                ),
                color: const Color.fromARGB(255, 6, 71, 157),
              ),
              Container(
                color: Colors.white,
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      validator: checkFieldEmpty,
                      controller: classNameController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Class Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      validator: checkFieldEmpty,
                      controller: classIDController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Class ID',
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: GetClassInchargeListDropDownButton(
                        schoolID:  Get.find<AdminLoginScreenController>().schoolID,
                      )),
                  SizedBox(
                    height: screenSize.width * 1 / 25,
                    width: screenSize.width * 1 / 7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()){
                        print('adf');
                        final classDetails = AddClassesModel(
                            id: classIDController.text.trim(),
                            className: classNameController.text.trim(),
                            classID: classIDController.text.trim(),
                            classIncharge: classesInchargeListValue!["id"],
                            joinDate: DateTime.now().toString());
                        CreateClassesAddToFireBase().createClassesController(
                            classDetails,
                            context,
                            Get.find<AdminLoginScreenController>().schoolID,
                            classesInchargeListValue!["id"]
                            );
                      }},
                      child: const Text("Add Class"),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
