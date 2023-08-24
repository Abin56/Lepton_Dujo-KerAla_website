import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_notice/widgets/secondary_create_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/notice_controller.dart';
import '../../../../../../colors/colors.dart';

class AllButtonsWidget extends StatelessWidget {
  const AllButtonsWidget({
    super.key,
    required this.adminNoticeController,
    required this.screenSize,
  });

  final AdminNoticeController adminNoticeController;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        adminNoticeController.signedImageUrl.isNotEmpty
            ? const Text('Image uploaded')
            : InkWell(
                onTap: () async {
                  final result = await adminNoticeController.photoUpload();
                  adminNoticeController.signedImageUrl.value =
                      result["downloadUrl"]!;
                  adminNoticeController.signedImageId = result["imageUid"]!;
                },
                child: SecondaryCreateButtonWidget(
                  screenSize: screenSize,
                  text: 'Upload sign'.tr,
                )),
        const SizedBox(
          height: 30,
        ),
        adminNoticeController.imageUrl.isNotEmpty
            ? const Text('Image uploaded')
            : InkWell(
                onTap: () async {
                  final result = await adminNoticeController.photoUpload();
                  adminNoticeController.imageUrl.value = result["downloadUrl"]!;
                  adminNoticeController.imageId = result["imageUid"]!;
                },
                child: SecondaryCreateButtonWidget(
                    screenSize: screenSize, text: 'Upload notice'.tr),
              ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: screenSize.width * 1 / 30,
          width: screenSize.width * 1 / 5,
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
              adminNoticeController.addAdminNotice();
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
