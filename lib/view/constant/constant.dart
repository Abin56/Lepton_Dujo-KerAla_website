import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

const sizedBoxH10 = SizedBox(
  height: 10,
);
const sizedBoxH20 = SizedBox(
  height: 20,
);
const sizedBoxH30 = SizedBox(
  height: 30,
);
const sizedBoxH40 = SizedBox(
  height: 40,
);
const sizedBoxW20 = SizedBox(
  width: 20,
);
const sizedBoxw40 = SizedBox(
  width: 40,
);
const sizedBoxw10 = SizedBox(
  width: 10,
);
const sizedBoxw50 = SizedBox(
  width: 50,
);
const sizedBoxw80 = SizedBox(
  width: 80,
);
const sizedBoxw70 = SizedBox(
  width: 70,
);
const sizedBoxw60 = SizedBox(
  width: 60,
);
const sizedBoxw100 = SizedBox(
  width: 100,
);
const sizedBoxw20 = SizedBox(
  width: 20,
);
const sizedBoxw120 = SizedBox(
  width: 120,
);
const sizedBoxw130 = SizedBox(
  width: 120,
);
const sizedBoxw150 = SizedBox(
  width: 150,
);
const sizedBoxw170 = SizedBox(
  width: 170,
);
const sizedBoxw270 = SizedBox(
  width: 270,
);
const sizedBoxw370 = SizedBox(
  width: 370,
);
const sizedBoxw470 = SizedBox(
  width: 470,
);
const sizedBoxw670 = SizedBox(
  width: 670,
);
const sizedBoxw690 = SizedBox(
  width: 690,
);
const sizedBoxw745 = SizedBox(
  width: 745,
);

const sizedBoxw570 = SizedBox(
  width: 570,
);

const kwidth20 = SizedBox(
  width: 20,
);
const uuid = Uuid();

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

String stringTimeToDateConvert(String date) {
  //String dateandtime convert to "dd-mm-yyyy" this format
  try {
    final DateTime dateFormat = DateTime.parse(date);
    return "${dateFormat.day}-${dateFormat.month}-${dateFormat.year}";
  } catch (e) {
    showToast(msg: e.toString());
  }
  return '';
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

String? checkFieldEmpty(String? fieldContent) {
  //<-- add String? as a return type
  if (fieldContent == null || fieldContent.isEmpty) {
    return "Field is mandatory";
  }
  return null;
}

String? checkFieldEmailIsValid(String? fieldContent) {
  if (fieldContent == null) {
    return 'null';
  }
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  final result = (regex.hasMatch(fieldContent)) ? true : false;
  if (result) {
    return null;
  } else {
    return "Email is not valid";
  }
}

String? checkFieldPhoneNumberIsValid(String? fieldContent) {
  if (fieldContent == null) {
    return 'null';
  }
  if (fieldContent.length >= 10) {
    return null;
  } else {
    return 'Please enter 10 digit number';
  }
}

String? checkFieldPasswordIsValid(String? fieldContent) {
  if (fieldContent == null) {
    return 'null';
  }
  if (fieldContent.length >= 6) {
    return null;
  } else {
    return 'Minimum 6 Charaters is required';
  }
}

//image picket

Future<Uint8List?> pickImage(ImageSource source) async {
  try {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      return await pickedFile.readAsBytes();
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
  return null;
}

class TeacherLoginIDSaver {
  static String id = '';
  static String teacherID = '';
}

Widget circularProgressIndicator = const Center(
  child: CircularProgressIndicator(),
);
