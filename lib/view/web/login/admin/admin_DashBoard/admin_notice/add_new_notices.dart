import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 27, 95, 88),
        // appBar: AppBar(
        //  //     title: Text('Add New Notice'.tr), backgroundColor: adminePrimayColor),
        body: Center(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  height: screenSize.height * 1.2,
                  width: screenSize.width * 1 / 2,
                  color: adminePrimayColor,
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
                            sizedBoxH40,
                            Text(
                              'Hi ! Admin',
                              style: ralewayStyle.copyWith(
                                fontSize: 45.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            sizedBoxH20,
                            Text(
                              'Create Notices',
                              style: ralewayStyle.copyWith(
                                fontSize: 30.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 300.h,
                              width: screenSize.width / 2,
                              child: LottieBuilder.network(
                                  'https://assets7.lottiefiles.com/packages/lf20_2pckVUuMz6.json'),
                            )
                          ],
                        ),
                      ),
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
                                  labelText: "Published date",
                                  textEditingController: adminNoticeController
                                      .publishedDateController,
                                  function: () async {
                                    String result =
                                        await dateTimePicker(context);
                                    if (result.isNotEmpty) {
                                      adminNoticeController
                                          .publishedDateController
                                          .text = result;
                                    }
                                  },
                                ),
                                sizedBoxH20,
                                TextFormField(
                                  validator: checkFieldEmpty,
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
                                    String result =
                                        await dateTimePicker(context);
                                    if (result.isNotEmpty) {
                                      adminNoticeController
                                          .dateOfOccasionController
                                          .text = result;
                                    }
                                  },
                                ),
                                sizedBoxH20,
                                TextFormField(
                                  validator: checkFieldEmpty,
                                  controller:
                                      adminNoticeController.venueController,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Venue'.tr,
                                      labelStyle:
                                          const TextStyle(fontSize: 16)),
                                ),
                                sizedBoxH20,
                                TextFormField(
                                  validator: checkFieldEmpty,
                                  controller: adminNoticeController
                                      .chiefGuestController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Chief guest'.tr,
                                  ),
                                ),
                                sizedBoxH20,
                                DateTimeTextField(
                                  labelText: "Date of submission",
                                  textEditingController: adminNoticeController
                                      .dateOfSubmissionController,
                                  function: () async {
                                    String result =
                                        await dateTimePicker(context);
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
                                  validator: checkFieldEmpty,
                                  controller: adminNoticeController
                                      .customContentController,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Custom notice'.tr,
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
                                    ? const Text('Image uploaded')
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
                                        child: SecondaryCreateButtonWidget(
                                          screenSize: screenSize,
                                          text: 'Upload sign'.tr,
                                        )),
                                const SizedBox(
                                  height: 30,
                                ),
                                adminNoticeController.imageUrl.isNotEmpty
                                    ? const Text('Image uploaded')
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
                                        child: SecondaryCreateButtonWidget(
                                            screenSize: screenSize,
                                            text: 'Upload notice'.tr),
                                      ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: screenSize.width * 1 / 30,
                                  width: screenSize.width * 1 / 5,
                                  decoration: BoxDecoration(
                                      color: adminePrimayColor,
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

class SecondaryCreateButtonWidget extends StatelessWidget {
  const SecondaryCreateButtonWidget({
    required this.text,
    super.key,
    required this.screenSize,
  });

  final Size screenSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.width * 1 / 40,
      width: screenSize.width * 1 / 5,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(14)),
      child: Center(child: Text(text)),
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
