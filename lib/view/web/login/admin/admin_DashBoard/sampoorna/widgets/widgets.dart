import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.function,
  });
  final String title;
  final String value;
  final String groupValue;
  final Function(String? groupValue) function;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .10,
      child: Row(
        children: [
          Flexible(
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: function,
            ),
          ),
          Flexible(
            child: Text(title),
          )
        ],
      ),
    );
  }
}

class ContentTitleWidget extends StatelessWidget {
  const ContentTitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 30,
      ),
    );
  }
}

class TextFormFieldTextWidget extends StatelessWidget {
  const TextFormFieldTextWidget({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
  });
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            width: size.width * 0.090,
            child: TextWidgetField(title: title),
          ),
        ),
        sizedBoxH20,
        Flexible(
          child: SizedBox(
            width: size.width * .3,
            child: TextFormField(
              validator: validator,
              onChanged: (value) {
                if (Get.find<SampoornaController>().autoValidationIsOn) {
                  Get.find<SampoornaController>()
                      .sampoornaFormKey
                      .currentState!
                      .validate();
                }
              },
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextWidgetField extends StatelessWidget {
  const TextWidgetField({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
    );
  }
}

class CheckedBoxWidget extends StatelessWidget {
  const CheckedBoxWidget({
    super.key,
    required this.title,
    required this.value,
    required this.function,
  });
  final String title;
  final bool value;
  final Function(bool? value) function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: function),
        FittedBox(
          child: Text(
            title,
          ),
        )
      ],
    );
  }
}
