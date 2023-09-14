import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/home/appBar/login_button.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const String _imageUrl =
    "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/dujocolleges.jpeg?alt=media&token=0c3fa202-c59f-47bd-b997-88f3128e6871";

const String _description = "Any schools from Kerala can register on\n"
    "COSTECH DuJo. COSTECH Dujo is a mobile application\n"
    "with student login,  parent login, teacher login";

final Uri _faceBookUrl =
    Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
final Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
final Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
final Uri _utubeUrl = Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
final Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

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

Future<void> _launchleptonUrl() async {
  if (!await launchUrl(_leptonUrl)) {
    throw 'Could not launch $_leptonUrl';
  }
}

class WebSiteNavBAr extends StatelessWidget {
  const WebSiteNavBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFCE230C),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      '📞 +91 8891436651  ',
                      style: GoogleFonts.poppins(
                          color: cWhite,
                          //Color(0xFF17BDB5),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '✉️ info@leptondujo.com',
                      style: GoogleFonts.poppins(
                          // adminePrimayColor,
                          color: cWhite,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const LoginButton(), // Login Button

              Container(
                margin: const EdgeInsets.only(right: 10),
                width: ResponsiveWebSite.isTablet(context) ? 180 : 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _launchFacebookUrl();
                      },
                      child: Image.asset(
                        'assets/images/frdd.png',
                        height: 20,
                        width: 20,
                        color: adminePrimayColor,
                        //Color(0xFF17BDB5),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInstaUrl();
                      },
                      child: Image.asset(
                        'assets/images/instag.png',
                        height: 25,
                        width: 25,
                        color: adminePrimayColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchTwitterUrl();
                      },
                      child: Image.asset(
                        'assets/images/twitt.png',
                        height: 20,
                        width: 20,
                        color: adminePrimayColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchyouTubeUrl();
                      },
                      child: const Icon(
                        Icons.ondemand_video,
                        color: adminePrimayColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MobileAppBAr extends StatelessWidget {
  const MobileAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFCE230C),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      '📞 +91 8891436651    ',
                      style: GoogleFonts.poppins(
                          color: cWhite,
                          //Color(0xFF17BDB5),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '✉️ info@leptondujo.com',
                      style: GoogleFonts.poppins(
                          // adminePrimayColor,
                          color: cWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color(0xFFCE230C),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginButton(), // Login Button
              InkWell(
                onTap: () {
                  _launchFacebookUrl();
                },
                child: Image.asset(
                  'assets/images/frdd.png',
                  height: 20,
                  width: 20,
                  color: adminePrimayColor,
                  //Color(0xFF17BDB5),
                ),
              ),
              InkWell(
                onTap: () {
                  _launchInstaUrl();
                },
                child: Image.asset(
                  'assets/images/instag.png',
                  height: 25,
                  width: 25,
                  color: adminePrimayColor,
                ),
              ),
              InkWell(
                onTap: () {
                  _launchTwitterUrl();
                },
                child: Image.asset(
                  'assets/images/twitt.png',
                  height: 20,
                  width: 20,
                  color: adminePrimayColor,
                ),
              ),
              InkWell(
                onTap: () {
                  _launchyouTubeUrl();
                },
                child: const Icon(
                  Icons.ondemand_video,
                  color: adminePrimayColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
