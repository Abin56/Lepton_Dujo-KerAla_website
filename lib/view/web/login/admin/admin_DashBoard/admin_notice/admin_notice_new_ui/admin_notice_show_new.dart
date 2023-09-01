import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_notice/admin_notice_new_ui/widgets/notice_button_widget.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_notice/admin_notice_new_ui/widgets/notice_data_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/admin_notice_controller/notice_controller.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/responsive_app.dart';
import '../admin_notice_update.dart/show_admin_notice.dart';
import 'widgets/notice_gridview_widget.dart';

class NoticeDisplay extends StatelessWidget {
  NoticeDisplay({
    super.key,
    required this.schoolId,
  });
  final String schoolId;
  final AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        adminNoticeController.clearControllers();
        return Future(() => true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Notice List"),
            backgroundColor: adminePrimayColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: cWhite),
          ),
          body: SafeArea(
            child: Row(
              children: [
                Obx(() {
                  return adminNoticeController.adminNoticeModelData.value ==
                          null
                      ? SizedBox(
                          width: ResponsiveApp.width * 0.4,
                          height: ResponsiveApp.width,
                          child: Image.asset(
                            'assets/images/notice.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      : adminNoticeController.isLoading.value
                          ? SizedBox(
                              width: ResponsiveApp.width * 0.4,
                              height: ResponsiveApp.width,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(
                              decoration: const BoxDecoration(),
                              width: ResponsiveApp.width * 0.4,
                              child: Padding(
                                padding: EdgeInsets.only(left: 60.w, right: 60),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    SizedBox(
                                      width: ResponsiveApp.width * 0.3,
                                      height: ResponsiveApp.width * .20,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            adminNoticeController
                                                    .adminNoticeModelData
                                                    .value!
                                                    .imageUrl ??
                                                "",
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Center(
                                                child: Text(
                                                  'Image not found',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    DataTableWidget(
                                      adminNoticeModel: adminNoticeController
                                          .adminNoticeModelData.value!,
                                    ),
                                    if (adminNoticeController
                                            .adminNoticeModelData.value ==
                                        null)
                                      const SizedBox()
                                    else
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child:
                                                NoticePageElevatedButtonWidget(
                                                    title: 'Edit',
                                                    function: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            icon: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    CloseButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                )),
                                                            content: AdminNoticeShow(
                                                                schoolId:
                                                                    schoolId,
                                                                adminNoticeModel:
                                                                    adminNoticeController
                                                                        .adminNoticeModelData
                                                                        .value!)
                                                              ..addValueToTextField(), //add value to text field called for assigning value to text field
                                                          );
                                                        },
                                                      );
                                                    }),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child:
                                                NoticePageElevatedButtonWidget(
                                              title: 'Remove',
                                              function: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Confirm Remove'),
                                                      content: const Text(
                                                          'Are you sure you want to remove this notice'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            if (adminNoticeController
                                                                    .adminNoticeModelData
                                                                    .value !=
                                                                null) {
                                                              await adminNoticeController.removeNotice(
                                                                  context:
                                                                      context,
                                                                  adminNoticeModel:
                                                                      adminNoticeController
                                                                          .adminNoticeModelData
                                                                          .value!);
                                                            }
                                                          },
                                                          child: const Text(
                                                              'Remove'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            );
                }),
                NoticeGridViewWidget(),
              ],
            ),
          )),
    );
  }
}
