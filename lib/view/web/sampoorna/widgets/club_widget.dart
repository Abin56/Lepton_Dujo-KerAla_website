import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';

class ClubWidget extends StatelessWidget {
  ClubWidget({
    super.key,
  });
  final sampoornaController = Get.find<SampoornaController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: sampoornaController.listOfClubCheckedBox,
      ),
    );
  }
}
