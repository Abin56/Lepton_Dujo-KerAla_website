import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/widgets/student_protection_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import '../../../../../../constant/constant.dart';

showDialogueStudentProtection(BuildContext context, String editOrCreate,
    VoidCallback function, String memberId, String imageid, String imageUrl) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => Get.find<StudentProtectionController>().isLoadingDialogue.value
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
                            if (editOrCreate == "Create") {
                              await Get.find<StudentProtectionController>()
                                  .upLoadImage();
                            } else {
                              await Get.find<StudentProtectionController>()
                                  .updateImage(memberId, imageid);
                            }
                          },
                          //application run first time image will be null so added these three conditions
                          child: Get.find<StudentProtectionController>()
                                  .isLoadingImage
                                  .value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      Get.find<StudentProtectionController>()
                                                      .imageData['imageUrl'] ==
                                                  null &&
                                              imageUrl.isEmpty
                                          ? const AssetImage(
                                              'assets/images/user.png')
                                          : NetworkImage(Get.find<
                                                      StudentProtectionController>()
                                                  .imageData['imageUrl'] ??
                                              imageUrl) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Name',
                        controller: Get.find<StudentProtectionController>()
                            .nameController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Position',
                        controller: Get.find<StudentProtectionController>()
                            .positionController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Designation',
                        controller: Get.find<StudentProtectionController>()
                            .designationController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: function,
                        child: Text(editOrCreate),
                      )
                    ],
                  ),
                ),
        ),
      );
    },
  );
}
