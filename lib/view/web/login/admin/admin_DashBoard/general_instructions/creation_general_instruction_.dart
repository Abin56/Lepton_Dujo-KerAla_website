import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:dujo_kerala_website/view/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';
import 'add_general_instructions.dart';
import 'edit_general_instructions.dart';
import 'general_instruction.dart';

class CreationGeneralInstruction extends StatelessWidget {
  const CreationGeneralInstruction({super.key, required this.schoolId});
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: adminePrimayColor,
      body: ListView(children: [
        Row(
          children: [
            Container(
              height: size.height,
              width: size.width * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(
                    color: cWhite,
                  ),
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
                          height: size.width / 30,
                        ),
                        Text(
                          'Welcome To ',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 40,
                        ),
                        Text(
                          'General Insructions ',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 40,
                        ),
                        SizedBox(
                          height: size.width / 5,
                          width: size.width / 2,
                          child: LottieBuilder.network(
                              'https://assets4.lottiefiles.com/packages/lf20_p7ml1rhe.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: size.height * 1,
              width: size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.width * 1 / 20,
                    width: size.width * 1 / 3.7,
                    child: CustomContainer(
                      text: 'Create Instructions',
                      onTap: () {},
                    ),
                  ),
                  // GenInstruHomeButtonWidget(
                  //     title: 'Create Instructions',
                  //     function: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (BuildContext context) =>
                  //               AddGeneralInstruction(schoolId: schoolId),
                  //         ),
                  //       );
                  //     }),
                  sizedBoxH30,
                  Container(
                    height: size.width * 1 / 20,
                    width: size.width * 1 / 3.7,
                    child: CustomContainer(
                      text: 'View Instructions',
                      onTap: () {},
                    ),
                  ),
                  sizedBoxH30,
                  Container(
                    height: size.width * 1 / 20,
                    width: size.width * 1 / 3.7,
                    child: CustomContainer(
                      text: 'Edit Instructions',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          width: size.width * .3,
          height: size.height * 1 / 10,
          decoration: BoxDecoration(
            color: adminePrimayColor,
            border: Border.all(color: Colors.white),
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
                    color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
