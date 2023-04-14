
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
      appBar: AppBar(
        title: Center(
            child: Text('GENERAL INSTRUCTION',
                style: GoogleFonts.oswald(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w800))),
        backgroundColor: adminePrimayColor,
        elevation: 0,
      ),
      body: ListView(children: [
        Row(
          children: [
            SizedBox(
              height: size.height,
              width: size.width * .5,
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
                    'Welcome To ',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
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
            SizedBox(
              width: size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenInstruHomeButtonWidget(
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
                  sizedBoxH30,
                  GenInstruHomeButtonWidget(
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
                  sizedBoxH30,
                  GenInstruHomeButtonWidget(
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
