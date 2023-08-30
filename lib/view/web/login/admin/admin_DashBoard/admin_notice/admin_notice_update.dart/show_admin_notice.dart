import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../../../../../utils/utils.dart';
import '../../../../../../constant/constant.dart';

class AdminNoticeShow extends StatefulWidget {
  const AdminNoticeShow(
      {super.key, required this.schoolId, required this.adminNoticeModel});
  final String schoolId;

  final AdminNoticeModel adminNoticeModel;

  @override
  State<AdminNoticeShow> createState() => _AdminNoticeShowState();
}

class _AdminNoticeShowState extends State<AdminNoticeShow> {
  int _selectedContainerIndex = 0;
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
    var screenSize = MediaQuery.of(context).size;
    return Obx(() {
      return SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            width: screenSize.width / 3,
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
                            TextFormField(
                              readOnly: true,
                              onTap: () async => adminNoticeController
                                  .publishedDateController
                                  .text = await dateTimePicker(context),
                              validator: checkFieldEmpty,
                              controller:
                                  adminNoticeController.publishedDateController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Published date'.tr,
                              ),
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
                            TextFormField(
                              readOnly: true,
                              onTap: () async => adminNoticeController
                                  .dateOfOccasionController
                                  .text = await dateTimePicker(context),
                              validator: checkFieldEmpty,
                              controller: adminNoticeController
                                  .dateOfOccasionController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Date of occation'.tr,
                              ),
                            ),
                            sizedBoxH20,
                            TextFormField(
                              controller: adminNoticeController.venueController,
                              validator: checkFieldEmpty,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Venue'.tr,
                                  labelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 16)),
                            ),
                            sizedBoxH20,
                            TextFormField(
                              validator: checkFieldEmpty,
                              controller:
                                  adminNoticeController.chiefGuestController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Chief guest'.tr,
                              ),
                            ),
                            sizedBoxH20,
                            TextFormField(
                              readOnly: true,
                              onTap: () async => adminNoticeController
                                  .dateOfOccasionController
                                  .text = await dateTimePicker(context),
                              validator: checkFieldEmpty,
                              controller: adminNoticeController
                                  .dateOfSubmissionController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Date of submission'.tr,
                              ),
                            ),
                            sizedBoxH20,
                            TextFormField(
                              validator: checkFieldEmpty,
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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: adminNoticeController
                                            .studentCheckBox.value,
                                        onChanged: (value) {
                                          adminNoticeController.studentCheckBox
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
                                          adminNoticeController.teacherCheckBox
                                              .value = value ?? false;
                                        },
                                      ),
                                      const Text('Teachers')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: adminNoticeController
                                            .guardianCheckBox.value,
                                        onChanged: (value) {
                                          adminNoticeController.guardianCheckBox
                                              .value = value ?? false;
                                        },
                                      ),
                                      const Text('Parents')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () async {
                                      final data = await adminNoticeController
                                          .photoUpdate(
                                              uid: widget.adminNoticeModel
                                                      .signedImageId ??
                                                  "");
                                      if (data.isNotEmpty) {
                                        adminNoticeController
                                            .signedImageUrl.value = data;
                                      }
                                    },
                                    child: Text(
                                      'Update sign'.tr,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () async {
                                      final data = await adminNoticeController
                                          .photoUpdate(
                                        uid: widget.adminNoticeModel
                                                .signedImageId ??
                                            "",
                                      );
                                      if (data.isNotEmpty) {
                                        adminNoticeController.imageUrl.value =
                                            data;
                                      }
                                    },
                                    child: Text(
                                      'Update image'.tr,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () async {
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
                                        imageUrl: adminNoticeController
                                            .imageUrl.value,
                                        signedImageUrl: adminNoticeController
                                            .signedImageUrl.value,
                                        imageId:
                                            widget.adminNoticeModel.imageId,
                                        signedImageId: widget
                                            .adminNoticeModel.signedImageId,
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

                                setState(() {
                                  _selectedContainerIndex = 0;
                                });
                              },
                              child: Container(
                                height: screenSize.width * 1 / 30,
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: _selectedContainerIndex == 0
                                        ? Colors.blue
                                        : Colors.grey,
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
    adminNoticeController.imageId = widget.adminNoticeModel.imageId ?? "";
    adminNoticeController.imageUrl.value =
        widget.adminNoticeModel.imageUrl ?? "";
    adminNoticeController.signedImageId =
        widget.adminNoticeModel.signedImageId ?? "";
    adminNoticeController.signedImageUrl.value =
        widget.adminNoticeModel.signedImageUrl ?? "";
    adminNoticeController.studentCheckBox.value =
        widget.adminNoticeModel.visibleStudent ?? true;
    adminNoticeController.teacherCheckBox.value =
        widget.adminNoticeModel.visibleTeacher ?? true;
    adminNoticeController.guardianCheckBox.value =
        widget.adminNoticeModel.visibleGuardian ?? true;
  }
}
