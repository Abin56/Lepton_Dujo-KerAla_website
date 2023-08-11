import 'package:flutter/material.dart';

import '../../../../colors/colors.dart';
import '../../../../constant/responsive_app.dart';
import 'complaint_listview_builder.dart';

class ComplaintWebViewWidget extends StatelessWidget {
  const ComplaintWebViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: adminePrimayColor,
                  alignment: Alignment.center,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: Text(
                            "Hostel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveApp.width * .04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: Text(
                            "Complaints",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveApp.width * .04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          const VerticalDivider(),
          const ComplaintListViewBuilder(),
        ],
      ),
    );
  }
}
