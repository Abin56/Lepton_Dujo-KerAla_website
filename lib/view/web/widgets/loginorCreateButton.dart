// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/colors.dart';
import '../../fonts/google_monstre.dart';

class LoginOrCreateButton extends StatelessWidget {
   LoginOrCreateButton({
    required this.text,
    super.key,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 60.w,
    width: 220.w,
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),border: Border.all(color: cWhite),
    color: adminScreencolor,),
    child: Center(child: GoogleMonstserratWidgets(fontsize: 15.w,text: text,color: cWhite,))
    );
  }
}
