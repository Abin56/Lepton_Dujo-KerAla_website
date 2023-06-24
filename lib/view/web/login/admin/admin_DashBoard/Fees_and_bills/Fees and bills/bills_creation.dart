// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'fees_notification/widgets/submit_button_widget.dart';

class BillsCreationalPage extends StatelessWidget {
  BillsCreationalPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(children: [
        BillsHalfContainerWidget(
            screenSize: screenSize, text: 'Bills Creation'),
        Container(
          margin: EdgeInsets.only(top: 60.h, left: 120.w),
          width: 500.w,
          height: screenSize.height - 100,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormFieldFWidget(
                  function: checkFieldEmpty,
                  // textEditingController: ,
                  labelText: 'Head',
                ),
                TextFormFieldFWidget(
                  function: checkFieldEmpty,
                  // textEditingController: ,
                  labelText: 'Title',
                ),
                TextFormFieldFWidget(
                  function: checkFieldEmpty,
                  // textEditingController: ,
                  labelText: 'Name of students',
                ),
                TextFormFieldFWidget(
                  function: checkFieldEmpty,
                  // textEditingController: ,
                  labelText: 'Amount',
                ),
                TextFormFieldFWidget(
                  function: checkFieldEmpty,
                  // textEditingController: ,
                  labelText: 'Due date',
                ),
                GestureDetector(
                    onTap: () {
                      _formKey.currentState?.validate() ?? false;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 130.w, right: 50.w, bottom: 25.h),
                      child: SubmitButtonWidget(
                        text: 'Create',
                      ),
                    )),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class BillsHalfContainerWidget extends StatelessWidget {
  const BillsHalfContainerWidget({
    super.key,
    required this.screenSize,
    required this.text,
  });

  final Size screenSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height - 80,
      width: 800.w,
      // height: screenSize.height,
      color: adminePrimayColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButtonBackWidget(
              color: cWhite,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hi ! Admin ',
                  style: ralewayStyle.copyWith(
                    fontSize: 40.0.w,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: screenSize.width / 20,
                ),
                Text(
                  text,
                  style: GoogleFonts.aclonica(
                    fontSize: 25.0.w,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 350.h,
                  width: 790.w,
                  child: LottieBuilder.network(
                      "https://assets3.lottiefiles.com/packages/lf20_2K2lEIcWwq.json"),
                )
              ],
            ),
          ]),
    );
  }
}

class TextFormFieldFWidget extends StatelessWidget {
  const TextFormFieldFWidget({
    super.key,
    required this.function,
    this.textEditingController,
    this.labelText,
    this.hintText,
  });

  final String? Function(String? fieldContent) function;
  final TextEditingController? textEditingController;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      validator: function,
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: cBlack)),
    );
  }
}
