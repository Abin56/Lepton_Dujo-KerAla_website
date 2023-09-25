import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../../constant/responsive_app.dart';
import 'widgets/notice_show_udpate_button_widget.dart';
import 'widgets/notice_update_checked_box_widget.dart';
import 'widgets/notice_update_form_widget.dart';

class AdminNoticeShow extends StatelessWidget {
  AdminNoticeShow(
      {super.key,
      required this.schoolId,
      required this.adminNoticeModel,
      required this.dialoguecontext});
  final String schoolId;
  final BuildContext dialoguecontext;

  final AdminNoticeModel adminNoticeModel;

  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//image and signed image url declared as obs because create notice page button updation
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            width: ResponsiveApp.width / 3,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: adminNoticeController.isLoadingShowNotice.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                            Visibility(
                              visible: adminNoticeModel.customContent!.isEmpty,
                              child: NoticeUpdateFormWidget(),
                            ),
                            sizedBoxH20,
                            Visibility(
                              visible:
                                  adminNoticeModel.customContent!.isNotEmpty,
                              child: TextFormField(
                                maxLines: null,
                                validator: checkFieldEmpty,
                                controller: adminNoticeController
                                    .customContentController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Custom Content'.tr,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NoticeUpdateCheckedBoxWidget(),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            NoticeShowUpdateImageButtonWidget(),
                            const SizedBox(
                              height: 30,
                            ),
                            NoticeShowUpdateButtonWidget(
                              adminNoticeController: adminNoticeController,
                              formKey: formKey,
                              adminNoticeModel: adminNoticeModel,
                              schoolId: schoolId,
                              dialoguecontext: dialoguecontext,
                            ),
                          ]),
                    ),
            ),
          ),
        ),
      );
    });
  }

  void addValueToTextField() {
    adminNoticeController.publishedDateController.text =
        adminNoticeModel.publishedDate ?? "";
    adminNoticeController.headingController.text =
        adminNoticeModel.heading ?? "";
    adminNoticeController.dateOfOccasionController.text =
        adminNoticeModel.dateofoccation ?? "";
    adminNoticeController.venueController.text = adminNoticeModel.venue ?? "";
    adminNoticeController.chiefGuestController.text =
        adminNoticeModel.chiefGuest ?? "";
    adminNoticeController.dateOfSubmissionController.text =
        adminNoticeModel.dateOfSubmission ?? "";
    adminNoticeController.signedByController.text =
        adminNoticeModel.signedBy ?? "";
    adminNoticeModel.signedImageUrl ?? "";

    adminNoticeController.studentCheckBox.value =
        adminNoticeModel.visibleStudent ?? true;
    adminNoticeController.teacherCheckBox.value =
        adminNoticeModel.visibleTeacher ?? true;
    adminNoticeController.guardianCheckBox.value =
        adminNoticeModel.visibleGuardian ?? true;
    adminNoticeController.customContentController.text =
        adminNoticeModel.customContent ?? "";
  }
}

class NoticeShowUpdateButtonWidget extends StatelessWidget {
  const NoticeShowUpdateButtonWidget(
      {super.key,
      required this.adminNoticeController,
      required this.adminNoticeModel,
      required this.formKey,
      required this.schoolId,
      required this.dialoguecontext});

  final AdminNoticeController adminNoticeController;
  final AdminNoticeModel adminNoticeModel;
  final GlobalKey<FormState> formKey;
  final String schoolId;
  final BuildContext dialoguecontext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (formKey.currentState?.validate() ?? false) {
          await adminNoticeController
              .updateAdminNotice(
                adminNoticeModel: AdminNoticeModel(
                  publishedDate:
                      adminNoticeController.publishedDateController.text,
                  heading: adminNoticeController.headingController.text,
                  dateofoccation:
                      adminNoticeController.dateOfOccasionController.text,
                  venue: adminNoticeController.venueController.text,
                  chiefGuest: adminNoticeController.chiefGuestController.text,
                  dateOfSubmission:
                      adminNoticeController.dateOfSubmissionController.text,
                  signedBy: adminNoticeController.signedByController.text,
                  imageUrl: adminNoticeModel.imageUrl,
                  signedImageUrl: adminNoticeModel.signedImageUrl,
                  noticeId: adminNoticeModel.noticeId,
                  customContent:
                      adminNoticeController.customContentController.text,
                  visibleGuardian: adminNoticeController.guardianCheckBox.value,
                  visibleStudent: adminNoticeController.studentCheckBox.value,
                  visibleTeacher: adminNoticeController.teacherCheckBox.value,
                ),
                schoolId: schoolId,
                context: context,
                image: adminNoticeController.updateImageFile,
                signedImage: adminNoticeController.updateIsignImageFile,
              )
              .then(
                (value) => Navigator.of(dialoguecontext).pop(),
              );
        }
      },
      child: Container(
        height: ResponsiveApp.width * 1 / 30,
        width: ResponsiveApp.width,
        decoration: BoxDecoration(
            color: adminePrimayColor, borderRadius: BorderRadius.circular(14)),
        child: Center(
          child: Text('Update'.tr, style: const TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
