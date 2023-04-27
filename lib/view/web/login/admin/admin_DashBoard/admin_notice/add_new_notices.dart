import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/notice_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class AddNewNotices extends StatelessWidget {
  AddNewNotices({super.key, required this.schoolId});
  final String schoolId;

  AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());
  @override
  Widget build(BuildContext context) {
    adminNoticeController.clearControllers();
    var screenSize = MediaQuery.of(context).size;
     final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 27, 95, 88),
        appBar: AppBar(
            title: Text('Add New Notice'.tr), backgroundColor: adminePrimayColor),
        body: Center(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  height: screenSize.height * 1.2,
                  width: screenSize.width * 1 / 2,
                  color: adminePrimayColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ! Admin \n Create\n Notices',
                        style: ralewayStyle.copyWith(
                          fontSize: 48.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: screenSize.width / 2,
                        child: LottieBuilder.network(
                            'https://assets7.lottiefiles.com/packages/lf20_2pckVUuMz6.json'),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  return adminNoticeController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          color: Colors.white,
                          height: screenSize.height * 1.2,
                          width: screenSize.width * 1 / 2,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(children: [
                                DateTimeTextField(
                                  labelText: "Published Date",
                                  textEditingController: adminNoticeController
                                      .publishedDateController,
                                  function: () async {
                                    String result = await dateTimePicker(context);
                                    if (result.isNotEmpty) {
                                      adminNoticeController
                                          .publishedDateController.text = result;
                                    }
                                  },
                                ),
                                sizedBoxH20,
                                TextFormField(
                                  validator:checkFieldEmpty ,
                                  controller:
                                      adminNoticeController.headingController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Heading'.tr,
                                  ),
                                ),
                                sizedBoxH20,
                                DateTimeTextField(
                                  
                                  labelText: "Date of occation",
                                  textEditingController: adminNoticeController
                                      .dateOfOccasionController,
                                  function: () async {
                                    String result = await dateTimePicker(context);
                                    if (result.isNotEmpty) {
                                      adminNoticeController
                                          .dateOfOccasionController.text = result;
                                    }
                                  },
                                ),
                                sizedBoxH20,
                                TextFormField(
                                    validator:checkFieldEmpty ,
                                  controller:
                                      adminNoticeController.venueController,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Venue'.tr,
                                      labelStyle: const TextStyle(fontSize: 16)),
                                ),
                                sizedBoxH20,
                                TextFormField(
                                    validator:checkFieldEmpty ,
                                  controller:
                                      adminNoticeController.chiefGuestController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Chief Guest'.tr,
                                  ),
                                ),
                                sizedBoxH20,
                                DateTimeTextField(
                                  labelText: "Date of Submission",
                                  textEditingController: adminNoticeController
                                      .dateOfSubmissionController,
                                  function: () async {
                                    String result = await dateTimePicker(context);
                                    if (result.isNotEmpty) {
                                      adminNoticeController
                                          .dateOfSubmissionController
                                          .text = result;
                                    }
                                  },
                                ),
                                sizedBoxH20,
                                TextFormField(
                                  controller:
                                      adminNoticeController.signedByController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Signed by'.tr,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                    validator:checkFieldEmpty ,
                                  controller: adminNoticeController
                                      .customContentController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Custom Notice'.tr,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: adminNoticeController
                                                .studentCheckBox.value,
                                            onChanged: (value) {
                                              adminNoticeController
                                                  .studentCheckBox
                                                  .value = value ?? false;
                                            },
                                          ),
                                          const Text('Students')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: adminNoticeController
                                                .teacherCheckBox.value,
                                            onChanged: (value) {
                                              adminNoticeController
                                                  .teacherCheckBox
                                                  .value = value ?? false;
                                            },
                                          ),
                                          const Text('Teacher')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: adminNoticeController
                                                .guardianCheckBox.value,
                                            onChanged: (value) {
                                              adminNoticeController
                                                  .guardianCheckBox
                                                  .value = value ?? false;
                                            },
                                          ),
                                          const Text('Guardian')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                adminNoticeController.signedImageUrl.isNotEmpty
                                    ? const Text('Image Uploaded')
                                    : InkWell(
                                        onTap: () async {
                                          final result =
                                              await adminNoticeController
                                                  .photoUpload();
                                          adminNoticeController.signedImageUrl
                                              .value = result["downloadUrl"]!;
                                          adminNoticeController.signedImageId =
                                              result["imageUid"]!;
                                        },
                                        child: Container(
                                          height: screenSize.width * 1 / 40,
                                          width: screenSize.width * 1 / 4,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          child: Center(
                                              child: Text('Upload Sign'.tr)),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 30,
                                ),
                                adminNoticeController.imageUrl.isNotEmpty
                                    ? const Text('Image Uploaded')
                                    : InkWell(
                                        onTap: () async {
                                          final result =
                                              await adminNoticeController
                                                  .photoUpload();
                                          adminNoticeController.imageUrl.value =
                                              result["downloadUrl"]!;
                                          adminNoticeController.imageId =
                                              result["imageUid"]!;
                                        },
                                        child: Container(
                                          height: screenSize.width * 1 / 40,
                                          width: screenSize.width * 1 / 4,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          child: Center(
                                              child: Text('Upload Notices'.tr)),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: screenSize.width * 1 / 30,
                                  width: screenSize.width * 1 / 4,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      padding: const EdgeInsets.all(9.0),
                                      textStyle: const TextStyle(fontSize: 17),
                                    ),
                                    onPressed: () async {
                                      adminNoticeController.addAdminNotice();
                                    },
                                    child: Text('Create'.tr),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ]),
                            ),
                          ),
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateTimeTextField extends StatelessWidget {
  const DateTimeTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.function,
  
  });

  final TextEditingController textEditingController;
  final String labelText;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: TextField(
        enabled: false,
        controller: textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText.tr,
        ),
      ),
    );
  }
}
