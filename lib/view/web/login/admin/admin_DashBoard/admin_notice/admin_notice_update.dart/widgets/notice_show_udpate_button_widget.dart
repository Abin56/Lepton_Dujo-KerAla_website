import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../../utils/image_picker_helper.dart';

class NoticeShowUpdateImageButtonWidget extends StatelessWidget {
  NoticeShowUpdateImageButtonWidget({
    super.key,
  });
  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              adminNoticeController.isLoadingShowNotice.value = true;
              adminNoticeController.updateIsignImageFile =
                  await ImagePickerHelper.pickImage(context);
              adminNoticeController.isLoadingShowNotice.value = false;
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
              adminNoticeController.isLoadingShowNotice.value = true;
              adminNoticeController.updateImageFile =
                  await ImagePickerHelper.pickImage(context);
              adminNoticeController.isLoadingShowNotice.value = false;
            },
            child: Text(
              'Update image'.tr,
            ),
          ),
        ),
      ],
    );
  }
}
