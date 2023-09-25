import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class WidgetContainerOnHome extends StatelessWidget {
  String title;
  String body;
  String imagePath;
  WidgetContainerOnHome({
    required this.body,
    required this.imagePath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blue,
      height: 400,
      width: ResponsiveWebSite.isDesktop(context) ? 400 : 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GooglePoppinsWidgets(
            text: title,
            fontsize: 18,
            fontWeight: FontWeight.bold,
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              // color: Colors.red,
              color: const Color.fromARGB(255, 219, 91, 82),
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.red),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(
                    10.0,
                    2.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
              ],
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 180,
                width: 180,
              ),
            ),
          ),
          SizedBox(
            // color: Colors.amber,
            height: 100,
            width: 400,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GooglePoppinsWidgets(
                  text: body,
                  fontsize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
