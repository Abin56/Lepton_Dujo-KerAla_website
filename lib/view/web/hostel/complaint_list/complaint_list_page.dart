import 'package:flutter/material.dart';

import '../../../constant/layout_builder_class.dart';
import 'widgets/complaint_mobile_widget.dart';
import 'widgets/complaint_web_widget.dart';

class HostelComplaintListPage extends StatelessWidget {
  const HostelComplaintListPage({super.key});

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
