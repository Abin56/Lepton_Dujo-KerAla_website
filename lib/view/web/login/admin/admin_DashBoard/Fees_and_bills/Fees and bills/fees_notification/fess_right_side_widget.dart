import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/Fees_and_bills/Fees%20and%20bills/fees_notification/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_bills_controller.dart';
import '../../../../../../../colors/colors.dart';
import '../../../../../../../constant/constant.dart';
import '../bills_creation.dart';

class FeesNotificationRightSideWidget extends StatelessWidget {
  FeesNotificationRightSideWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  FeesBillsController feesBillsController = Get.put(FeesBillsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(15.0.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownSearch<Map<String, dynamic>>(
                asyncItems: (text) => feesBillsController.fetchCategoryList(),
                itemAsString: (item) => item["categoryName"],
                onChanged: (Map<String, dynamic>? data) {
                  feesBillsController.selectedType.value = data?["type"];
                  feesBillsController.selectDateList.value =
                      getPeriodList(data?["type"]);
                  feesBillsController.selectDateList.refresh;
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Select Category",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              sizedBoxH20,
              Obx(() => feesBillsController.selectDateList.isEmpty
                  ? sizedBoxH10
                  : DropdownSearch<String>(
                      items: feesBillsController.selectDateList,
                      itemAsString: (String u) => u,
                      onChanged: (String? data) =>
                          feesBillsController.selectedPeriod = data ?? "",
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Select Date",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )),
              sizedBoxH20,
              const TextFormFieldFWidget(
                function: checkFieldEmpty,
                labelText: 'Amount',
              ),
              sizedBoxH20,
              const TextFormFieldFWidget(
                function: checkFieldEmpty,
                labelText: 'Due date',
              ),
              sizedBoxH20,
              GestureDetector(
                onTap: () {
                  _formKey.currentState?.validate() ?? false;
                },
                child: const SubmitButtonWidget(
                  text: 'Create',
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: cWhite,
                  size: 25.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> getPeriodList(String categoryName) {
    if (categoryName == feesBillsController.selectionList[0]) {
      return feesBillsController.monthly;
    } else if (categoryName == feesBillsController.selectionList[1]) {
      return feesBillsController.quarterly;
    } else if (categoryName == feesBillsController.selectionList[2]) {
      return feesBillsController.halfYearly;
    } else if (categoryName == feesBillsController.selectionList[3]) {
      return ["Annually"];
    } else {
      return ["hello allll"];
    }
  }
}
