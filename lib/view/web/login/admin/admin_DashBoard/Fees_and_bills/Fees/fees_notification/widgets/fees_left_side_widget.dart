import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../colors/colors.dart';
import '../../../../../../../../fonts/fonts.dart';
import '../../../../../../../widgets/Iconbackbutton.dart';

class FeesHalfContainerWidget extends StatelessWidget {
  const FeesHalfContainerWidget({
    super.key,
    required this.screenSize,
    required this.text,
  });

  final Size screenSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
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
                      "https://assets1.lottiefiles.com/packages/lf20_ystsffqy.json"),
                )
              ],
            ),
          ]),
    );
  }
}
