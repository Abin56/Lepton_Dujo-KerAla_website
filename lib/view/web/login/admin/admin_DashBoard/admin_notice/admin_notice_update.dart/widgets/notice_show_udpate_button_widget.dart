import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../../utils/image_picker_helper.dart';
import '../../../../../../../constant/constant.dart';

class NoticeShowUpdateImageButtonWidget extends StatelessWidget {
  NoticeShowUpdateImageButtonWidget({
    super.key,
  });
  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => adminNoticeController.isLoadingShowNotice.value
          ? circularProgressIndicator
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: adminNoticeController.updateIsignImageFile == null
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            adminNoticeController.updateIsignImageFile =
                                await ImagePickerHelper.pickImage(context);
                            adminNoticeController.isLoadingShowNotice.refresh();
                          },
                          child: Text(
                            'Update sign'.tr,
                          ),
                        )
                      : const Text("Image Added"),
                ),
                Flexible(
                  child: adminNoticeController.updateImageFile == null
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            adminNoticeController.updateImageFile =
                                await ImagePickerHelper.pickImage(context);

                            adminNoticeController.isLoadingShowNotice.refresh();
                          },
                          child: Text(
                            'Update image'.tr,
                          ),
                        )
                      : const Text("Image Added"),
                ),
              ],
            ),
    );
  }
}
