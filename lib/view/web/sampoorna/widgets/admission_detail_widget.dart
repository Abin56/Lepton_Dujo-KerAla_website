import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import '../../../constant/constant.dart';
import 'const.dart';
import 'widgets.dart';

class AdmissionDetailWidget extends StatelessWidget {
  const AdmissionDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Date of Admission',
                controller:
                    Get.find<SampoornaController>().dateOfAdmissionController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Place of Birth',
                controller:
                    Get.find<SampoornaController>().placeOfBirthController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Date of Birth',
                controller:
                    Get.find<SampoornaController>().dateOfBirhtController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Blood Group',
                controller:
                    Get.find<SampoornaController>().bloodGroupController,
                validator: checkFieldEmpty,
              ),
            ),
          ],
        ),
        kHeight20,
        Row(
          children: <Widget>[
            SizedBox(
              width: size.width * 0.090,
              child: const Text('Religion'),
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RadioButtonWidget(
                        title: 'Hindu',
                        value: 'Hindu',
                        function: ((groupValue) {
                          if (groupValue != null) {
                            Get.find<SampoornaController>()
                                .religionRadio
                                .value = groupValue;
                          }
                        }),
                        groupValue:
                            Get.find<SampoornaController>().religionRadio.value,
                      ),
                      RadioButtonWidget(
                          title: 'Christian',
                          value: 'Christian',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Muslim',
                          value: 'Muslim',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Islam',
                          value: 'Islam',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Jain',
                          value: 'Jain',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Sikh',
                          value: 'Sikh',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Udaism',
                          value: 'Udaism',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      RadioButtonWidget(
                          title: 'Secular',
                          value: 'Secular',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Bahai',
                          value: 'Bahai',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Buddist',
                          value: 'Buddist',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Non-Religion',
                          value: 'Non-Religion',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                      RadioButtonWidget(
                          title: 'Not Applicable',
                          value: 'Not Applicable',
                          function: ((groupValue) {
                            if (groupValue != null) {
                              Get.find<SampoornaController>()
                                  .religionRadio
                                  .value = groupValue;
                            }
                          }),
                          groupValue: Get.find<SampoornaController>()
                              .religionRadio
                              .value),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        kHeight20,
        Row(
          children: <Widget>[
            SizedBox(
              width: size.width * 0.090,
              child: const Text('Category'),
            ),
            Obx(
              () => Row(
                children: <Widget>[
                  RadioButtonWidget(
                      title: 'General',
                      value: 'General',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().categoryRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().categoryRadio.value),
                  RadioButtonWidget(
                      title: 'SC',
                      value: 'SC',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().categoryRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().categoryRadio.value),
                  RadioButtonWidget(
                      title: 'ST',
                      value: 'ST',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().categoryRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().categoryRadio.value),
                  RadioButtonWidget(
                      title: 'OBC',
                      value: 'OBC',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().categoryRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().categoryRadio.value),
                  RadioButtonWidget(
                      title: 'OEC',
                      value: 'OEC',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().categoryRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().categoryRadio.value),
                ],
              ),
            )
          ],
        ),
        kHeight20,
        Row(
          children: <Widget>[
            SizedBox(
              width: size.width * 0.090,
              child: const Text('Candidates belongs to SC or ST'),
            ),
            Obx(
              () => Row(
                children: <Widget>[
                  RadioButtonWidget(
                      title: 'Yes',
                      value: 'Yes',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().scOrStRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().scOrStRadio.value),
                  RadioButtonWidget(
                      title: 'No',
                      value: 'No',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>().scOrStRadio.value =
                              groupValue;
                        }
                      }),
                      groupValue:
                          Get.find<SampoornaController>().scOrStRadio.value),
                ],
              ),
            )
          ],
        ),
        kHeight20,
        TextFormFieldTextWidget(
          title: 'Caste',
          controller: Get.find<SampoornaController>().casteController,
          validator: checkFieldEmpty,
        ),
      ],
    );
  }
}
