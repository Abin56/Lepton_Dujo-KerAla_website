import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_class_controller.dart';
import '../../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../../../model/fees_bills_model/fees_category_model.dart';
import '../../../../../../../../../model/fees_bills_model/fees_model.dart';
import '../../fees_notification/widgets/fees_left_side_widget.dart';
import 'fees_classwise_student.dart';

class FeesStatusClassWise extends StatelessWidget {
  const FeesStatusClassWise({super.key});

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
          const Expanded(
            child: FeesFilterSecondHalfWidget(),
          ),
        ],
      ),
    );
  }
}

class FeesFilterSecondHalfWidget extends StatefulWidget {
  const FeesFilterSecondHalfWidget({
    super.key,
  });

  @override
  State<FeesFilterSecondHalfWidget> createState() =>
      _FeesFilterSecondHalfWidgetState();
}

class _FeesFilterSecondHalfWidgetState
    extends State<FeesFilterSecondHalfWidget> {
  final FeesClassController _feesClassController =
      Get.put(FeesClassController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          //select category
          DropdownSearch<ClassModel>(
            asyncItems: (String filter) => _feesClassController.getAllClasses(),
            itemAsString: (ClassModel u) => u.className,
            onChanged: (ClassModel? data) {
              setState(() {
                _feesClassController.selectedClassModel = data;
              });
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Class",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          sizedBoxH20,
          //select sub category
          DropdownSearch<FeesCategoryModel>(
            asyncItems: (String filter) =>
                _feesClassController.fetchCategoryList(
                    classId:
                        _feesClassController.selectedClassModel?.docid ?? ""),
            itemAsString: (FeesCategoryModel u) => u.categoryName,
            onChanged: (FeesCategoryModel? data) => setState(() {
              _feesClassController.selectedMainCategoryModel = data;
            }),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          sizedBoxH20,
          //select class
          if (_feesClassController.selectedClassModel != null ||
              _feesClassController.selectedMainCategoryModel != null)
            DropdownSearch<FeesModel>(
              asyncItems: (String filter) =>
                  _feesClassController.fetchSubCategoryList(
                      classModel: _feesClassController.selectedClassModel!,
                      mainCategoryModel:
                          _feesClassController.selectedMainCategoryModel!),
              itemAsString: (FeesModel u) => u.subCategoryName,
              onChanged: (FeesModel? data) => _feesClassController
                  .selectedSubCategory = data?.subCategoryId ?? "",
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Select Sub Category",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

          sizedBoxH20,

          ElevatedButton(
              onPressed: () {
                if (_feesClassController.selectedClassModel != null ||
                    _feesClassController.selectedMainCategoryModel != null ||
                    _feesClassController.selectedSubCategory.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const FeesClassWiseStudentsPage();
                      },
                    ),
                  );
                } else {
                  showToast(msg: "All Fields are mandatory");
                }
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
