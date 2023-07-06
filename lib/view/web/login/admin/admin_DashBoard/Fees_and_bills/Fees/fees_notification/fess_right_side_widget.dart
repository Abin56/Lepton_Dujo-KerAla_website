import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/model/fees_bills_model/fees_category_model.dart';
import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/Fees_and_bills/Fees/fees_notification/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_create_controller.dart';
import '../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../../model/fees_bills_model/fees_subcategory_model.dart';
import '../../../../../../../constant/constant.dart';
import '../fees_satus/bills_creation.dart';

class FeesNotificationRightSideWidget extends StatelessWidget {
  FeesNotificationRightSideWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  final FeesCreateController _feesCreateController =
      Get.put(FeesCreateController());

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
                asyncItems: (text) => _feesCreateController.fetchCategoryList(),
                itemAsString: (FeesCategoryModel item) => item.categoryName,
                onChanged: (FeesCategoryModel? data) {
                  _feesCreateController.selectedMainCategory = data;
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Select Fee",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              sizedBoxH20,
              DropdownSearch<FeesSubCategoryModel>(
                asyncItems: (items) =>
                    _feesCreateController.fetchSubCategoryList(
                  _feesCreateController.selectedMainCategory?.id ?? "",
                ),
                itemAsString: (FeesSubCategoryModel u) => u.subCategoryName,
                onChanged: (FeesSubCategoryModel? data) =>
                    _feesCreateController.selectedSubCategory = data,
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
                        value: _feesCreateController.isSpecificClassOnly.value,
                        onChanged: (value) {
                          if (value != null) {
                            _feesCreateController.isSpecificClassOnly.value =
                                value;
                            if (!value) {
                              _feesCreateController.selectedClass = null;
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
                  visible: _feesCreateController.isSpecificClassOnly.value,
                  child: DropdownSearch<ClassModel>(
                    items: _feesCreateController.allClass,
                    itemAsString: (ClassModel u) => u.className,
                    onChanged: (ClassModel? data) =>
                        _feesCreateController.selectedClass = data,
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
                textEditingController: _feesCreateController.amountController,
                labelText: 'Amount',
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                textEditingController: _feesCreateController.dueDateController,
                onTap: () async => _feesCreateController
                    .dueDateController.text = await dateTimePicker(context),
                function: checkFieldEmpty,
                labelText: 'Due date',
              ),
              sizedBoxH20,
              GestureDetector(
                  onTap: () async {
                    await createFunction();
                  },
                  child: Obx(
                    () => _feesCreateController.isLoading.value
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

  Future<void> createFunction() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_feesCreateController.selectedClass == null) {
        await _feesCreateController.createFeesForAllClass(
            categoryId: _feesCreateController.selectedMainCategory?.id ?? "",
            subCategoryId: _feesCreateController.selectedSubCategory?.id ?? "",
            categoryName:
                _feesCreateController.selectedMainCategory?.categoryName ?? "",
            amount: _feesCreateController.amountController.text,
            dueDate: _feesCreateController.dueDateController.text,
            type: _feesCreateController.selectedType.value,
            subCategoryName:
                _feesCreateController.selectedSubCategory?.subCategoryName ??
                    "");
      } else {
        if (_feesCreateController.selectedMainCategory != null ||
            _feesCreateController.selectedSubCategory != null ||
            _feesCreateController.selectedClass != null) {
          await _feesCreateController.createFeesForSpecificClass(
              categoryModel: _feesCreateController.selectedMainCategory!,
              subCategoryModel: _feesCreateController.selectedSubCategory!,
              amount: _feesCreateController.amountController.text,
              dueDate: _feesCreateController.dueDateController.text,
              classModel: _feesCreateController.selectedClass!);
        }
      }
    }
  }
}
