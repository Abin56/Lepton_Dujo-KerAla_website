import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:dujo_kerala_website/view/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../view/fonts/fonts.dart';
import '../../../view/web/widgets/custom_button.dart';
import 'create_alumni.dart';

class AlumniAssocation extends StatefulWidget {
  const AlumniAssocation({super.key});

  @override
  State<AlumniAssocation> createState() => _AlumniAssocationState();
}

class _AlumniAssocationState extends State<AlumniAssocation> {
  @override
  Widget build(BuildContext context) {
    var  size  = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          child: Row(children: [
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(color: cWhite,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi Admin ',
                          style: ralewayStyle.copyWith(
                            fontSize: 48.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 20,
                        ),
                        Text(
                          'Alumni Assocation',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 3.5,
                          width: size.width / 1,
                          child: LottieBuilder.network(
                              "https://assets8.lottiefiles.com/packages/lf20_Lqd2eacYpM.json"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),


             SizedBox(
           height: size.height * 1 / 1,
            width:640.w,
          child: Container(
           margin: EdgeInsets.only(left: 140.w,top: 140.w ),
            child: Column(children: [
              InkWell(
                onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AdminTeacherList(),
                  //       ));
                },
                child: Container(
                    height: size.width * 1 / 13,
                    width: size.width * 1 / 4,
                    child: CustomContainer(
                      text: 'Create Members',
                      onTap: () {},
                    )),
              ),
              sizedBoxH20,
              InkWell(
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => AdminTeacherList(),
                //       ));
                // },
                child: Container(
                    height: size.width * 1 / 13,
                    width: size.width * 1 / 4,
                    child: CustomContainer(
                      text: 'Create Alumni Category',
                      onTap: () {},
                    )),
              ),
               sizedBoxH20,
              InkWell(
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => AdminTeacherList(),
                //       ));
                // },
                child: Container(
                    height: size.width * 1 / 13,
                    width: size.width * 1 / 4,
                    child: CustomContainer(
                      text: 'Remove Members',
                      onTap: () {},
                    )),
              ),
            ]),
          ),
        ),
            ]  )),
          ])
      )
    );
   }
}

           