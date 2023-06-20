import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
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
     // backgroundColor: adminePrimayColor,
      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(color: cWhite,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hi! Admin ',
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
                        'GENERAL INSTRUCTION',
                        style: ralewayStyle.copyWith(
                          fontSize: 20.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: size.width / 5,
                        width: size.width / 2,
                        child: LottieBuilder.network(
                            'https://assets7.lottiefiles.com/packages/lf20_OP8F21PTtz.json'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                     height: size.width * 1 / 15,
                              width: size.width * 1 / 3,
                    child: GenInstruHomeButtonWidget(
                        title: 'Create Instructions',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AddGeneralInstruction(schoolId: schoolId),
                            ),
                          );
                        }),
                  ),
                  sizedBoxH30,
                  SizedBox(
                     height: size.width * 1 / 15,
                              width: size.width * 1 / 3,
                    child: GenInstruHomeButtonWidget(
                        title: 'View Instruction',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GeneralInstruction(
                                schoolId: schoolId,
                              ),
                            ),
                          );
                        }),
                  ),
                  sizedBoxH30,
                  SizedBox(
                     height: size.width * 1 / 15,
                              width: size.width * 1 / 3,
                    child: GenInstruHomeButtonWidget(
                        title: 'Edit Instruction',
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EditGeneralInstructions(
                                schoolId: schoolId,
                              ),
                            ),
                          );
                        }),
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(width: 1),
              gradient: LinearGradient(
                  colors: containerColor[7],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
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


const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color.fromARGB(255, 212, 150, 145), Color.fromARGB(255, 212, 150, 145)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 205, 216, 228)],
  [adminePrimayColor, adminePrimayColor]
];
