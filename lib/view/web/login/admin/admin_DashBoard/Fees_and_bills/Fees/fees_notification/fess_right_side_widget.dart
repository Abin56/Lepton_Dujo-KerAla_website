import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/Fees_and_bills/Fees/fees_notification/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_bills_controller.dart';
import '../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../constant/constant.dart';
import '../fees_satus/bills_creation.dart';

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
                  feesBillsController.selectedCategory = data ?? {};
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
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: feesBillsController.isSpecificClassOnly.value,
                        onChanged: (value) {
                          if (value != null) {
                            feesBillsController.isSpecificClassOnly.value =
                                value;
                            if (!value) {
                              feesBillsController.selectedClass = null;
                            }
                          }
                        },
                      ),
                      const Text("Specific Class Only")
                    ],
                  )),
              sizedBoxH20,
              Obx(
                () => Visibility(
                  visible: feesBillsController.isSpecificClassOnly.value,
                  child: DropdownSearch<ClassModel>(
                    items: feesBillsController.allClass,
                    itemAsString: (ClassModel u) => u.className,
                    onChanged: (ClassModel? data) =>
                        feesBillsController.selectedClass = data,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Class",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                function: checkFieldEmpty,
                textEditingController: feesBillsController.amountController,
                labelText: 'Amount',
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                textEditingController: feesBillsController.dueDateController,
                onTap: () async => feesBillsController.dueDateController.text =
                    await dateTimePicker(context),
                function: checkFieldEmpty,
                labelText: 'Due date',
              ),
              sizedBoxH20,
              GestureDetector(
                  onTap: () async {
                    await createFunction();
                  },
                  child: Obx(
                    () => feesBillsController.categoryCreateloading.value
                        ? circularProgressIndicator
                        : const SubmitButtonWidget(
                            text: 'Create',
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  List<String> getPeriodList(String categoryName) {
    if (categoryName == feesBillsController.typeOfCategoryList[0]) {
      return feesBillsController.monthly;
    } else if (categoryName == feesBillsController.typeOfCategoryList[1]) {
      return feesBillsController.quarterly;
    } else if (categoryName == feesBillsController.typeOfCategoryList[2]) {
      return feesBillsController.halfYearly;
    } else if (categoryName == feesBillsController.typeOfCategoryList[3]) {
      return ["Annually"];
    } else {
      return [];
    }
  }

  Future<void> createFunction() async {
    if (feesBillsController.selectedCategory["id"] == "" ||
        feesBillsController.selectedCategory["categoryName"] == "" ||
        feesBillsController.selectedCategory["type"] == "") {
      return showToast(msg: "All Fields are mandatory");
    }
    if (_formKey.currentState?.validate() ?? false) {
      if (feesBillsController.selectedClass == null) {
        await feesBillsController.createFeesForAllClass(
          feesBillsController.selectedCategory["id"],
          feesBillsController.selectedCategory["categoryName"],
          feesBillsController.amountController.text,
          feesBillsController.dueDateController.text,
          feesBillsController.selectedCategory["type"],
        );
      } else {
        await feesBillsController.createFeesForSpecificClass(
            feesBillsController.selectedCategory["id"],
            feesBillsController.selectedCategory["categoryName"],
            feesBillsController.amountController.text,
            feesBillsController.dueDateController.text,
            feesBillsController.selectedCategory["type"],
            feesBillsController.selectedClass!);
      }
    }
  }
}
