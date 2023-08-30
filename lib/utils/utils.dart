import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../model/create_classModel/add_student_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<String> dateTimePicker(BuildContext context) async {
  DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2500));
  if (dateTime != null) {
    return DateFormat("dd-M-yyyy").format(dateTime);
  } else {
    return '';
  }
}

Future<String> timePicker(BuildContext context) async {
  TimeOfDay? initialTime = TimeOfDay.now();
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: initialTime,
  );

  if (pickedTime != null) {
    int hour = pickedTime.hourOfPeriod;
    String period = pickedTime.period == DayPeriod.am ? 'AM' : 'PM';

    return "${hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')} $period";
  } else {
    return "";
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

//firebase exceptions

void handleFirebaseError(FirebaseAuthException error) {
  switch (error.code) {
    case 'invalid-email':
      showToast(msg: 'invalid-email');
      break;
    case 'user-disabled':
      showToast(msg: 'user-disabled');
      break;
    case 'user-not-found':
      showToast(msg: 'user-not-found');
      break;
    case 'wrong-password':
      showToast(msg: 'wrong-password');
      break;
    default:
      showToast(msg: 'Something went wrong');
      break;
  }
}

Future<void> resetPassword(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    showToast(msg: "Password verification email sent to your email address.");
  } catch (e) {
    log('Error sending password reset email: $e');
  }
}

Future<Excel?> extractDataFromExcel() async {
  /// Use FilePicker to pick files in Flutter Web
  ///
  try {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );

    /// file might be picked

    if (pickedFile != null) {
      Uint8List? bytes = pickedFile.files.single.bytes;
      if (bytes != null) {
        Excel excel = Excel.decodeBytes(bytes);

        return excel;
      }
    } else {
      showToast(msg: "Excel File Error");
    }
  } catch (e) {
    showToast(msg: "Something went wrong");
    return null;
  }
  return null;
}

Future<void> sendPushMessage(String token, String body, String title) async {
  try {
    final reponse = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAd0ScEck:APA91bELuwPRaLXrNxKTwj-z6EK-mCSPOon5WuZZAwkdklLhWvbi_NxXGtwHICE92vUzGJyE9xdOMU_-4ZPbWy8s2MuS_s-4nfcN_rZ1uBTOCMCcJ5aNS7rQHeUTXgYux54-n4eoYclp'
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
          },
          "notification": <String, dynamic>{
            'title': title,
            'body': body,
            'android_channel_id': 'high_importance_channel'
          },
          'to': token,
        },
      ),
    );
    print(reponse.body.toString());
  } catch (e) {
    if (kDebugMode) {
      log("error push Notification");
    }
  }
}

void showMyAlertDialog({
  required BuildContext context,
  required String content,
  VoidCallback? okButton,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(onPressed: okButton, child: const Text('OK')),
        ],
      );
    },
  );
}

String timeStampToDateFormat(int timeStamp) {
  if (timeStamp == -1) {
    return "";
  }
  try {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String d12 = DateFormat('dd-MM-yyyy').format(dt);

    return d12;
  } catch (e) {
    log("Format error");
    return "";
  }
}

Future<AddStudentModel?> getStudentData(
    {required String studentId, required String classId}) async {
  try {
    final studentData = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .doc(classId)
        .collection("Students")
        .doc(studentId)
        .get();

    return AddStudentModel.fromMap(studentData.data() ?? {});
  } catch (e) {
    return null;
  }
}


Future<void>pickImageFromDevice()async{}