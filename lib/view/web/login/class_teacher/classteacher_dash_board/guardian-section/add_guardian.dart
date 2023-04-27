import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/guardian/guardian_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../widgets/drop_DownList/get_classes.dart';

class AddGuardian extends StatefulWidget {
  String teacherIDE;
  AddGuardian({super.key, required this.schoolId, required this.teacherIDE});
  String schoolId;

  @override
  State<AddGuardian> createState() => _AddGuardianState();
}

class _AddGuardianState extends State<AddGuardian> {
  String studentID = '';
  Map<String, dynamic>? classListDropDown;
  final formKey = GlobalKey<FormState>();

  TextEditingController guardianNameController = TextEditingController();

  TextEditingController guardianEmailController = TextEditingController();

  TextEditingController guardianPhoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: cWhite, iconTheme: IconThemeData(color: cBlack)),
      body: Row(
        children: <Widget>[
          //left section

          SizedBox(
            width: size.width / 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ADD NEW GUARDIAN',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH30,
                        AddGuardianWidget(
                          function: checkFieldEmpty,
                          labelText: 'Guardian Name',
                          textEditingController: guardianNameController,
                        ),
                        sizedBoxH30,
                        dropDownButtonsec(),
                        classesListValue == null
                            ? const SizedBox()
                            : dropDownButton(),
                        AddGuardianWidget(
                          function: checkFieldPhoneNumberIsValid,
                          labelText: 'Guardian PhoneNumber',
                          textEditingController: guardianPhoneNoController,
                        ),
                        sizedBoxH30,
                        SizedBox(
                          width: 350.w,
                          height: 70.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: adminePrimayColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                           if (formKey.currentState!.validate()) {
                              final guardianDetails = GuardianAddModel(
                                studentID: studentID,
                                createdate: DateTime.now().toString(),
                                guardianPhoneNumber:
                                    guardianPhoneNoController.text.trim(),
                                guardianName:
                                    guardianNameController.text.trim(),
                              );
                              CreateGuardiansAddToFireBase()
                                    .createSchoolController(
                                        guardianDetails,
                                        context,
                                        widget.schoolId,
                                        classesListValue['id']);
                             
                           }
                            },
                            child: const Text("Add Guardian"),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 2,
            height: size.height,
            child: Image.asset(
              'assets/images/guardian.jpg',
              width: size.width / 2,
              fit: BoxFit.fill,
            ),
          ),
          //right section
        ],
      ),
    );
  }

  dropDownButton() {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("Classes")
            .doc(classesListValue?["id"])
            .collection("Students")
            .orderBy('studentName', descending: false)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: classListDropDown == null
                  ? const Text(
                      "Select Student",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(classListDropDown!["studentName"]),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["studentName"],
                    child: Text(val["studentName"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["studentName"] == val)
                    .toList()
                    .first;
                log("studenssssss##########${categoryIDObject["studentName"]}");

                setState(
                  () {
                    studentID = categoryIDObject["docid"];
                    log(classListDropDown.toString());
                    classListDropDown =
                        categoryIDObject as Map<String, dynamic>?;
                  },
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButtonsec() {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("Classes")
            .where('classIncharge', isEqualTo: widget.teacherIDE)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: classesListValue == null
                  ? const Text(
                      "Select Class",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(classesListValue!["className"]),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["className"],
                    child: Text(val["className"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["className"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["className"]);

                setState(
                  () {
                    classesListValue = categoryIDObject;
                  },
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

class AddGuardianWidget extends StatelessWidget {
  AddGuardianWidget({
    super.key,
    required this.textEditingController,
    required this.function,
    required this.labelText,
  });

  final TextEditingController textEditingController;
  final String? Function(String? fieldContent) function;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: function,
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelText: labelText,
      ),
    );
  }
}
