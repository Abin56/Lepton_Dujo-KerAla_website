import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_status_controller.dart';
import '../../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../../../model/fees_bills_model/fees_subcategory_model.dart';
import '../../fees_notification/widgets/fees_left_side_widget.dart';
import 'fees_class_students.dart';

class FeesStstatues extends StatelessWidget {
  const FeesStstatues({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FeesHalfContainerWidget(
              screenSize: screenSize,
              text: 'Fees Catergories',
            ),
          ),
          Expanded(
            child: FeesFilterSecondHalfWidget(),
          ),
        ],
      ),
    );
  }
}

class FeesFilterSecondHalfWidget extends StatelessWidget {
  FeesFilterSecondHalfWidget({
    super.key,
  });

  final FeesStatusController feesStatusController =
      Get.put(FeesStatusController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          //select category
          DropdownSearch<Map<String, dynamic>>(
            asyncItems: (String filter) =>
                feesStatusController.fetchAllSchoolCategories(),
            itemAsString: (Map<String, dynamic> u) => u["categoryName"],
            onChanged: (Map<String, dynamic>? data) {
              feesStatusController.selectedMainCategory = data?["id"];
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          sizedBoxH20,
          //select sub category
          DropdownSearch<FeesSubCategoryModel>(
            asyncItems: (String filter) =>
                feesStatusController.fetchAllSchoolSubCategories(
                    feesStatusController.selectedMainCategory),
            itemAsString: (FeesSubCategoryModel u) => u.subCategoryName,
            onChanged: (FeesSubCategoryModel? data) =>
                feesStatusController.selectedSubCategory = data?.id ?? "",
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Sub Category",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          sizedBoxH20,
          //select class
          DropdownSearch<ClassModel>(
            asyncItems: (String filter) => feesStatusController.getAllClasses(),
            itemAsString: (ClassModel u) => u.className,
            onChanged: (ClassModel? data) =>
                feesStatusController.selectedClass = data?.docid ?? "",
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Class",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          sizedBoxH20,

          ElevatedButton(
              onPressed: () {
                if (feesStatusController.selectedMainCategory.isEmpty ||
                    feesStatusController.selectedSubCategory.isEmpty ||
                    feesStatusController.selectedClass.isEmpty) {
                  showToast(msg: "Please select all values");
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeesClassStudents(),
                      ));
                }
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
