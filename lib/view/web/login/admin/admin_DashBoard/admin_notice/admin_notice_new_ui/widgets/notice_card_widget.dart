import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../constant/constant.dart';
import 'notice_text_card_widget.dart';

class NoticeCardWidget extends StatelessWidget {
  const NoticeCardWidget({
    super.key,
    required this.heading,
    required this.date,
    required this.uploadedDate,
    required this.venue,
  });
  final String heading;
  final String date;
  final String uploadedDate;
  final String venue;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: screenSize.width * .14,
        width: screenSize.width * .17,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            // border: Border.all(),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(211, 122, 117, 117).withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NoticeTextWidget(title: heading, fontSize: 30),
                sizedBoxH10,
                NoticeTextWidget(title: date),
                sizedBoxH10,
                NoticeTextWidget(title: uploadedDate),
                sizedBoxH10,
                NoticeTextWidget(title: venue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
