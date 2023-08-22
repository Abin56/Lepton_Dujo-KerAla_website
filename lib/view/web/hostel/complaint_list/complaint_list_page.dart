import 'package:flutter/material.dart';

import '../../../constant/layout_builder_class.dart';
import 'widgets/complaint_mobile_widget.dart';
import 'widgets/complaint_web_widget.dart';

class HostelComplaintMainPage extends StatelessWidget {
  const HostelComplaintMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobileBuilder: (context) {
        return const ComplaintMobileWidget();
      },
      webBuilder: (context) {
        return const ComplaintWebViewWidget();
      },
    );
  }
}
