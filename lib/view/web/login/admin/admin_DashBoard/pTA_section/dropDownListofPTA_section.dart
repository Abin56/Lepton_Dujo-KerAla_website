// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var pTAPowerDownValue;

class PTASectionDropDownButton extends StatefulWidget {
  var schooilID;
   PTASectionDropDownButton({
    required this.schooilID,
    Key? key}) : super(key: key);

  @override
  State<PTASectionDropDownButton> createState() =>
      _PTASectionDropDownButtonState();
}

class _PTASectionDropDownButtonState extends State<PTASectionDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection").doc(widget.schooilID).collection("PTACategoryCollection")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: pTAPowerDownValue == null
                  ? const Text("select Category")
                  : Text(pTAPowerDownValue!["ptaCategory"]),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["ptaCategory"],
                    child: Text(val["ptaCategory"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["ptaCategory"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["id"]);

                setState(
                  () {
                    pTAPowerDownValue = categoryIDObject;
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
