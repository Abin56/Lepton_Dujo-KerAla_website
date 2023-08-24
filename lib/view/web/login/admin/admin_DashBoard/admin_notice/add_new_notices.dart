import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/notice_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';
import 'widgets/notice_all_button_widget.dart';
import 'widgets/notice_allformfield_widget.dart';
import 'widgets/notice_checked_box_widget.dart';
import 'widgets/notice_custom_content_widget.dart';

class AddNewNotices extends StatelessWidget {
  AddNewNotices({super.key, required this.schoolId});
  final String schoolId;

  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());
  @override
  Widget build(BuildContext context) {
    adminNoticeController.clearControllers();
    var screenSize = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  height: screenSize.height * 1.2,
                  width: screenSize.width * 1 / 2,
                  color: adminePrimayColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButtonBackWidget(color: cWhite),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sizedBoxH40,
                            Text(
                              'Hi ! Admin',
                              style: ralewayStyle.copyWith(
                                fontSize: 45.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            sizedBoxH20,
                            Text(
                              'Create Notices',
                              style: ralewayStyle.copyWith(
                                fontSize: 30.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 300.h,
                              width: screenSize.width / 2,
                              child: LottieBuilder.network(
                                  'https://assets7.lottiefiles.com/packages/lf20_2pckVUuMz6.json'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return adminNoticeController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          color: Colors.white,
                          height: screenSize.height * 1.2,
                          width: screenSize.width * 1 / 2,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(children: [
                                NoticeFormFieldsWidget(
                                    adminNoticeController:
                                        adminNoticeController),
                                CustomContentWidget(),
                                AllCheckedBoxWidget(),
                                const SizedBox(
                                  height: 30,
                                ),
                                AllButtonsWidget(
                                    adminNoticeController:
                                        adminNoticeController,
                                    screenSize: screenSize),
                              ]),
                            ),
                          ),
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
