import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../../utils/utils.dart';
import '../../../../../../../constant/constant.dart';

class NoticeUpdateFormWidget extends StatelessWidget {
  NoticeUpdateFormWidget({
    super.key,
  });
  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          readOnly: true,
          onTap: () async => adminNoticeController
              .publishedDateController.text = await dateTimePicker(context),
          validator: checkFieldEmpty,
          controller: adminNoticeController.publishedDateController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Published date'.tr,
          ),
        ),
        sizedBoxH20,
        TextFormField(
          validator: checkFieldEmpty,
          controller: adminNoticeController.headingController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Heading'.tr,
          ),
        ),
        sizedBoxH20,
        TextFormField(
          readOnly: true,
          onTap: () async => adminNoticeController
              .dateOfOccasionController.text = await dateTimePicker(context),
          validator: checkFieldEmpty,
          controller: adminNoticeController.dateOfOccasionController,
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
              labelStyle: const TextStyle(color: Colors.black, fontSize: 16)),
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
        TextFormField(
          readOnly: true,
          onTap: () async => adminNoticeController
              .dateOfOccasionController.text = await dateTimePicker(context),
          validator: checkFieldEmpty,
          controller: adminNoticeController.dateOfSubmissionController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Date of submission'.tr,
          ),
        ),
        sizedBoxH20,
        TextFormField(
          validator: checkFieldEmpty,
          controller: adminNoticeController.signedByController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Signed by'.tr,
          ),
        ),
      ],
    );
  }
}
