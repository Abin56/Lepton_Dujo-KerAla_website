import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/notice_controller.dart';

class AllCheckedBoxWidget extends StatelessWidget {
  AllCheckedBoxWidget({
    super.key,
  });

  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      value: adminNoticeController.studentCheckBox.value,
                      onChanged: (value) {
                        adminNoticeController.studentCheckBox.value =
                            value ?? false;
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
                        adminNoticeController.teacherCheckBox.value =
                            value ?? false;
                      },
                    ),
                    const Text('Teacher')
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: adminNoticeController.guardianCheckBox.value,
                      onChanged: (value) {
                        adminNoticeController.guardianCheckBox.value =
                            value ?? false;
                      },
                    ),
                    const Text('Parents')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
