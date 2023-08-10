import 'package:flutter/material.dart';

import '../../../../constant/responsive_app.dart';

class ComplaintTextWidget extends StatelessWidget {
  const ComplaintTextWidget({super.key, required this.value, this.fontWeight});
  final String value;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveApp.width * .1,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
