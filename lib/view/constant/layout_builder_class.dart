import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) mobileBuilder;
  final Widget Function(BuildContext context) webBuilder;

  const ResponsiveLayoutBuilder(
      {super.key, required this.mobileBuilder, required this.webBuilder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          // For web (large screens)
          return webBuilder(context);
        } else {
          // For mobile (small screens)
          return mobileBuilder(context);
        }
      },
    );
  }
}
