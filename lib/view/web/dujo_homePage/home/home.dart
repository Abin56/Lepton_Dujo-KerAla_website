import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/footer.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/lepton_footerbar.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/widgets/copyright_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import 'appBar/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWebSite.isMobile(context)
          ? ListView(
              children: const [
                MobileAppBAr(), // App Bar
                Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                FooterSectionScreen(),
                Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                LeptonFooterBar(),
                CopyRightWidget()
              ],
            )
          : ListView(
              children: const [
                WebSiteNavBAr(), //Nav Bar
                Divider(
                  height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                FooterSectionScreen(),
                Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                LeptonFooterBar(),
                CopyRightWidget()
              ],
            ),
    );
  }
}
