import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/mothers_pta_controller/mothers_pta_controller.dart';
import '../../../../../../constant/constant.dart';
import 'mothers_pta_textfield.dart';

Future<void> updateMothersPtaDialogue(
  BuildContext context,
  String memberId,
  String imageid,
  String imageUrl,
) {
  MothersPtaController mothersPtaController = Get.find<MothersPtaController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              mothersPtaController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => mothersPtaController.isLoadingDialogue.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: 350,
                  width: 250,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () async {
                            mothersPtaController.selectImageFromStorage();
                          },
                          child: mothersPtaController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: imageUrl.isEmpty &&
                                          mothersPtaController
                                                  .imageDataUin8.value ==
                                              null
                                      ? const AssetImage(
                                          "assets/images/user.png")
                                      : mothersPtaController
                                                  .imageDataUin8.value ==
                                              null
                                          ? NetworkImage(imageUrl)
                                          : MemoryImage(
                                              mothersPtaController
                                                  .imageDataUin8.value!,
                                            ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      MothersPtaTextfield(
                        hintText: 'Name',
                        controller: mothersPtaController.nameController,
                      ),
                      sizedBoxH20,
                      MothersPtaTextfield(
                        hintText: 'Designation',
                        controller: mothersPtaController.designationController,
                      ),
                      sizedBoxH20,
                      MothersPtaTextfield(
                        hintText: 'Position',
                        controller: mothersPtaController.positionController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          mothersPtaController.updateMothersPtaMemberDetails(
                              memberId, context, imageid, imageUrl);
                        },
                        child: const Text('Update'),
                      )
                    ],
                  ),
                ),
        ),
      );
    },
  );
}

Future<void> createMothersPtaDialogue(
  BuildContext context,
) {
  MothersPtaController mothersPtaController = Get.find<MothersPtaController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              mothersPtaController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => SizedBox(
            height: 350,
            width: 250,
            child: mothersPtaController.isLoadingDialogue.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () async {
                            mothersPtaController.selectImageFromStorage();
                          },
                          child: mothersPtaController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: mothersPtaController
                                              .imageDataUin8.value ==
                                          null
                                      ? const AssetImage(
                                          'assets/images/user.png')
                                      : MemoryImage(
                                          mothersPtaController
                                              .imageDataUin8.value!,
                                        ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      MothersPtaTextfield(
                        hintText: 'Name',
                        controller: mothersPtaController.nameController,
                      ),
                      sizedBoxH20,
                      MothersPtaTextfield(
                        hintText: 'Designation',
                        controller: mothersPtaController.designationController,
                      ),
                      sizedBoxH20,
                      MothersPtaTextfield(
                        hintText: 'Position',
                        controller: mothersPtaController.positionController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          mothersPtaController.addMothersPtaMember(context);
                        },
                        child: const Text('Create'),
                      )
                    ],
                  ),
          ),
        ),
      );
    },
  );
}
