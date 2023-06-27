import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/model/fees_bills_model/fees_category_model.dart';
import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/Fees_and_bills/Fees/fees_notification/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_bills_controller.dart';
import '../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../../model/fees_bills_model/fees_subcategory_model.dart';
import '../../../../../../../constant/constant.dart';
import '../fees_satus/bills_creation.dart';

class FeesNotificationRightSideWidget extends StatelessWidget {
  FeesNotificationRightSideWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  final FeesBillsController feesBillsController =
      Get.put(FeesBillsController());

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
              DropdownSearch<FeesCategoryModel>(
                asyncItems: (text) => feesBillsController.fetchCategoryList(),
                itemAsString: (FeesCategoryModel item) => item.categoryName,
                onChanged: (FeesCategoryModel? data) {
                  feesBillsController.selectedMainCategory = data;
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Select Category",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              sizedBoxH20,
              DropdownSearch<FeesSubCategoryModel>(
                asyncItems: (items) => feesBillsController.fetchSubCategoryList(
                  feesBillsController.selectedMainCategory?.id ?? "",
                ),
                itemAsString: (FeesSubCategoryModel u) => u.date,
                onChanged: (FeesSubCategoryModel? data) =>
                    feesBillsController.selectedSubCategory = data,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Select Date",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
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
                    //await createFunction();
                  },
                  child: Obx(
                    //Todo need to change loading
                    () => feesBillsController.categoryFetchloading.value
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

  // Future<void> createFunction() async {
  //   if (feesBillsController.selectedCategory["id"] == "" ||
  //       feesBillsController.selectedCategory["categoryName"] == "" ||
  //       feesBillsController.selectedCategory["type"] == "" ||
  //       feesBillsController.selectedPeriod.isEmpty) {
  //     return showToast(msg: "All Fields are mandatory");
  //   }
  //   if (_formKey.currentState?.validate() ?? false) {
  //     if (feesBillsController.selectedClass == null) {
  //       await feesBillsController.createFeesForAllClass(
  //           categoryId: feesBillsController.selectedCategory["id"],
  //           categoryName: feesBillsController.selectedCategory["categoryName"],
  //           amount: feesBillsController.amountController.text,
  //           dueDate: feesBillsController.dueDateController.text,
  //           type: feesBillsController.selectedCategory["type"],
  //           datePeriod: feesBillsController.selectedPeriod,
  //           subCategory: );
  //     } else {
  //       await feesBillsController.createFeesForSpecificClass(
  //           feesBillsController.selectedCategory["id"],
  //           feesBillsController.selectedCategory["categoryName"],
  //           feesBillsController.amountController.text,
  //           feesBillsController.dueDateController.text,
  //           feesBillsController.selectedCategory["type"],
  //           feesBillsController.selectedClass!);
  //     }
  //   }
  // }
}
