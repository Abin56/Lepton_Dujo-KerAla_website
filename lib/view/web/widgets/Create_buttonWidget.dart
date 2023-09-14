import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CreateContainerWidget extends StatelessWidget {
  CreateContainerWidget({
    required this.text,
    required this.fontSize,
    super.key,
  });
  String text;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 270,
      decoration: const BoxDecoration(
          color: adminePrimayColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
          child:
              Text(text, style: TextStyle(color: cWhite, fontSize: fontSize))),
    );
  }
}
