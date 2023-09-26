import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../../colors/colors.dart';

class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GooglePoppinsWidgets(
            text: 'Copyright ©️ All right reserved | by LeptonCommunications',
            fontsize: ResponsiveWebSite.isMobile(context) ? 8 : 15,
            fontWeight: FontWeight.w500,
            color: cWhite,
          )
        ],
      ),
    );
  }
}