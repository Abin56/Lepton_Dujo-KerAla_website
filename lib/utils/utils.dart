import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
