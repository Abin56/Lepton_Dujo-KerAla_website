import 'package:dujo_kerala_website/controller/Getx/admin/pta/pta_controller.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_pta/widgets/admin_pta_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constant/constant.dart';

Future<void> updateAdminPtaDialogue(
  BuildContext context,
  String memberId,
  String imageid,
  String? imageUrl,
) {
  PtaController ptaController = Get.find<PtaController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              ptaController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => ptaController.isLoadingDialogue.value
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
                            ptaController.selectImageFromStorage();
                          },
                          child: ptaController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: imageUrl == null &&
                                          ptaController.imageDataUin8.value ==
                                              null
                                      ? const AssetImage(
                                          "assets/images/user.png")
                                      : ptaController.imageDataUin8.value ==
                                              null
                                          ? NetworkImage(imageUrl!)
                                          : MemoryImage(
                                              ptaController
                                                  .imageDataUin8.value!,
                                            ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      AdminPtaTextField(
                        hintText: 'Name',
                        controller: ptaController.nameController,
                      ),
                      sizedBoxH20,
                      AdminPtaTextField(
                        hintText: 'Designation',
                        controller: ptaController.designationController,
                      ),
                      sizedBoxH20,
                      AdminPtaTextField(
                        hintText: 'Position',
                        controller: ptaController.positionController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          ptaController.updatePta(
                              memberId, context, imageid, imageUrl ?? "");
                        },
                        child: const Text('Edit'),
                      )
                    ],
                  ),
                ),
        ),
      );
    },
  );
}

Future<void> createAdminPtaDialogue(
  BuildContext context,
) {
  PtaController ptaController = Get.find<PtaController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              ptaController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => SizedBox(
            height: 350,
            width: 250,
            child: ptaController.isLoadingDialogue.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () async {
                            ptaController.selectImageFromStorage();
                          },
                          child: ptaController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      ptaController.imageDataUin8.value == null
                                          ? const AssetImage(
                                              'assets/images/user.png')
                                          : MemoryImage(
                                              ptaController
                                                  .imageDataUin8.value!,
                                            ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      AdminPtaTextField(
                        hintText: 'Name',
                        controller: ptaController.nameController,
                      ),
                      sizedBoxH20,
                      AdminPtaTextField(
                        hintText: 'Designation',
                        controller: ptaController.designationController,
                      ),
                      sizedBoxH20,
                      AdminPtaTextField(
                        hintText: 'Position',
                        controller: ptaController.positionController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          ptaController.addStudentToPta(context);
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
