import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_category_create_controller.dart';
import '../../../../../../../constant/constant.dart';
import 'fess_right_side_widget.dart';
import 'widgets/fees_left_side_widget.dart';

class FeesNotification extends StatelessWidget {
  FeesNotification({
    super.key,
  });
  final FeesCategoryCreateController feesController =
      Get.put(FeesCategoryCreateController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await feesNotificationDialogue(context);
        },
        tooltip: "Create Category",
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: [
          //left side widget
          FeesHalfContainerWidget(
              screenSize: screenSize, text: 'Fees notifications'),
          //right side widget
          Expanded(
            child: FeesNotificationRightSideWidget(),
          )
        ],
      ),
    );
  }

  Future<dynamic> feesNotificationDialogue(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: 150.h, top: 80.h),
          child: AlertDialog(
            title: Text('Fees Categories', style: TextStyle(fontSize: 14.w)),
            content: Obx(
              () => feesController.isLoading.value
                  ? circularProgressIndicator
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: feesController.categoryNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Fees Categories',
                            ),
                          ),
                          sizedBoxH20,
                          DropdownSearch<String>(
                            items: feesController.typeOfCategoryList,
                            itemAsString: (String u) => u,
                            onChanged: (String? data) => feesController
                                .selectedTypeOfCategory = data ?? "",
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  labelText: "Select Type",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel', style: TextStyle(fontSize: 15.w)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Ok', style: TextStyle(fontSize: 15.w)),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await feesController.createFeesCategory(
                        feesController.categoryNameController.text,
                        feesController.selectedTypeOfCategory,
                        context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
