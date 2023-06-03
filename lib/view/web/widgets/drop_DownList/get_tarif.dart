import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/payment_tarif/checking_tarif_controller.dart';

var leptonTarifListValue;

class GetTarifListDropDownButton extends StatefulWidget {
    final tarifController = Get.put(TarifController());
   GetTarifListDropDownButton({Key? key}) : super(key: key);

  @override
  State<GetTarifListDropDownButton> createState() =>
      _GeClasseslListDropDownButtonState();
}

class _GeClasseslListDropDownButtonState
    extends State<GetTarifListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("keralaSchoolTarif")
            .orderBy('index', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: leptonTarifListValue == null
                  ?  GoogleMonstserratWidgets(text: 
                      "Select Strenght",
                      
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontsize: 14.w,
                    )
                  : Text(leptonTarifListValue!["noofstudents"]),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["noofstudents"],
                    child: Text(val["noofstudents"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["noofstudents"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["noofstudents"]);

                setState(
                  () {
                    widget.tarifController.price.value= categoryIDObject['price'];
                     widget.tarifController.maxstudents.value= categoryIDObject['maxtoken'];
                      widget.tarifController.selectedPlan.value= categoryIDObject['typename'];

                    log(widget.tarifController.price.value);

                    leptonTarifListValue = categoryIDObject;
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
