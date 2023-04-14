import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var classesInchargeListValue;

class GetClassInchargeListDropDownButton extends StatefulWidget {
  var schoolID;
  
  GetClassInchargeListDropDownButton(
      {required this.schoolID,  Key? key})
      : super(key: key);

  @override
  State<GetClassInchargeListDropDownButton> createState() =>
      _GeClasseslListDropDownButtonState();
}

class _GeClasseslListDropDownButtonState
    extends State<GetClassInchargeListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection("Teachers")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: classesInchargeListValue == null
                  ? const Text(
                      "Class Incharge",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(classesInchargeListValue!["teacherName"]),
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
                    value: val["teacherName"],
                    child: Text(val["teacherName"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["teacherName"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["teacherName"]);

                setState(
                  () {
                    classesInchargeListValue = categoryIDObject;
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
