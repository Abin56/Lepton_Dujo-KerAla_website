import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_class_controller.dart';
import '../../../../../../../../../controller/fees_bills/send_fee_notification_controller.dart';
import '../../../../../../../../../model/fees_bills_model/fees_model.dart';
import '../../fees_create/widgets/fees_left_side_widget.dart';
import 'fees_school_students_show_page.dart';

class FeesClassShowPage extends StatelessWidget {
  const FeesClassShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FeesHalfContainerWidget(
              screenSize: screenSize,
              text: 'School Fees',
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
  final FeesClassController _feesClassController =
      Get.put(FeesClassController());
  final FeesNotificationController _notificationController =
      Get.put(FeesNotificationController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            children: <Widget>[
              //select category
              DropdownSearch<Map<String, dynamic>>(
                selectedItem: _feesClassController.selectedClass.isEmpty
                    ? {"className": "Select Class"}
                    : _feesClassController.selectedClass,
                asyncItems: (String item) =>
                    _feesClassController.fetchClassName(),
                onChanged: (value) {
                  if (value != null) {
                    _feesClassController.selectedClass = value;
                  }
                },
                itemAsString: (Map<String, dynamic> u) => u["className"],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Select Class",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              sizedBoxH20,

              //select class
              DropdownSearch<FeesModel>(
                selectedItem: _feesClassController.selectedFeesModel.value ??
                    FeesModel(
                        feesName: "Select Fees",
                        feesId: "",
                        createdAt: "",
                        feePeriod: "",
                        categoryId: "",
                        amount: "",
                        dueDate: "",
                        classId: "",
                        className: "",
                        studentList: []),
                asyncItems: (String item) => _feesClassController.fetchAllFees(
                    selectedClass:
                        _feesClassController.selectedClass["id"] ?? ""),
                itemAsString: (FeesModel u) => u.feesName,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Select Fees",
                    border: OutlineInputBorder(),
                  ),
                ),
                onChanged: (value) {
                  _feesClassController.selectedFeesModel.value = value;
                },
              ),

              sizedBoxH20,

              ElevatedButton(
                onPressed: () {
                  if (_feesClassController.selectedFeesModel.value != null &&
                      _feesClassController.selectedClass.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FeesClassStudents(),
                      ),
                    );
                  } else {
                    showToast(msg: "Please Select Class");
                  }
                },
                child: const Text("Submit"),
              ),
              sizedBoxH20,

              ElevatedButton(
                onPressed: () async {
                  if (_feesClassController.selectedFeesModel.value != null &&
                      _feesClassController.selectedClass.isNotEmpty) {
                    await _notificationController
                        .sendClassFeesNotificationClass(
                            classId: _feesClassController.selectedClass["id"],
                            dueDate: _feesClassController
                                    .selectedFeesModel.value?.dueDate ??
                                "",
                            amount: _feesClassController
                                    .selectedFeesModel.value?.amount ??
                                "",
                            categoryName: _feesClassController
                                    .selectedFeesModel.value?.feesName ??
                                "");
                  }
                },
                child: const Text("Send Notifications"),
              ),
            ],
          ),
        ));
  }
}
