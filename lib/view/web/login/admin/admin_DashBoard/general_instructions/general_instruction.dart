import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/Getx/web_controllers/generainstructions/general_instructions_controller.dart';
import '../../../../../constant/constant.dart';

class GeneralInstruction extends StatelessWidget {
  GeneralInstruction({super.key, required this.schoolId});
  final GeneralInstructionsController generalInstructionsController =
      Get.put(GeneralInstructionsController());
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    generalInstructionsController.getInstruction(schoolId);
    return Scaffold(body: Obx(() {
      if (generalInstructionsController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (generalInstructionsController.listOfGeneralIModel.isEmpty) {
        return const Center(
          child: Text('No data found'),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: adminePrimayColor,
              title: const Center(
                child: Text(
                  'View Instruction',
                  style: TextStyle(color: cWhite),
                ),
              )),
          body: ListView(
            children: [
              Container(
                height: 200,
                color: Colors.lightBlue[900],
                child: Stack(children: [
                  Opacity(
                      opacity: 0.5,
                      child: ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          color: Colors.white,
                          height: 150,
                        ),
                      )),
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.blueGrey,
                      height: 130,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 70, top: 70),
                    child: CircleAvatar(
                      maxRadius: 50,
                    ),
                  ),
                  Center(
                    child: Text(
                      generalInstructionsController.schoolName.value,
                      style: GoogleFonts.adamina(
                          fontSize: 35, color: Colors.white),
                    ),
                  ),
                ]),
              ),
              sizedBoxH20,
              Center(
                  child: Text(
                "Subject",
                style: GoogleFonts.oswald(fontSize: 32),
              )),
              sizedBoxH10,
              Center(
                  child: Text(
                      stringTimeToDateConvert(generalInstructionsController
                          .listOfGeneralIModel.last.time),
                      style: GoogleFonts.oswald(fontSize: 25))),
              sizedBoxH40,
              Center(
                  child: Text(
                "General Instruction",
                style: GoogleFonts.acme(
                    fontSize: 20, decoration: TextDecoration.underline),
              )),
              sizedBoxH40,
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index ==
                          (generalInstructionsController
                              .listOfGeneralIModel.length)) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/en/d/d4/Samantha_Signature.jpg',
                                width: 70,
                                height: 40,
                              ),
                              sizedBoxH10,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Principal",
                                        style: GoogleFonts.roboto(fontSize: 15),
                                        softWrap: true,
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        );
                      }
                      return InstructionTextWidget(
                        count: (index + 1).toString(),
                        text: generalInstructionsController
                            .listOfGeneralIModel[index].instruction,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return sizedBoxH20;
                    },
                    itemCount: generalInstructionsController
                            .listOfGeneralIModel.length +
                        1),
              ),
            ],
          ),
        );
      }
    }));
  }
}

class InstructionTextWidget extends StatelessWidget {
  const InstructionTextWidget({
    super.key,
    required this.text,
    required this.count,
  });
  final String text;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Flexible(
        child: Text(
          "$count.  $text",
          style: GoogleFonts.openSans(fontSize: 18),
          softWrap: true,
        ),
      ),
    ]);
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    {
      debugPrint(size.width.toString());
      var path = Path();
      path.lineTo(0, size.height);
      var firstStart = Offset(size.width / 5, size.height);
      //first point
      var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
      //second point
      path.quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
      var secondStart =
          Offset(size.width - (size.width / 3.24), size.height - 105);
      //third
      var secondEnd = Offset(size.width, size.height - 10);
      //fourth
      path.quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
      //
      path.lineTo(size.width, 0);
      path.close();
      return path;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
