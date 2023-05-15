import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/web_controllers/generainstructions/general_instructions_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/Iconbackbutton.dart';

class EditGeneralInstructions extends StatelessWidget {
  EditGeneralInstructions({super.key, required this.schoolId});
  final String schoolId;
  final GeneralInstructionsController generalInstructionsController =
      Get.put(GeneralInstructionsController());

  @override
  Widget build(BuildContext context) {
    generalInstructionsController.getInstruction(schoolId);
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
        ///backgroundColor: adminePrimayColor,
        // appBar: AppBar(
        //     backgroundColor: adminePrimayColor,
        //     title: const Center(
        //       child: Text(
        //         'Edit Instruction',
        //         style: TextStyle(color: cWhite),
        //       ),
        //     )),
        body: 
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
                 Column(
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
                       'Edit Instruction',
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
               ],
             ),
            ),
          
            Obx(() {
         return generalInstructionsController.isLoading.value
             ? const Center(
                 child: CircularProgressIndicator(),
               )
             : Expanded(
               child: ListView.builder(
                    itemCount: 
                       generalInstructionsController.listOfGeneralIModel.length,
                   shrinkWrap: true,
                   itemBuilder: (context, index) {
                     return 
                         GInstructionListTileWidget(
                               generalInstructionsController:
                                   generalInstructionsController,
                               schoolId: schoolId,
                               index: index,
                         );
                   },
                  
                 ),
             );
            }),
            ],
        ));
  }
}

class GInstructionListTileWidget extends StatelessWidget {
  const GInstructionListTileWidget({
    super.key,
    required this.generalInstructionsController,
    required this.schoolId,
    required this.index,
  });

  final GeneralInstructionsController generalInstructionsController;
  final String schoolId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:    const EdgeInsets.all(10.0),
      child: ListTile(
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.w))),
        contentPadding: const EdgeInsets.all(10),
        tileColor: cWhite,
        leading: Text((index + 1).toString()),
        title: Text(
          generalInstructionsController.listOfGeneralIModel[index].instruction,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                generalInstructionsController.textEditingController.text =
                    generalInstructionsController
                        .listOfGeneralIModel[index].instruction;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Edit Instruction'),
                      content: Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: generalInstructionsController
                              .textEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            generalInstructionsController.updateInstructions(
                              generalInstructionsController
                                  .listOfGeneralIModel[index].instructionId,
                              schoolId,
                              generalInstructionsController
                                  .textEditingController.text,
                            );
                            Navigator.of(context).pop();
                          },
                          child: const Text('Update'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.edit,color: cgreen,
              ),
            ),
            sizedBoxw10,
                   IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                          'Are you sure you want to delete this instruction'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            generalInstructionsController.removeInstruction(
                              generalInstructionsController
                                  .listOfGeneralIModel[index].instructionId,
                              schoolId,
                            );
                            Navigator.of(context).pop();
                          },
                          child: const Text('Remove'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete,color: cred),
            ),
          ],
        ),
      ),
    );
  }
}


