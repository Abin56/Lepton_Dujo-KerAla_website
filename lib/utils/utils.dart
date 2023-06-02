import 'dart:developer';

import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
  log('Haiiiii');
  TimeOfDay? initialTime = TimeOfDay.now();
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: initialTime,
  );

  if (pickedTime != null) {
    return "${pickedTime.hourOfPeriod}:${pickedTime.minute}";
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
    }
  } catch (e) {
    showToast(msg: "Something went wrong");
    return null;
  }

  return null;
}
