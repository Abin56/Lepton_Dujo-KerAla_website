import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/web_controllers/generainstructions/general_instructions_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class AddGeneralInstruction extends StatelessWidget {
  AddGeneralInstruction({super.key, required this.schoolId});
  final GeneralInstructionsController generalInstructionsController =
      Get.put(GeneralInstructionsController());
  final String schoolId;
  @override
  Widget build(BuildContext context) {
    generalInstructionsController.textEditingController.clear();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Create Instructions'),
      //   backgroundColor: adminePrimayColor,
      //   elevation: 0,
      // ),
      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                          height: screenSize.width / 20,
                        ),
                        Text(
                          'Create Instructions ',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.width / 5,
                          width: screenSize.width / 2,
                          child: LottieBuilder.network(
                              'https://assets4.lottiefiles.com/packages/lf20_HYpftP1320.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return generalInstructionsController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: screenSize.height,
                      width: screenSize.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 30,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: screenSize.width / 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              sizedBoxH20,
                              ContainerWidget(
                                screenSize: screenSize,
                                hintText: "Instructions",
                                textEditingController:
                                    generalInstructionsController
                                        .textEditingController,
                              ),
                              sizedBoxH20,
                              SizedBox(
                                width: screenSize.width / 6.5,
                                height: screenSize.width / 22,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    if (generalInstructionsController
                                        .textEditingController.text
                                        .trim()
                                        .isEmpty) {
                                      showToast(
                                        msg: 'Error:Field is Empty',
                                      );
                                      return;
                                    }
                                    if (generalInstructionsController
                                        .textEditingController
                                        .text
                                        .isNotEmpty) {
                                      generalInstructionsController
                                          .instructionList
                                          .add(generalInstructionsController
                                              .textEditingController.text);
                                      generalInstructionsController
                                          .textEditingController
                                          .clear();
                                    }
                                  },
                                  child: const Text("Add"),
                                ),
                              ),
                              sizedBoxH20,
                              SizedBox(
                                width: screenSize.width / 6.5,
                                height: screenSize.width / 22,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () async {
                                    await generalInstructionsController
                                        .addListOfInstructions(schoolId);
                                  },
                                  child: const Text("Upload"),
                                ),
                              ),
                              sizedBoxH20,
                              Expanded(
                                child: ListView.builder(
                                    itemCount: generalInstructionsController
                                        .instructionList.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          '•  ${generalInstructionsController.instructionList[index]}');
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
            })
          ],
        ),
      ]),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.screenSize,
    required this.hintText,
    required this.textEditingController,
  });

  final Size screenSize;
  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
