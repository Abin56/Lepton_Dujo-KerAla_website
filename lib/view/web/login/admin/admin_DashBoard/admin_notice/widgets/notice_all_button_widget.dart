import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_notice/widgets/secondary_create_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_notification.dart';
import '../../../../../../../utils/image_picker_helper.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/responsive_app.dart';

class AllButtonsWidget extends StatelessWidget {
  AllButtonsWidget({
    super.key,
  });

  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());
  final AdminNoticeNotification adminNoticeNotification =
      Get.put(AdminNoticeNotification());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        adminNoticeController.signImageFile != null
            ? const Text('Image uploaded')
            : InkWell(
                onTap: () async {
                  adminNoticeController.isLoading.value = true;
                  adminNoticeController.signImageFile =
                      await ImagePickerHelper.pickImage(context);
                  adminNoticeController.isLoading.value = false;
                },
                child: SecondaryCreateButtonWidget(
                  screenSize: ResponsiveApp.size,
                  text: 'Upload sign'.tr,
                )),
        const SizedBox(
          height: 30,
        ),
        adminNoticeController.imageFile != null
            ? const Text('Image uploaded')
            : InkWell(
                onTap: () async {
                  adminNoticeController.isLoading.value = true;
                  adminNoticeController.imageFile =
                      await ImagePickerHelper.pickImage(context);
                  adminNoticeController.isLoading.value = false;
                },
                child: SecondaryCreateButtonWidget(
                    screenSize: ResponsiveApp.size, text: 'Upload notice'.tr),
              ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: ResponsiveApp.width * 1 / 30,
          width: ResponsiveApp.width * 1 / 5,
          decoration: BoxDecoration(
              color: adminePrimayColor,
              borderRadius: BorderRadius.circular(14)),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.all(9.0),
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () async {
              await adminNoticeController.createNewAdminNotice();
              //todo: uncomment this function
              //await adminNoticeNotification.sendNoticeNotification();
            },
            child: Text('Create'.tr),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
