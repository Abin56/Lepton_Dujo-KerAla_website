// import 'package:dash_board/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:flutter/material.dart';

class NoticeDisplayContainer extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? text1;
  final String? text2;
  final String? title;
  const NoticeDisplayContainer({
    this.title,
    this.text,
    this.text1,
    this.text2,
    this.color,
    super.key,
    required this.screensize,
  });

  final Size screensize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: color),
            child: Center(
                child: TextFontWidget(
              text: text!,
              fontsize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            )),
          ),
          TextFontWidget(
            text: text1!,
            fontsize: 16,
            fontWeight: FontWeight.w700,
          ),
          TextFontWidget(text: text2!, fontsize: 14),
          // Container(
          //         width: screensize.width / 2.9,
          //         alignment: Alignment.center,
          //         child: const Divider(
          //         color: Colors.black12,
          //         thickness: 1,
          //         ),
          //       ),
        ],
      ),
    );
  }
}
