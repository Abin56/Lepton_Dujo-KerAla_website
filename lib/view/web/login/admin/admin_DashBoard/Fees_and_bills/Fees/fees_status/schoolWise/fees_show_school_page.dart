import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_school_show_controller.dart';
import '../../../../../../../../../controller/fees_bills/send_fee_notification_controller.dart';
import '../../../../../../../../../model/fees_bills_model/fees_model.dart';
import '../../fees_create/widgets/fees_left_side_widget.dart';
import 'fees_school_students_show_page.dart';

class FeesSchoolShowPage extends StatelessWidget {
  const FeesSchoolShowPage({super.key});

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
  final FeesSchoolController _feesSchoolController =
      Get.put(FeesSchoolController());
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
                selectedItem: _feesSchoolController.selectedClass.isEmpty
                    ? {"className": "Select Class"}
                    : _feesSchoolController.selectedClass,
                asyncItems: (String item) =>
                    _feesSchoolController.fetchClassName(),
                onChanged: (value) {
                  if (value != null) {
                    _feesSchoolController.selectedClass = value;
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
                selectedItem: _feesSchoolController.selectedFeesModel.value ??
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
                asyncItems: (String item) => _feesSchoolController.fetchAllFees(
                    selectedClass:
                        _feesSchoolController.selectedClass["id"] ?? ""),
                itemAsString: (FeesModel u) => u.feesName,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Select Fees",
                    border: OutlineInputBorder(),
                  ),
                ),
                onChanged: (value) {
                  _feesSchoolController.selectedFeesModel.value = value;
                },
              ),

              sizedBoxH20,

              ElevatedButton(
                onPressed: () {
                  if (_feesSchoolController.selectedFeesModel.value != null &&
                      _feesSchoolController.selectedClass.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FeesSchoolClassStudents(),
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
                  if (_feesSchoolController.selectedFeesModel.value != null) {
                    await _notificationController.sendAllClassFeesNotification(
                        dueDate: _feesSchoolController
                                .selectedFeesModel.value?.dueDate ??
                            "",
                        amount: _feesSchoolController
                                .selectedFeesModel.value?.amount ??
                            "",
                        categoryName: _feesSchoolController
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
