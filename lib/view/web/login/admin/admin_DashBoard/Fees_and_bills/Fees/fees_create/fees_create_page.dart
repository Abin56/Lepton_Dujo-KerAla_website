import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/fees_bills/fees_category_create_controller.dart';
import '../../../../../../../constant/constant.dart';
import 'fess_right_side_widget.dart';
import 'widgets/fees_left_side_widget.dart';

class FeesCreatePage extends StatelessWidget {
  FeesCreatePage({
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
          await feesCreatePageDialogue(context);
        },
        tooltip: "Create New Fee",
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: [
          //left side widget
          FeesHalfContainerWidget(screenSize: screenSize, text: 'Fees'),
          //right side widget
          Expanded(
            child: FeesCreatePageRighWidget(),
          )
        ],
      ),
    );
  }

  Future<dynamic> feesCreatePageDialogue(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: 150.h, top: 80.h),
          child: Obx(() => feesController.isLoding.value
              ? circularProgressIndicator
              : AlertDialog(
                  title: Text('Create New Category',
                      style: TextStyle(fontSize: 14.w)),
                  content: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: feesController.categoryNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter the Name of the category',
                            ),
                          ),
                          sizedBoxH20,
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
                      child: Text('Create', style: TextStyle(fontSize: 15.w)),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await feesController.createNewCategory(
                              categoryName:
                                  feesController.categoryNameController.text,
                              context: context);
                        }
                      },
                    ),
                  ],
                )),
        );
      },
    );
  }
}
