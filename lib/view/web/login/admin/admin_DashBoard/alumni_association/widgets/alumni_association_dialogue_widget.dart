import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/widgets/student_protection_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/alumni_association_controller/alumni_association_controller.dart';
import '../../../../../../constant/constant.dart';

Future<void> updateAlumniDialogue(
  BuildContext context,
  String memberId,
  String imageid,
  String imageUrl,
) {
  AlumniController alumniController = Get.put(AlumniController());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              alumniController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => alumniController.isLoadingDialogue.value
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
                            alumniController.selectImageFromStorage();
                          },
                          child: alumniController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: imageUrl.isEmpty &&
                                          alumniController
                                                  .imageDataUin8.value ==
                                              null
                                      ? const AssetImage(
                                          "assets/images/user.png")
                                      : alumniController.imageDataUin8.value ==
                                              null
                                          ? NetworkImage(imageUrl)
                                          : MemoryImage(
                                              alumniController
                                                  .imageDataUin8.value!,
                                            ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Name',
                        controller: alumniController.nameController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Designation',
                        controller: alumniController.designationController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Position',
                        controller: alumniController.positionController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          alumniController.updateAlumniDetails(
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

Future<void> alumniCreateDialogue(
  BuildContext context,
) {
  AlumniController alumniController = Get.find<AlumniController>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
              alumniController.clearField();
            },
            icon: const Icon(Icons.close)),
        content: Obx(
          () => SizedBox(
            height: 350,
            width: 250,
            child: alumniController.isLoadingDialogue.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () async {
                            alumniController.selectImageFromStorage();
                          },
                          child: alumniController.isLoadingImage.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CircleAvatar(
                                  backgroundImage: alumniController
                                              .imageDataUin8.value ==
                                          null
                                      ? const AssetImage(
                                          'assets/images/user.png')
                                      : MemoryImage(
                                          alumniController.imageDataUin8.value!,
                                        ) as ImageProvider,
                                  radius: 30,
                                )),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Name',
                        controller: alumniController.nameController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Designation',
                        controller: alumniController.designationController,
                      ),
                      sizedBoxH20,
                      StudentProtectionTextField(
                        hintText: 'Position',
                        controller: alumniController.positionController,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () {
                          alumniController.addAlumniMember(context);
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
