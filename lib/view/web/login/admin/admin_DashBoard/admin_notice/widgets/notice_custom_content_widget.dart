import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
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
                  adminNoticeController.clearControllers();
                },
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Custom Content  '),
                    TextSpan(
                      text:
                          '(If you select this, then other fields will be disabled.)',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          sizedBoxH10,
          Visibility(
            visible: adminNoticeController.customContentCheckBox.value,
            child: TextFormField(
              maxLines: null,
              controller: adminNoticeController.customContentController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Custom Content'.tr,
              ),
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
