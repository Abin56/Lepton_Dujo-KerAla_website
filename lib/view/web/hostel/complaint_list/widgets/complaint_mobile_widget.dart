import 'package:flutter/material.dart';

import '../../../../colors/colors.dart';
import 'complaint_listview_builder.dart';

class ComplaintMobileWidget extends StatelessWidget {
  const ComplaintMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint"),
        backgroundColor: adminePrimayColor,
      ),
      body: Row(
        children: [
          ComplaintListViewBuilder(),
        ],
      ),
    );
  }
}
