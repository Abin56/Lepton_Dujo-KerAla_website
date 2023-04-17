import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/widgets/student_protection_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import '../../../../../../constant/constant.dart';

Future<void> updateStudentProtectionDialogue(
  BuildContext context,
  String memberId,
  String imageid,
  String? imageUrl,
) {
  StudentProtectionController protectionController =
      Get.find<StudentProtectionController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              protectionController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => protectionController.isLoadingDialogue.value
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
                            protectionController.selectImageFromStorage();
                          },
                          child: protectionController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: imageUrl == null &&
                                          protectionController
                                                  .imageDataUin8.value ==
                                              null
                                      ? const AssetImage(
                                          "assets/images/user.png")
                                      : protectionController
                                                  .imageDataUin8.value ==
                                              null
                                          ? NetworkImage(imageUrl!)
                                          : MemoryImage(
                                              protectionController
                                                  .imageDataUin8.value!,
                                            ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Name',
                        controller: protectionController.nameController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Position',
                        controller: protectionController.positionController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Designation',
                        controller: protectionController.designationController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          protectionController
                              .updateStudentProtectionMemberDetail(
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

Future<void> createDialogue(
  BuildContext context,
) {
  StudentProtectionController protectionController =
      Get.find<StudentProtectionController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              protectionController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => SizedBox(
            height: 350,
            width: 250,
            child: protectionController.isLoadingDialogue.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () async {
                            protectionController.selectImageFromStorage();
                          },
                          child: protectionController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: protectionController
                                              .imageDataUin8.value ==
                                          null
                                      ? const AssetImage(
                                          'assets/images/user.png')
                                      : MemoryImage(
                                          protectionController
                                              .imageDataUin8.value!,
                                        ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Name',
                        controller: protectionController.nameController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Position',
                        controller: protectionController.positionController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Designation',
                        controller: protectionController.designationController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          protectionController
                              .addStudentProtectionGroupMember(context);
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
