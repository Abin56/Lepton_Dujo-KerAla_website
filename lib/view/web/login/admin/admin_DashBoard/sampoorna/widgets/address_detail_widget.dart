import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import '../../../../../../constant/constant.dart';
import 'widgets.dart';

class AddressDetailWidget extends StatelessWidget {
  const AddressDetailWidget({
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
                title: 'House Name',
                controller: Get.find<SampoornaController>().houseNameController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Place/Street',
                controller:
                    Get.find<SampoornaController>().placeStreetController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Dist',
                controller: Get.find<SampoornaController>().districtController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'State',
                controller: Get.find<SampoornaController>().stateController,
                validator: checkFieldEmpty,
              ),
            ),
          ],
        ),
        sizedBoxH20,
        Obx(
          () => Row(
            children: <Widget>[
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Taluk',
                  controller: Get.find<SampoornaController>().talukcontroller,
                  validator: checkFieldEmpty,
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Whether Select'),
                  RadioButtonWidget(
                    title: 'Grama Panchayath',
                    value: 'Grama Panchayath',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>().addressRadio.value =
                            groupValue;
                      }
                    }),
                    groupValue:
                        Get.find<SampoornaController>().addressRadio.value,
                  ),
                  RadioButtonWidget(
                    title: 'Muncipality',
                    value: 'Muncipality',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>().addressRadio.value =
                            groupValue;
                      }
                    }),
                    groupValue:
                        Get.find<SampoornaController>().addressRadio.value,
                  ),
                  RadioButtonWidget(
                    title: 'Corportion',
                    value: 'Corportion',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>().addressRadio.value =
                            groupValue;
                      }
                    }),
                    groupValue:
                        Get.find<SampoornaController>().addressRadio.value,
                  ),
                ],
              ),
            ],
          ),
        ),
        sizedBoxH20,
        const ContentTitleWidget(
            title:
                'If grama panchayath specify district panchayath and block panchayath'),
        sizedBoxH20,
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'District panchayath',
                controller: Get.find<SampoornaController>()
                    .districtPanchayathController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Block panchayath',
                controller:
                    Get.find<SampoornaController>().blockPanchayathController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Name of local body',
                controller:
                    Get.find<SampoornaController>().nameOfLocalBodyController,
                validator: checkFieldEmpty,
              ),
            ),
          ],
        ),
        sizedBoxH20,
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Post Office',
                controller:
                    Get.find<SampoornaController>().postOfficeController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Pin Code',
                controller: Get.find<SampoornaController>().pincodeController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Phone number',
                controller:
                    Get.find<SampoornaController>().phoneNumberController,
                validator: checkFieldPhoneNumberIsValid,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Student email',
                controller: Get.find<SampoornaController>().emailController,
                validator: checkFieldEmailIsValid,
              ),
            ),
          ],
        ),
        sizedBoxH20,
      ],
    );
  }
}
