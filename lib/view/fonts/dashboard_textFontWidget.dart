// ignore_for_file: must_be_immutable

import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';

class DashboardTextFontWidget extends StatelessWidget {
  String title;
  DashboardTextFontWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, color: cBlack.withOpacity(0.7)),
    );
  }
}
