import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var classIDListValue;

class GetClassTeacherListDropDownButton extends StatefulWidget {
  var schooID;
   GetClassTeacherListDropDownButton({required this.schooID, Key? key}) : super(key: key);

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

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection").doc(widget.schooID).collection("Classes")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: classIDListValue == null
                  ? const Text(
                      "Class Incharge",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(classIDListValue!["className"]),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
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
