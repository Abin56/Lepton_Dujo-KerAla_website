import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(height: 70.w,
    width: 270.w,
    
    decoration: BoxDecoration(
      color: adminePrimayColor,
      borderRadius: BorderRadius.all(
        Radius.circular(10.w))),
    child: Center(child: Text(text,style: TextStyle(color: cWhite,fontSize: fontSize))),
    );
  }
}