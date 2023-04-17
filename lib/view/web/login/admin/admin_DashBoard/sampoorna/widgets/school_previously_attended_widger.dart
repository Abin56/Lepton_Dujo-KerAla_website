import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import '../../../../../../constant/constant.dart';
import 'widgets.dart';

class SchoolPreviouslyAttendedWidget extends StatelessWidget {
  const SchoolPreviouslyAttendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'T.C No.',
            controller: Get.find<SampoornaController>().tcNumberController,
            validator: checkFieldEmpty,
          ),
        ),
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'Date',
            controller:
                Get.find<SampoornaController>().previousSchoolDateController,
            validator: checkFieldEmpty,
          ),
        ),
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'School Previously Attended',
            controller: Get.find<SampoornaController>()
                .schoolPreviouslyAttendedController,
            validator: checkFieldEmpty,
          ),
        ),
      ],
    );
  }
}
