import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeTextField extends StatelessWidget {
  const DateTimeTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.function,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: TextField(
        enabled: false,
        controller: textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText.tr,
        ),
      ),
    );
  }
}
