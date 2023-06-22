import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 190.w,
      decoration: BoxDecoration(
          color: adminePrimayColor,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      child: Center(
        child: GooglePoppinsWidgets(
            text: text,
            fontsize: 15.w,
            color: cWhite,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
