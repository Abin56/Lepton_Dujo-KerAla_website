import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../colors/colors.dart';

class TextFormFieldFWidget extends StatelessWidget {
  const TextFormFieldFWidget({
    super.key,
    required this.function,
    this.textEditingController,
    this.icon,
    this.labelText,
    this.hintText,
  });

  final String? Function(String? fieldContent) function;
  final TextEditingController? textEditingController;
  final IconData? icon;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: TextFormField(
        validator: function,
        controller: textEditingController,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
            icon: Icon(
              icon,
              color: const Color.fromARGB(221, 28, 9, 110),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: const TextStyle(color: cBlack)),
      ),
    );
  }
}
