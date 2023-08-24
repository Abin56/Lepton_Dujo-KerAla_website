import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/notice_controller.dart';
import '../../../../../../constant/constant.dart';

class CustomContentWidget extends StatelessWidget {
  CustomContentWidget({
    super.key,
  });

  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: adminNoticeController.customContentCheckBox.value,
                onChanged: (value) {
                  adminNoticeController.customContentCheckBox.value =
                      value ?? false;
                },
              ),
              const Text('Custom Content')
            ],
          ),
          sizedBoxH10,
          TextFormField(
            controller: adminNoticeController.customContentController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Custom Content'.tr,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
