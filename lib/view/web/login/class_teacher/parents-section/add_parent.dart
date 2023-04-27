import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../model/parent/parent_model.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';
import '../../../widgets/drop_DownList/get_classes.dart';
import '../../../widgets/drop_DownList/get_students.dart';

class AddParent extends StatefulWidget {
  String teacherIDE;
  AddParent({super.key, required this.schoolID, required this.teacherIDE});
  String schoolID;

  @override
  State<AddParent> createState() => _AddParentState();
}

class _AddParentState extends State<AddParent> {
  String studentID = '';
  Map<String, dynamic>? classListDropDown;
  TextEditingController parentNameController = TextEditingController();

  TextEditingController parentemailController = TextEditingController();

  TextEditingController parentPhoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    log("Parent screen MAin");
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: cWhite,
          iconTheme: const IconThemeData(color: cBlack)),
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
                          'ADD NEW PARENT',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH30,
                        AddParentWidget(
                            function: checkFieldEmpty,
                            labelText: 'Parent Name',
                            textEditingController: parentNameController),
                        sizedBoxH30,
                        dropDownButtonsec(),
                        classesListValue == null
                            ? const SizedBox()
                            : dropDownButton(),
                        AddParentWidget(
                            function: checkFieldPhoneNumberIsValid,
                            labelText: 'Parent Phone Number',
                            textEditingController: parentPhoneNumberController),
                        sizedBoxH30,
                        sizedBoxH30,
                        SizedBox(
                          width: 350.w,
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: adminePrimayColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              log("Classs ID${classesListValue!["id"]}");
                              log("Student ID${classListDropDown?['id']}");
                              if (formKey.currentState!.validate()) {
                                final parentDetails = ParentModel(
                                    studentID: studentID,
                                    parentEmail:
                                        parentemailController.text.trim(),
                                    parentPhoneNumber:
                                        parentPhoneNumberController.text.trim(),
                                    parentName: parentNameController.text,
                                    createdate: DateTime.now().toString());

                                CreateParentsAddToFireBase()
                                    .createSchoolController(
                                        parentDetails,
                                        context,
                                        widget.schoolID,
                                        classesListValue['id']);
                              }
                            },
                            child: const Text("Add Parent"),
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
              'assets/images/parent.jpg',
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

class AddParentWidget extends StatelessWidget {
  AddParentWidget({
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
