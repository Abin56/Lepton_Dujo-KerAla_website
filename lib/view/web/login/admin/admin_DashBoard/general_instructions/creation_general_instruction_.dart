import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/general_instructions/add_general_instructions.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/general_instructions/edit_general_instructions.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/general_instructions/general_instruction.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:dujo_kerala_website/view/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class CreationGeneralInstruction extends StatelessWidget {
  const CreationGeneralInstruction({super.key, required this.schoolId});
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: adminePrimayColor,
      // appBar: AppBar(
      //   title: Center(
      //       child: Text('GENERAL INSTRUCTION',
      //           style: GoogleFonts.oswald(
      //               fontSize: 25,
      //               color: const Color.fromARGB(255, 255, 255, 255),
      //               fontWeight: FontWeight.w800))),
      //   backgroundColor: adminePrimayColor,
      //   elevation: 0,
      // ),
      body: ListView(children: [
        Row(children: [
          SizedBox(
            height: size.height,
            width: size.width * .5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButtonBackWidget(color: cWhite),
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
                          'welcome to',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 30,
                        ),
                        Text(
                          'General Instructions',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 30,
                        ),
                        SizedBox(
                          height: size.width / 5,
                          width: size.width / 2,
                          child: LottieBuilder.network(
                              'https://assets4.lottiefiles.com/packages/lf20_p7ml1rhe.json'),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            height: size.height,
            width: size.width * .5,
            color: cWhite,
            child: Padding(
              padding: EdgeInsets.only(left: 140.w, top: 220.h),
              child: Column(
                children: [
                  (InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddGeneralInstruction(schoolId: schoolId),
                          ));
                    },
                    child: SizedBox(
                        height: size.width * 1 / 15,
                        width: size.width * 1 / 3,
                        child: CustomContainer(
                          text: 'Create Instructions',
                          onTap: () {},
                        )),
                  )),
                  sizedBoxH20,
                  (InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GeneralInstruction(
                              schoolId: schoolId,
                            ),
                          ));
                    },
                    child: SizedBox(
                        height: size.width * 1 / 15,
                        width: size.width * 1 / 3,
                        child: CustomContainer(
                          text: 'View Instruction',
                          onTap: () {},
                        )),
                  )),
                  sizedBoxH20,
                  (InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EditGeneralInstructions(
                              schoolId: schoolId,
                            ),
                          ));
                    },
                    child: SizedBox(
                        height: size.width * 1 / 15,
                        width: size.width * 1 / 3,
                        child: CustomContainer(
                          text: 'Edit Instruction',
                          onTap: () {},
                        )),
                  )),
                ],
               
              ),
            ),
          )
        ]),
      ]),
    );
  }
}

class GenInstruHomeButtonWidget extends StatelessWidget {
  const GenInstruHomeButtonWidget(
      {super.key, required this.title, required this.function});
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: function,
        child: Container(
          height: size.width * 1 / 15,
          width: size.width * 1 / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: adminePrimayColor),
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.none,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
