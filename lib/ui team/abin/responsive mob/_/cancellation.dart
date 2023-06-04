
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../view/colors/colors.dart';
import '../../../../../view/fonts/google_monstre.dart';



class CancellationPolicy extends StatelessWidget {
  const CancellationPolicy ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  title: GoogleMonstserratWidgets(text: "Cancellation Policy", fontsize: 15.w,),
       backgroundColor: adminePrimayColor,),
      backgroundColor: adminePrimayColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        //  IconButtonBackWidget(color: cWhite),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(left: 50.w,right: 50.w,top: 80.h),
              child: SizedBox(
                height: 450.h
                ,
                width: double.infinity,
               // color: Colors.white,
                child:  GoogleMonstserratWidgets(text: 
"Thank you for registering your school with us. We want to make sure that our customers have an exceptional learning experience online. As with any online purchase experience, the below are the terms and conditions that govern the Refund Policy. When you buy a subscription on the Lepton Dujo you agree to our Privacy Policy, Terms of Use and the conditions covered below."
"Cancellation & Refunds: Online Training"
"We understand that you can change your mind. We know that some of our courses might not be 100% relevant to you in your current need. That is why we give you the freedom to ask for a partial refund of your course fee within 72 hours of course activation. If the cancellation requested by the customer within 24 hours of subscribing, 90% of course fee paid will be refunded."
"If the cancellation is done after 24 hours but before completion of 72 hours, 50% of the course fee will be deducted and balance will be refunded to your account. If the cancellation is done by the customer after 72 hours of course activation no refund will be made. Note: If more than 3 Modules have been accessed, cancellation is not possible, and no refund will be provided."
"Refunds: Duplicate payment"
"Refund of the duplicate payment made by the customer will be processed via same source (original method of payment) within 7 to 21 working days after intimation by the customer."
"Note: All refunds will be processed within 30 days of approval and validation of refund request."
                      ,fontsize: 18.w,letterSpacing: 3,
                      color: cWhite),
              ),
            ),
          ),
          // const SizedBox(height: 10),
       
          
        ],
      ),
    );
  }
}
