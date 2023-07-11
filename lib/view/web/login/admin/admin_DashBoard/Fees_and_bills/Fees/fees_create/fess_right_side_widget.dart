import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_create_controller.dart';
import '../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../../model/fees_bills_model/fees_category_model.dart';
import '../../../../../../../../model/fees_bills_model/fees_model.dart';
import '../../../../../../../constant/constant.dart';
import '../fees_status/bills_creation.dart';
import 'widgets/submit_button_widget.dart';

class FeesCreatePageRighWidget extends StatelessWidget {
  FeesCreatePageRighWidget({super.key});
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
          child: ListView(
            children: [
              TextFormFieldFWidget(
                textEditingController:
                    _feesCreateController.feesNameTextController,
                function: checkFieldEmpty,
                hintText: 'Fees Name',
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                textEditingController:
                    _feesCreateController.createdDateTextController,
                onTap: () async {
                  _feesCreateController.createdDateTextController.text =
                      await dateTimePicker(context);
                },
                function: checkFieldEmpty,
                hintText: 'Created Date',
                readOnly: true,
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                textEditingController:
                    _feesCreateController.feesPeriodTextController,
                function: checkFieldEmpty,
                hintText: 'Fee Period',
              ),
              sizedBoxH20,
              DropdownSearch<CategoryModel>(
                asyncItems: (String item) =>
                    _feesCreateController.fetchAllCategories(),
                onChanged: (value) {
                  _feesCreateController.selectedCategory = value;
                },
                itemAsString: (CategoryModel u) => u.categoryName,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Select Category",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              sizedBoxH20,
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: _feesCreateController.isClassShow.value,
                        onChanged: (value) {
                          if (value != null) {
                            _feesCreateController.isClassShow.value = value;
                          }
                        },
                      ),
                      const Text("Specific Class Only")
                    ],
                  )),
              sizedBoxH20,
              Obx(
                () => Visibility(
                  visible: _feesCreateController.isClassShow.value,
                  child: DropdownSearch<ClassModel>(
                    asyncItems: (String item) =>
                        _feesCreateController.fetchAllClasses(),
                    itemAsString: (ClassModel u) => u.className,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Class",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    onChanged: (value) {
                      _feesCreateController.selectedClassModel = value;
                    },
                  ),
                ),
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                textEditingController:
                    _feesCreateController.amountTextController,
                function: checkFieldEmpty,
                hintText: 'Amount',
              ),
              sizedBoxH20,
              TextFormFieldFWidget(
                textEditingController:
                    _feesCreateController.dueDateTextController,
                function: checkFieldEmpty,
                hintText: 'Due date',
                onTap: () async {
                  _feesCreateController.dueDateTextController.text =
                      await dateTimePicker(context);
                },
                readOnly: true,
              ),
              sizedBoxH20,
              GestureDetector(
                onTap: () async {
                  await createFunction();
                },
                child: Obx(
                  () {
                    return _feesCreateController.isLoding.value
                        ? circularProgressIndicator
                        : const SubmitButtonWidget(
                            text: 'Create',
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createFunction() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_feesCreateController.selectedCategory == null) {
        return showToast(msg: "Please Select Category");
      } else {
        final feesData = FeesModel(
          feesName: _feesCreateController.feesNameTextController.text,
          feesId: "",
          createdAt: DateTime.now().toString(),
          feePeriod: _feesCreateController.feesPeriodTextController.text,
          categoryId: _feesCreateController.selectedCategory?.id ?? "",
          amount: _feesCreateController.amountTextController.text,
          dueDate: _feesCreateController.dueDateTextController.text,
          studentList: [],
          classId: "",
          className: "",
        );
        if (_feesCreateController.isClassShow.value &&
            _feesCreateController.selectedClassModel != null) {
          await _feesCreateController.createFeeSpecificClass(
              feeModel: feesData,
              classModel: _feesCreateController.selectedClassModel!);
        } else {
          await _feesCreateController.createNewFee(feeModel: feesData);
        }
      }
    }
  }
}
