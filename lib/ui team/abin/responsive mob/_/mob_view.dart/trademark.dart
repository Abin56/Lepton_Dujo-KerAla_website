
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../view/colors/colors.dart';
import '../../../../../view/fonts/google_monstre.dart';



class TrademarkAndPolicy extends StatelessWidget {
  const TrademarkAndPolicy ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  title: GoogleMonstserratWidgets(text: "Trademark Policy", fontsize: 15.w,),
       backgroundColor: adminePrimayColor,),
      backgroundColor: adminePrimayColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         // IconButtonBackWidget(color: cWhite),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(left: 50.w,right: 50.w,top: 80.h),
              child: SizedBox(
                height: 250.w,
                width: double.infinity,
               // color: Colors.white,
                child:  GoogleMonstserratWidgets(text: 
                    "Statement \n"
"COSTECH Dujo acknowledges that trademarks are a valuable part of COSTECH Dujo’s intellectual property portfolio. They serve to signify that particular products and services originates from COSTECH Dujo. Trademarks also help to distinguish COSTECH Dujo’s products and services from competitors."
"Any improper use of our trademarks, whether by any member of staff or other third parties, could significantly diminish the value of such trademarks."
"As such, to ensure that the company can maintain, and continue to exploit its trademarks, the company expect all members of staff to act in compliance with this trademark policy.",
                      fontsize: 18.w,letterSpacing: 3,
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
