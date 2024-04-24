import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/cancellation.dart';
import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/mob_view.dart/trademark.dart';
import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/mob_view.dart/who_we_are.dart';
import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/mob_view.dart/why_choose_us.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/home/family_policy.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../home/footer/hover-text/hovertext.dart';
import '../../../../home/privacypolicy.dart';
import '../../../../home/terms _and_condition.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 300,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Address',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GooglePoppinsWidgets(
                      text: address[index],
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: address.length),
            ),
          )
        ],
      ),
    );
  }
}

class LegalWidget extends StatelessWidget {
  const LegalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 250,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Legal',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 1) {
                          Navigator.pushNamed(context, PrivacyPolicy.route);
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return legalnav[index];
                            },
                          ));
                        }
                      },
                      child: OnHoverText(builder: (isHoverd) {
                        final color = isHoverd
                            ? const Color.fromARGB(255, 197, 0, 0)
                            : Colors.black;

                        return GooglePoppinsWidgets(
                          color: color,
                          text: legal[index],
                          fontsize: 12,
                          fontWeight: FontWeight.w500,
                        );
                      }),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: legal.length),
            ),
          )
        ],
      ),
    );
  }
}

class ConnecWidget extends StatelessWidget {
  const ConnecWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 250,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Connect',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        connectnav[index];
                      },
                      child: OnHoverText(builder: (isHoverd) {
                        final color = isHoverd
                            ? const Color.fromARGB(255, 197, 0, 0)
                            : Colors.black;
                        return GooglePoppinsWidgets(
                          color: color,
                          text: connect[index],
                          fontsize: 12,
                          fontWeight: FontWeight.w500,
                        );
                      }),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: connect.length),
            ),
          )
        ],
      ),
    );
  }
}

class WhoWeAreWidget extends StatelessWidget {
  const WhoWeAreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'LEPTON DUJO',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return costechdujonav[index];
                          },
                        ));
                      },
                      child: OnHoverText(builder: (isHoverd) {
                        final color = isHoverd
                            ? const Color.fromARGB(255, 197, 0, 0)
                            : Colors.black;
                        return GooglePoppinsWidgets(
                          text: constechDUjo[index],
                          color: color,
                          fontsize: 12,
                          fontWeight: FontWeight.w500,
                        );
                      }),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: constechDUjo.length),
            ),
          )
        ],
      ),
    );
  }
}

List<String> constechDUjo = ['Who We Are', 'Why choose us'];
List<String> connect = ['Facebook', 'Instagram', 'Twitter', 'Youtube'];
List<String> legal = [
  'Terms & Conditions',
  'Privacy Policy',
  'Family Policy',
  'Trademark Policy',
  'Refund and\nCancellation Policy'
];
List<String> address = [
  '📌 Lepton Plus Communications (OPC) Pvt.Ltd'
      '5 th Floor,Karimpanal Statue Avenue , G.H. Road '
      'Statue,Thiruvanathapuram - 695001,Kerala,India',
  '📞 +91 97469 66651 | +91 97463 66651 | +91 471 4053483',
  '✉️ info@leptoncommunications.com',
  '✉️ leptoncommunications@gmail.com'
];
var costechdujonav = [
  const WhyChooseUs(),
  const WhoWeAre(),
];
final Uri _faceBookUrl =
    Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
final Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
final Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
final Uri _utubeUrl = Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
Future<void> _launchFacebookUrl() async {
  if (!await launchUrl(_faceBookUrl)) {
    throw 'Could not launch $_faceBookUrl';
  }
}

Future<void> _launchTwitterUrl() async {
  if (!await launchUrl(_twitterUrl)) {
    throw 'Could not launch $_twitterUrl';
  }
}

Future<void> _launchyouTubeUrl() async {
  if (!await launchUrl(_utubeUrl)) {
    throw 'Could not launch $_utubeUrl';
  }
}

Future<void> _launchInstaUrl() async {
  if (!await launchUrl(_instaUrl)) {
    throw 'Could not launch $_instaUrl';
  }
}

var connectnav = [
  _launchFacebookUrl(),
  _launchInstaUrl(),
  _launchTwitterUrl(),
  _launchyouTubeUrl(),
];
var legalnav = [
  const TermsAndConditions(),
  const TermsAndConditions(),
  const FamilyPolicyScreen(),
  const TrademarkAndPolicy(),
  const CancellationPolicy(),
];
