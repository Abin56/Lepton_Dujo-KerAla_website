import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../constant/responsive_app.dart';
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
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  height: ResponsiveApp.height * 1.2,
                  width: ResponsiveApp.width * 1 / 2,
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
                              width: ResponsiveApp.width / 2,
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
                  if (adminNoticeController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      color: Colors.white,
                      height: ResponsiveApp.height * 1.2,
                      width: ResponsiveApp.width * 1 / 2,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(children: [
                            CustomContentWidget(),
                            Visibility(
                              visible: !adminNoticeController
                                  .customContentCheckBox.value,
                              child: NoticeFormFieldsWidget(
                                  adminNoticeController: adminNoticeController),
                            ),
                            AllCheckedBoxWidget(),
                            const SizedBox(
                              height: 30,
                            ),
                            AllButtonsWidget(),
                          ]),
                        ),
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
