import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../controller/get_firebase-data/get_firebase_data.dart';

var classIDListValue;

class GetClassTeacherListDropDownButton extends StatefulWidget {
  GetClassTeacherListDropDownButton({Key? key}) : super(key: key);

  @override
  State<GetClassTeacherListDropDownButton> createState() =>
      _GetClassTeacherListDropDownButtonState();
}

class _GetClassTeacherListDropDownButtonState
    extends State<GetClassTeacherListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
            .where('classTeacherdocid',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: classIDListValue == null
                  ? const Text(
                      "Select Class",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(classIDListValue!["className"]),
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
                    classIDListValue = categoryIDObject;
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
