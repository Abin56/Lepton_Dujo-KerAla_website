import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';

class NoticeUpdateCheckedBoxWidget extends StatelessWidget {
  NoticeUpdateCheckedBoxWidget({
    super.key,
  });
  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: [
            Checkbox(
              value: adminNoticeController.studentCheckBox.value,
              onChanged: (value) {
                adminNoticeController.studentCheckBox.value = value ?? false;
              },
            ),
            const Text('Students')
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: adminNoticeController.teacherCheckBox.value,
              onChanged: (value) {
                adminNoticeController.teacherCheckBox.value = value ?? false;
              },
            ),
            const Text('Teachers')
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: adminNoticeController.guardianCheckBox.value,
              onChanged: (value) {
                adminNoticeController.guardianCheckBox.value = value ?? false;
              },
            ),
            const Text('Parents')
          ],
        ),
      ],
    );
  }
}
