// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_bills_controller.dart';
import '../../../../../../../constant/constant.dart';
import 'fess_right_side_widget.dart';
import 'widgets/fees_left_side_widget.dart';

class FeesNotification extends StatelessWidget {
  FeesNotification({
    super.key,
  });
  final FeesBillsController feesBillsController =
      Get.put(FeesBillsController());

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
        child: Icon(Icons.add),
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
              () => feesBillsController.categoryCreateloading.value
                  ? circularProgressIndicator
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller:
                                feesBillsController.categoryNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Fees Categories',
                            ),
                          ),
                          sizedBoxH20,
                          DropdownSearch<String>(
                            items: feesBillsController.selectionList,
                            itemAsString: (String u) => u,
                            onChanged: (String? data) => feesBillsController
                                .categoryCreateValue = data ?? "",
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
                    await feesBillsController.createFeesCategory(
                        feesBillsController.categoryNameController.text,
                        feesBillsController.categoryCreateValue,
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
