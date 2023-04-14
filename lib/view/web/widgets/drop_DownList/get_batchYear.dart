import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var schoolBatchYearListValue;

class GetBatchYearListDropDownButton extends StatefulWidget {
  var schoolID;

  GetBatchYearListDropDownButton(
      {required this.schoolID, Key? key})
      : super(key: key);

  @override
  State<GetBatchYearListDropDownButton> createState() =>
      _GeClasseslListDropDownButtonState();
}

class _GeClasseslListDropDownButtonState
    extends State<GetBatchYearListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection("BatchYear").get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: schoolBatchYearListValue == null
                  ? const Text(
                      "Select BatchYear",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(schoolBatchYearListValue!["id"]),
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
                    value: val["id"],
                    child: Text(val["id"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["id"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["id"]);

                setState(
                  () {
                    schoolBatchYearListValue = categoryIDObject;
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
