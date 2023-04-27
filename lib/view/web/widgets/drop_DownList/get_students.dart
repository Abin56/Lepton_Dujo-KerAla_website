import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../controller/get_firebase-data/get_firebase_data.dart';
import 'get_classes.dart';

var schoolStudentListValue;

class GetStudentsListDropDownButton extends StatefulWidget {
  GetStudentsListDropDownButton({Key? key}) : super(key: key);

  @override
  State<GetStudentsListDropDownButton> createState() =>
      _GeClasseslListDropDownButtonState();
}

class _GeClasseslListDropDownButtonState
    extends State<GetStudentsListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("Classes")
            .doc(classesListValue?["id"])
            .collection("Students")
            .orderBy('studentName', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: schoolStudentListValue == null
                  ? const Text(
                      "Select Student",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(schoolStudentListValue!["studentName"]),
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
                    schoolStudentListValue = categoryIDObject;
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
