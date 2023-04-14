
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/Getx/web_controllers/generainstructions/general_instructions_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';



class EditGeneralInstructions extends StatelessWidget {
  EditGeneralInstructions({super.key, required this.schoolId});
  final String schoolId;
  final GeneralInstructionsController generalInstructionsController =
      Get.put(GeneralInstructionsController());

  @override
  Widget build(BuildContext context) {
    generalInstructionsController.getInstruction(schoolId);
    return Scaffold(
        backgroundColor: adminePrimayColor,
        appBar: AppBar(
          backgroundColor: adminePrimayColor,
        ),
        body: Obx(() {
          return generalInstructionsController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount:
                      generalInstructionsController.listOfGeneralIModel.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GInstructionListTileWidget(
                      generalInstructionsController:
                          generalInstructionsController,
                      schoolId: schoolId,
                      index: index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                );
        }));
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
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Remove'),
                      content: const Text(
                          'Are you sure you want to remove this Notice'),
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
              icon: const Icon(Icons.delete),
            ),
            sizedBoxw10,
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
                Icons.edit,
              ),
            )
          ],
        ),
      ),
    );
  }
}
