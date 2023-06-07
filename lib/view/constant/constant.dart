import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
const sizedBoxH100 = SizedBox(
  height: 100,
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
    timeInSecForIosWeb: 2,
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
    showToast(msg: "Something Went Wrong");
  }
  return '';
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
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
    return "Please enter a valid email";
  }
}

String? checkFieldPhoneNumberIsValid(String? fieldContent) {
  if (fieldContent == null || fieldContent.isEmpty) {
    return 'Field is mandatory';
  }
  // if (fieldContent.length <= 10) {
  //   return 'Please enter 10 digit number';
  // }
  if (RegExp(r'^\d{10}$').hasMatch(fieldContent)) {
    return null;
  } else {
    return "Invalid Mobile Number (eg: 1234567890)";
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

class TeacherLoginIDSaver {
  static String id = '';
  static String teacherID = '';
  static String  findUser ='';
}
class TarifdetailSaver {
  static int  index0 = 0;
  static int index1 = 0;
  static String   gpsprice ='';
    static String   bioprice ='';
}

Widget circularProgressIndicator = const Center(
  child: CircularProgressIndicator(),
);
