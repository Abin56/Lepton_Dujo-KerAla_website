import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhyChooseUs extends StatelessWidget {
  const WhyChooseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminePrimayColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: cWhite),
        backgroundColor: adminePrimayColor,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        shrinkWrap: true,

        children: [
          // IconButtonBackWidget(color: cWhite),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 80),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: GoogleMonstserratWidgets(
                  text:
                      "COSTECH DUJO - the ultimate digitalized school infra app that streamlines infrastructure management and enhances school operations. With DUJO, schools can easily manage their facilities, assets, and resources with just a few clicks."
                      "DUJO provides a comprehensive range of features to manage schools' infrastructure, including live updates of attendance, a list of classes, a list of teachers, and notices and events as notifications. DUJO also offers online payment facilities, with a bill generation option for easy payment processing."
                      "DUJO also facilitates seamless learning through recorded and live classes. With student, parent, admin, teacher, and guardian logins, DUJO provides a customizable and secure platform for all stakeholders to manage and access information relevant to them."
                      "Join us on this exciting journey towards a more streamlined and efficient school infrastructure management system with DUJO. Experience the convenience and flexibility of a digitalized school infra app that takes your school's operations to the next level.",
                  fontsize: 18,
                  color: cWhite,
                  letterSpacing: 2),
            ),
          ),
        ],
      ),
    );
  }
}
