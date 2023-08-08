import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/fees_bills/fees_class_controller.dart';
import '../../../../../../../controller/fees_bills/fees_create_controller.dart';
import '../../../../../../../controller/fees_bills/fees_school_show_controller.dart';
import 'fees_create/fees_create_page.dart';
import 'fees_status/bills_creation.dart';
import 'fees_status/classWise/fees_show_class_page.dart';
import 'fees_status/schoolWise/fees_show_school_page.dart';

class FeesAndBillsWeb extends StatelessWidget {
  const FeesAndBillsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: WillPopScope(
        onWillPop: () async{
          Get.put(FeesClassController()).clearAllFields();
          Get.put(FeesSchoolController()).clearAllFields();
          Get.put(BillsCreationalPage()).clearAllFields();
          Get.put(FeesCreateController()).clearTextFields();
          
         

          return Future.value(true);
        },
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
                        text: 'Fees Create'.tr,
                      ),
                    ),
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
                      child: FeeAndBillsConWidget(
                        text: 'Class Fees Status'.tr,
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
                FeesCreatePage(),
                const FeesSchoolShowPage(),
                const FeesClassShowPage(),
                BillsCreationalPage(),
              ],
            ),
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
