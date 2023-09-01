import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../utils/utils.dart';
import '../../../../../../constant/constant.dart';
import 'date_time_textfield_widget.dart';

class NoticeFormFieldsWidget extends StatelessWidget {
  const NoticeFormFieldsWidget({
    super.key,
    required this.adminNoticeController,
  });

  final AdminNoticeController adminNoticeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateTimeTextField(
          labelText: "Published date",
          textEditingController: adminNoticeController.publishedDateController,
          function: () async {
            String result = await dateTimePicker(context);
            if (result.isNotEmpty) {
              adminNoticeController.publishedDateController.text = result;
            }
          },
        ),
        sizedBoxH20,
        
        TextFormField(
          validator: checkFieldEmpty,
          controller: adminNoticeController.subjectController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Subject'.tr,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        DateTimeTextField(
          labelText: "Date of occation",
          textEditingController: adminNoticeController.dateOfOccasionController,
          function: () async {
            String result = await dateTimePicker(context);
            if (result.isNotEmpty) {
              adminNoticeController.dateOfOccasionController.text = result;
            }
          },
        ),
        sizedBoxH20,
        TextFormField(
          validator: checkFieldEmpty,
          controller: adminNoticeController.venueController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Venue'.tr,
              labelStyle: const TextStyle(fontSize: 16)),
        ),
        sizedBoxH20,
        TextFormField(
          validator: checkFieldEmpty,
          controller: adminNoticeController.chiefGuestController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Chief guest'.tr,
          ),
        ),
        sizedBoxH20,
        DateTimeTextField(
          labelText: "Date of submission",
          textEditingController:
              adminNoticeController.dateOfSubmissionController,
          function: () async {
            String result = await dateTimePicker(context);
            if (result.isNotEmpty) {
              adminNoticeController.dateOfSubmissionController.text = result;
            }
          },
        ),
        sizedBoxH20,
        TextFormField(
          controller: adminNoticeController.signedByController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Signed by'.tr,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
