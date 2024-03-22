import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/widgets/footer_text_wid.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class FooterSectionScreen extends StatelessWidget {
  const FooterSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blue,
      height: ResponsiveWebSite.isMobile(context)
          ? 1000
          : ResponsiveWebSite.isTablet(context)
              ? 600
              : 300,
      width: double.infinity,
      child: ResponsiveWebSite.isTablet(context)
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhoWeAreWidget(),
                    ConnecWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LegalWidget(),
                    AddressWidget(),
                  ],
                )
              ],
            )
          : ResponsiveWebSite.isMobile(context)
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WhoWeAreWidget(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConnecWidget(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LegalWidget(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddressWidget(),
                      ],
                    )
                  ],
                )
              : const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WhoWeAreWidget(),
                        ConnecWidget(),
                        LegalWidget(),
                        AddressWidget(),
                      ],
                    ),
                  ],
                ),
    );
  }
}
