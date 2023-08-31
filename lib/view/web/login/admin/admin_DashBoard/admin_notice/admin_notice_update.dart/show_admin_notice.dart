import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../../../../constant/responsive_app.dart';
import 'widgets/notice_show_udpate_button_widget.dart';
import 'widgets/notice_update_checked_box_widget.dart';
import 'widgets/notice_update_form_widget.dart';

class AdminNoticeShow extends StatefulWidget {
  const AdminNoticeShow(
      {super.key, required this.schoolId, required this.adminNoticeModel});
  final String schoolId;

  final AdminNoticeModel adminNoticeModel;

  @override
  State<AdminNoticeShow> createState() => _AdminNoticeShowState();
}

class _AdminNoticeShowState extends State<AdminNoticeShow> {
  AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    addValueToTextField();
    super.initState();
  }

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
                            NoticeUpdateFormWidget(),
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
                            const NoticeShowUpdateButtonWidget(),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final signedImageUrl =
                                    await adminNoticeController.photoUpdate(
                                        url: widget.adminNoticeModel
                                                .signedImageUrl ??
                                            "");
                                final imageUrl =
                                    await adminNoticeController.photoUpdate(
                                        url: widget.adminNoticeModel.imageUrl ??
                                            "");

                                if (context.mounted) {}
                                if (formKey.currentState?.validate() ?? false) {
                                  await adminNoticeController.updateAdminNotice(
                                      AdminNoticeModel(
                                        publishedDate: adminNoticeController
                                            .publishedDateController.text,
                                        heading: adminNoticeController
                                            .headingController.text,
                                        dateofoccation: adminNoticeController
                                            .dateOfOccasionController.text,
                                        venue: adminNoticeController
                                            .venueController.text,
                                        chiefGuest: adminNoticeController
                                            .chiefGuestController.text,
                                        dateOfSubmission: adminNoticeController
                                            .dateOfSubmissionController.text,
                                        signedBy: adminNoticeController
                                            .signedByController.text,
                                        imageUrl: imageUrl,
                                        signedImageUrl: signedImageUrl,
                                        noticeId:
                                            widget.adminNoticeModel.noticeId,
                                        customContent: adminNoticeController
                                            .subjectController.text,
                                        visibleGuardian: adminNoticeController
                                            .guardianCheckBox.value,
                                        visibleStudent: adminNoticeController
                                            .studentCheckBox.value,
                                        visibleTeacher: adminNoticeController
                                            .teacherCheckBox.value,
                                      ),
                                      widget.schoolId,
                                      context);
                                }
                              },
                              child: Container(
                                height: ResponsiveApp.width * 1 / 30,
                                width: ResponsiveApp.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Text('Update'.tr,
                                      style: const TextStyle(fontSize: 17)),
                                ),
                              ),
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
        widget.adminNoticeModel.publishedDate ?? "";
    adminNoticeController.headingController.text =
        widget.adminNoticeModel.heading ?? "";
    adminNoticeController.dateOfOccasionController.text =
        widget.adminNoticeModel.dateofoccation ?? "";
    adminNoticeController.venueController.text =
        widget.adminNoticeModel.venue ?? "";
    adminNoticeController.chiefGuestController.text =
        widget.adminNoticeModel.chiefGuest ?? "";
    adminNoticeController.dateOfSubmissionController.text =
        widget.adminNoticeModel.dateOfSubmission ?? "";
    adminNoticeController.signedByController.text =
        widget.adminNoticeModel.signedBy ?? "";
    widget.adminNoticeModel.signedImageUrl ?? "";
    adminNoticeController.studentCheckBox.value =
        widget.adminNoticeModel.visibleStudent ?? true;
    adminNoticeController.teacherCheckBox.value =
        widget.adminNoticeModel.visibleTeacher ?? true;
    adminNoticeController.guardianCheckBox.value =
        widget.adminNoticeModel.visibleGuardian ?? true;
  }
}

class NoticeUpdateButtonWidget extends StatelessWidget {
  const NoticeUpdateButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
