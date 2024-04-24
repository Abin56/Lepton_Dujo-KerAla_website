// import 'package:dash_board/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:flutter/material.dart';

// import '../../../../../../../../colors/colors.dart';

class ParentProfileWidget extends StatelessWidget {
  const ParentProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      // width: 565,
      height: 160,
      child: const Padding(
        padding: EdgeInsets.only(top: 10, left: 10),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: CircleAvatar(
                radius: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, left: 10),
              child: Column(
                children: [
                  TextFontWidget(
                    text: "Neena V",
                    fontsize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  TextFontWidget(text: "Thursday ,Nov 23 2023", fontsize: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
