import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import 'const.dart';
import 'widgets.dart';

class ParentDetailsWidget extends StatelessWidget {
  const ParentDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                  title: 'Name of Student Father',
                  controller: Get.find<SampoornaController>()
                      .nameOfStudentFatherController),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                  title: 'Name of Student Mother',
                  controller: Get.find<SampoornaController>()
                      .nameOfStudentMotherController),
            ),
          ],
        ),
        kHeight20,
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                  title: 'If other (Specify Relation)',
                  controller: Get.find<SampoornaController>()
                      .specifyRelationController),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                  title: 'Name of Guardian',
                  controller:
                      Get.find<SampoornaController>().nameOfGuardianController),
            ),
          ],
        ),
        kHeight20,
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Occupation of Parent/Guardina',
                controller: Get.find<SampoornaController>()
                    .occupationOfParentController,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Annual Income',
                controller:
                    Get.find<SampoornaController>().annulaIncomeController,
              ),
            ),
          ],
        ),
        kHeight20,
        Obx(
          () => Row(
            children: <Widget>[
              const Text('Whether Select'),
              RadioButtonWidget(
                title: 'APL',
                value: 'APL',
                function: ((groupValue) {
                  if (groupValue != null) {
                    Get.find<SampoornaController>().aplOrBplRadio.value =
                        groupValue;
                  }
                }),
                groupValue: Get.find<SampoornaController>().aplOrBplRadio.value,
              ),
              RadioButtonWidget(
                  title: 'BPL',
                  value: 'BPL',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>().aplOrBplRadio.value =
                          groupValue;
                    }
                  }),
                  groupValue:
                      Get.find<SampoornaController>().aplOrBplRadio.value),
            ],
          ),
        )
      ],
    );
  }
}
