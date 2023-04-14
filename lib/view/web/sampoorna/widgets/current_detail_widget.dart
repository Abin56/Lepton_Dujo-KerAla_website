import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import '../../../constant/constant.dart';
import 'const.dart';
import 'widgets.dart';

class CurrentDetailWidget extends StatelessWidget {
  CurrentDetailWidget({
    super.key,
  });
  SampoornaController sampoornaController = Get.find<SampoornaController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Class',
                controller:
                    Get.find<SampoornaController>().currentClassController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Division',
                controller:
                    Get.find<SampoornaController>().currentDivisionController,
                validator: checkFieldEmpty,
              ),
            ),
            Flexible(
              child: TextFormFieldTextWidget(
                title: 'Total No of working days',
                controller:
                    Get.find<SampoornaController>().totalControllerNoOfDays,
                validator: checkFieldEmpty,
              ),
            ),
          ],
        ),
        kHeight20,
        Obx(
          () => Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.090,
                child: const Text('Religion'),
              ),
              RadioButtonWidget(
                  title: 'Yes',
                  value: 'Yes',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>().cswnRadio.value =
                          groupValue;
                    }
                  }),
                  groupValue: Get.find<SampoornaController>().cswnRadio.value),
              RadioButtonWidget(
                  title: 'No',
                  value: 'No',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>().cswnRadio.value =
                          groupValue;
                    }
                  }),
                  groupValue: Get.find<SampoornaController>().cswnRadio.value),
              const Expanded(child: Text('(CSWN-children with special needs)'))
            ],
          ),
        ),
        kHeight20,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.090,
                child: const Text(
                    'If Yes specify\nBlindness (40% or above disability)'),
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[0].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[0].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[0].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[1].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[1].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[1].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[2].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[2].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[2].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[3].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[3].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[3].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[4].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[4].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[4].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[5].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[5].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[5].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[6].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[6].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[6].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[7].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[7].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[7].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[8].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[8].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[8].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[9].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[9].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[9].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[10].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[10].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[10].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[11].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[11].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[11].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                          CheckedBoxWidget(
                            title: sampoornaController
                                .disabilityCheckedBoxList[12].title,
                            value: sampoornaController
                                .disabilityCheckedBoxList[12].value,
                            function: (value) {
                              if (value != null) {
                                sampoornaController
                                    .disabilityCheckedBoxList[12].value = value;
                                sampoornaController.disabilityCheckedBoxList
                                    .refresh();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        kHeight20,
        Obx(
          () => Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.090,
                child: const Text('Instruction Medium'),
              ),
              RadioButtonWidget(
                  title: 'Malayalam',
                  value: 'Malayalam',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>()
                          .instructionMediumRadio
                          .value = groupValue;
                    }
                  }),
                  groupValue: Get.find<SampoornaController>()
                      .instructionMediumRadio
                      .value),
              RadioButtonWidget(
                  title: 'English',
                  value: 'English',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>()
                          .instructionMediumRadio
                          .value = groupValue;
                    }
                  }),
                  groupValue: Get.find<SampoornaController>()
                      .instructionMediumRadio
                      .value),
              RadioButtonWidget(
                  title: 'Tamil',
                  value: 'Tamil',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>()
                          .instructionMediumRadio
                          .value = groupValue;
                    }
                  }),
                  groupValue: Get.find<SampoornaController>()
                      .instructionMediumRadio
                      .value),
              RadioButtonWidget(
                  title: 'Kannada',
                  value: 'Kannada',
                  function: ((groupValue) {
                    if (groupValue != null) {
                      Get.find<SampoornaController>()
                          .instructionMediumRadio
                          .value = groupValue;
                    }
                  }),
                  groupValue: Get.find<SampoornaController>()
                      .instructionMediumRadio
                      .value),
            ],
          ),
        ),
        kHeight20,
        Obx(
          () => Column(
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.090,
                    child: const Text('First Language Paper 1'),
                  ),
                  RadioButtonWidget(
                      title: 'Malayalam',
                      value: 'Malayalam',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>()
                              .firstLanguagePaper1Radio
                              .value = groupValue;
                        }
                      }),
                      groupValue: Get.find<SampoornaController>()
                          .firstLanguagePaper1Radio
                          .value),
                  RadioButtonWidget(
                      title: 'Addl.English',
                      value: 'Addl.English',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>()
                              .firstLanguagePaper1Radio
                              .value = groupValue;
                        }
                      }),
                      groupValue: Get.find<SampoornaController>()
                          .firstLanguagePaper1Radio
                          .value),
                  RadioButtonWidget(
                      title: 'Addl.Hindi',
                      value: 'Addl.Hindi',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>()
                              .firstLanguagePaper1Radio
                              .value = groupValue;
                        }
                      }),
                      groupValue: Get.find<SampoornaController>()
                          .firstLanguagePaper1Radio
                          .value),
                  RadioButtonWidget(
                      title: 'Sanskit(A)',
                      value: 'Sanskit(A)',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>()
                              .firstLanguagePaper1Radio
                              .value = groupValue;
                        }
                      }),
                      groupValue: Get.find<SampoornaController>()
                          .firstLanguagePaper1Radio
                          .value),
                  RadioButtonWidget(
                      title: 'Arabic',
                      value: 'Arabic',
                      function: ((groupValue) {
                        if (groupValue != null) {
                          Get.find<SampoornaController>()
                              .firstLanguagePaper1Radio
                              .value = groupValue;
                        }
                      }),
                      groupValue: Get.find<SampoornaController>()
                          .firstLanguagePaper1Radio
                          .value),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.090,
                    child: const Text(''),
                  ),
                  RadioButtonWidget(
                    title: 'Urdu',
                    value: 'Urdu',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper1Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper1Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Tamil',
                    value: 'Tamil',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper1Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper1Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Kannada',
                    value: 'Kannada',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper1Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper1Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Gujarati',
                    value: 'Gujarati',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper1Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper1Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Sanskrit(O)',
                    value: 'Sanskrit(O)',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper1Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper1Radio
                        .value,
                  ),
                ],
              ),
            ],
          ),
        ),
        kHeight20,
        Obx(
          () => Column(
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.090,
                    child: const Text('First Language Paper 2'),
                  ),
                  RadioButtonWidget(
                    title: 'Malayalam',
                    value: 'Malayalam',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Addl.English',
                    value: 'Addl.English',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Addl.Hindi',
                    value: 'Addl.Hindi',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Sanskit(A)',
                    value: 'Sanskit(A)',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Arabic',
                    value: 'Arabic',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.090,
                    child: const Text(''),
                  ),
                  RadioButtonWidget(
                    title: 'Urdu',
                    value: 'Urdu',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Tamil',
                    value: 'Tamil',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Kannada',
                    value: 'Kannada',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Gujarati',
                    value: 'Gujarati',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                  RadioButtonWidget(
                    title: 'Sanskrit(O)',
                    value: 'Sanskrit(O)',
                    function: ((groupValue) {
                      if (groupValue != null) {
                        Get.find<SampoornaController>()
                            .firstLanguagePaper2Radio
                            .value = groupValue;
                      }
                    }),
                    groupValue: Get.find<SampoornaController>()
                        .firstLanguagePaper2Radio
                        .value,
                  ),
                ],
              ),
            ],
          ),
        ),
        kHeight20,
        Obx(
          () => Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.090,
                child: const Text('Third Language'),
              ),
              RadioButtonWidget(
                title: 'General Knowledge',
                value: 'General Knowledge',
                function: ((groupValue) {
                  if (groupValue != null) {
                    Get.find<SampoornaController>().thirdLanguage.value =
                        groupValue;
                  }
                }),
                groupValue: Get.find<SampoornaController>().thirdLanguage.value,
              ),
              RadioButtonWidget(
                title: 'Hindi',
                value: 'Hindi',
                function: ((groupValue) {
                  if (groupValue != null) {
                    Get.find<SampoornaController>().thirdLanguage.value =
                        groupValue;
                  }
                }),
                groupValue: Get.find<SampoornaController>().thirdLanguage.value,
              ),
            ],
          ),
        )
      ],
    );
  }
}
