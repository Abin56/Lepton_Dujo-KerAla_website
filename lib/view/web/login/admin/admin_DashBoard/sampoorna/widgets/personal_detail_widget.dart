import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import '../../../../../../constant/constant.dart';
import 'widgets.dart';

class PersonalDetailWidget extends StatelessWidget {
  const PersonalDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxH30,
          Row(
            children: <Widget>[
              Flexible(
                child: SizedBox(
                  width: size.width * .50,
                  child: TextFormFieldTextWidget(
                    title: 'Name of Student (English)',
                    controller:
                        Get.find<SampoornaController>().nameOfStudentController,
                    validator: checkFieldEmpty,
                  ),
                ),
              ),
              sizedBoxH20,
              Obx(() {
                return Row(
                  children: <Widget>[
                    const Text('Select Gender'),
                    RadioButtonWidget(
                      title: 'Male',
                      value: 'Male',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().genderRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().genderRadio.value,
                    ),
                    RadioButtonWidget(
                      title: 'Female',
                      value: 'Female',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().genderRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().genderRadio.value,
                    ),
                    RadioButtonWidget(
                      title: 'Other',
                      value: 'Other',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().genderRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().genderRadio.value,
                    ),
                  ],
                );
              })
            ],
          ),
          sizedBoxH30,
          Obx(
            () => Row(
              children: <Widget>[
                const Text('Select Nationality'),
                RadioButtonWidget(
                  title: 'Indian',
                  value: 'Indian',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>().nationalityRadio.value =
                          groupValue;
                    }
                  }),
                  groupValue:
                      Get.find<SampoornaController>().nationalityRadio.value,
                ),
                RadioButtonWidget(
                  title: 'Other',
                  value: 'Other',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>().nationalityRadio.value =
                          groupValue;
                    }
                  }),
                  groupValue:
                      Get.find<SampoornaController>().nationalityRadio.value,
                ),
                Flexible(
                    child: TextFormFieldTextWidget(
                  title: '',
                  controller:
                      Get.find<SampoornaController>().nationalityController,
                      
                ))
              ],
            ),
          ),
          sizedBoxH20,
          //academics
          const ContentTitleWidget(
            title: 'Academics',
          ),
          sizedBoxH30,
          Row(
            children: <Widget>[
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Class',
                  controller:
                      Get.find<SampoornaController>().academicClassController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Year',
                  controller:
                      Get.find<SampoornaController>().academicyearController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Result',
                  controller:
                      Get.find<SampoornaController>().academicresultController,
                  validator: checkFieldEmpty,
                ),
              ),
            ],
          ),
          sizedBoxH20,
          //Extra Curricular Activities
          const ContentTitleWidget(
            title: 'Extra Curricular Activities',
          ),
          sizedBoxH30,
          Row(
            children: <Widget>[
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Arts',
                  controller: Get.find<SampoornaController>().artsController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Sports',
                  controller: Get.find<SampoornaController>().sportsController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Technology',
                  controller:
                      Get.find<SampoornaController>().technologyController,
                  validator: checkFieldEmpty,
                ),
              ),
            ],
          ),
          sizedBoxH20,
          //Achievements
          const ContentTitleWidget(
            title: 'Achievements',
          ),
          sizedBoxH30,
          Row(
            children: <Widget>[
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Schoo Level',
                  controller:
                      Get.find<SampoornaController>().schoolLevelController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'District Level',
                  controller:
                      Get.find<SampoornaController>().districtLevelController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'State Level',
                  controller:
                      Get.find<SampoornaController>().stateLevelController,
                  validator: checkFieldEmpty,
                ),
              ),
            ],
          ),
          sizedBoxH30,
          Row(
            children: <Widget>[
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Scholarship ',
                  controller:
                      Get.find<SampoornaController>().scholarShipController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
              Flexible(
                child: TextFormFieldTextWidget(
                  title: 'Skills',
                  controller: Get.find<SampoornaController>().skillsController,
                  validator: checkFieldEmpty,
                ),
              ),
              sizedBoxH20,
            ],
          ),
        ],
      ),
    );
  }
}
