import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import 'fees_notification/Fees_notification.dart';
import 'fees_satus/bills_creation.dart';
import 'fees_satus/classWise/fees_class_status.dart';
import 'fees_satus/schoolWise/fees_status.dart';

class FeesAndBillsWeb extends StatelessWidget {
  const FeesAndBillsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: cBlack),
          title: Row(
            children: [
              //  IconButtonBackWidget(color: cBlack),
              SizedBox(
                width: 20.w,
              ),
              GoogleMonstserratWidgets(text: "Fees".tr.tr, fontsize: 15.w),
            ],
          ),
          backgroundColor: cWhite,
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.red,
              tabs: [
                Tab(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FeeAndBillsConWidget(
                        text: 'Fees Notifications'.tr,
                      )),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FeeAndBillsConWidget(
                      text: 'Fees Status'.tr,
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FeeAndBillsConWidget(text: 'Bills'.tr),
                  ),
                ),
              ]),
        ),

        //  appBar: AppBar(backgroundColor: adminePrimayColor),
        body: SafeArea(
          child: TabBarView(
            children: [
              FeesNotification(),
              FeesClassStatus(),
              BillsCreationalPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeeAndBillsConWidget extends StatelessWidget {
  const FeeAndBillsConWidget({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        width: 200.w,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          color: cBlue,
        ),
        child: Center(
          child: GoogleMonstserratWidgets(
            text: text,
            fontsize: 15.w,
            color: cWhite,
          ),
        ));
  }
}
