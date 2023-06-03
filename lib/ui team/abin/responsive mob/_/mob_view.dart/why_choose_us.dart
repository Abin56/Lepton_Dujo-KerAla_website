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
       body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          IconButtonBackWidget(color: cWhite),
           Padding(
             padding:  EdgeInsets.only(left: 50.w,right: 50.w,top: 80.h),
             child: Container(
              height: 500.h,
              width: double.infinity,
              child: GoogleMonstserratWidgets(text: "Lepton DUJO - the ultimate digitalized school infra app that streamlines infrastructure management and enhances school operations. With DUJO, schools can easily manage their facilities, assets, and resources with just a few clicks."
             
             "DUJO provides a comprehensive range of features to manage schools' infrastructure, including live updates of attendance, a list of classes, a list of teachers, and notices and events as notifications. DUJO also offers online payment facilities, with a bill generation option for easy payment processing."
             
             "DUJO also facilitates seamless learning through recorded and live classes. With student, parent, admin, teacher, and guardian logins, DUJO provides a customizable and secure platform for all stakeholders to manage and access information relevant to them."
             
             "Join us on this exciting journey towards a more streamlined and efficient school infrastructure management system with DUJO. Experience the convenience and flexibility of a digitalized school infra app that takes your school's operations to the next level.",
             fontsize: 18.w,color: cWhite,letterSpacing: 2),
             ),
           ),
         ],
       ),
    );
  }
}