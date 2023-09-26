import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/footer.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/lepton_footerbar.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/home/footer/widgets/copyright_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors.dart';
import '../../home/create_school/create_school.dart';
import 'appBar/appbar.dart';
import 'footer/widgets/alertDilogueBox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: ResponsiveMobileAppBar()),
      body: ResponsiveWebSite.isMobile(context)
          ? ListView(
              children: [
                const DujoHOmeScreen(),
                DujoHomeWebSiteDetails(),
                // MobileAppBAr(), // App Bar
                const Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                const FooterSectionScreen(),
                const Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                const LeptonFooterBar(),
                const CopyRightWidget()
              ],
            )
          : ListView(
              children: [
                // const WebSiteNavBAr(), //Nav Bar
                const DujoHOmeScreen(),
                DujoHomeWebSiteDetails(),
                const Divider(
                  height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: FooterSectionScreen(),
                ),
                const Divider(
                  // height: 05,
                  thickness: 01,
                  color: cBlack,
                ),
                const LeptonFooterBar(),
                const CopyRightWidget()
              ],
            ),
    );
  }
}

class DujoHOmeScreen extends StatelessWidget {
  const DujoHOmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWebSite.isMobile(context) ? 402 : 900,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/websiteHomepage.jpg'),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          SizedBox(
              height: 402, //const Color(0xFF17BDB5),
              child: ResponsiveWebSite.isMobile(context)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GoogleMonstserratWidgets(
                                text: 'Customer support',
                                fontsize: ResponsiveWebSite.isMobile(context)
                                    ? 12
                                    : 15,
                                color: adminePrimayColor,
                                fontWeight: FontWeight.w500),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                  height: 85,
                                  width: ResponsiveWebSite.isDesktop(context)
                                      ? 270
                                      : ResponsiveWebSite.isMobile(context)
                                          ? 200
                                          : 230,
                                  // color: cred                ,
                                  child: Center(
                                      child: Image.asset(
                                    "assets/images/COSTECH_bg.png",
                                    fit: BoxFit.cover,
                                  ))),
                            ),
                            //sizedBoxH5,
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GoogleMonstserratWidgets(
                                text: '10.00 AM to 06.00 PM, Mon-Fri',
                                fontWeight: FontWeight.w500,
                                fontsize: 15,
                                color: adminePrimayColor,
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 50, top: 10),
                              child: GoogleMonstserratWidgets(
                                  text: '080 696 21 222',
                                  fontsize: ResponsiveWebSite.isMobile(context)
                                      ? 20
                                      : 20,
                                  fontWeight: FontWeight.w700,
                                  color: cred),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                child: Text(
                                  "Watch And Guide,\n" "Let Them Study !",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: adminePrimayColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: MaterialButton(
                                  height: 60,
                                  minWidth: 100,
                                  onPressed: () {
                                    mobileandTabAlert(context);
                                  },
                                  color: adminePrimayColor,
                                  child: Center(
                                    child: Text(
                                      'Create School Profile',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                // color: cBlue,
                                width: 230,
                                height: 50,

                                child: Center(
                                  child: GooglePoppinsWidgets(
                                    text: "C O S T E C H",
                                    fontsize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                ),
                                // color: cBlue,
                                width: 200,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/dujon.png')),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                child: Text(
                                  "Watch And Guide,\n" "Let Them Study !",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: adminePrimayColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: MaterialButton(
                                  height: 60,
                                  minWidth: 250,
                                  onPressed: () {
                                    ResponsiveWebSite.isDesktop(context)
                                        ? Navigator.pushNamed(
                                            context, SchoolProfile.route)
                                        : mobileandTabAlert(context);
                                  },
                                  color: adminePrimayColor,
                                  child: Center(
                                    child: Text(
                                      'Create School Profile',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: GoogleMonstserratWidgets(
                                  text: 'Customer support',
                                  fontsize: 15,
                                  color: adminePrimayColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                  height: 85,
                                  width: ResponsiveWebSite.isDesktop(context)
                                      ? 270
                                      : 230,
                                  // color: cred                ,
                                  child: Center(
                                      child: Image.asset(
                                    "assets/images/COSTECH_bg.png",
                                    fit: BoxFit.cover,
                                  ))),
                            ),
                            //sizedBoxH5,
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GoogleMonstserratWidgets(
                                text: '10.00 AM to 06.00 PM, Mon-Fri',
                                fontWeight: FontWeight.w500,
                                fontsize: 15,
                                color: adminePrimayColor,
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 50, top: 10),
                              child: GoogleMonstserratWidgets(
                                  text: '080 696 21 222',
                                  fontsize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: cred),
                            ),
                          ],
                        )
                      ],
                    )),
        ],
      ),
    );
  }
}

class DujoHomeWebSiteDetails extends StatelessWidget {
  DujoHomeWebSiteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: ResponsiveWebSite.isDesktop(context) ? 900 : 840,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ResponsiveWebSite.isDesktop(context)
                    ? null
                    : const Color.fromARGB(255, 235, 227, 227),
                image: ResponsiveWebSite.isDesktop(context)
                    ? const DecorationImage(
                        image:
                            AssetImage('assets/images/dujo_schools_image.png'),
                        fit: BoxFit.fill)
                    : null),
            child: ResponsiveWebSite.isDesktop(context)
                ? WebSiteDiscriptionWidget(text1: text1, text2: text2)
                : Center(
                    child: WebSiteDiscriptionWidget(text1: text1, text2: text2),
                  )),
      ],
    );
  }

  List<String> text1 = [
    'Admin Login',
    'Class Teacher Login',
    'Parent Login',
    'Student Login',
    'Guardian Login',
    "Online Classes",
  ];
  List<String> text2 = [
    'Recorded Sessions',
    'Study Materials',
    'Notice and Events',
    'Attendance Updates',
    'Notifications and Alerts',
    "Chat Functionality",
  ];
}

class WebSiteDiscriptionWidget extends StatelessWidget {
  const WebSiteDiscriptionWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  final List<String> text1;
  final List<String> text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: ResponsiveWebSite.isDesktop(context)
            ? MainAxisAlignment.end
            : MainAxisAlignment.center,
        crossAxisAlignment: ResponsiveWebSite.isDesktop(context)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width:
                  ResponsiveWebSite.isDesktop(context) ? 800 : double.infinity,
              height: ResponsiveWebSite.isDesktop(context) ? 200 : 300,
              child: Center(
                child: GooglePoppinsWidgets(
                  text:
                      "The 'COSTECH DuJO The School App' is a collaborative effort between Lepton Communications and \n"
                      "\n"
                      "COSTECH, designed to serve as a comprehensive mobile application for efficiently managing various \n"
                      "\n"
                      "aspects of school infrastructure in the state of Kerala, India. The app offers a range of features and \n"
                      "\n"
                      "functionalities catering to different stakeholders within the educational ecosystem.",
                  fontsize: 13,

                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveWebSite.isDesktop(context) ? 300 : 200,
            width: ResponsiveWebSite.isDesktop(context) ? 800 : 300,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ResponsiveWebSite.isDesktop(context) ? 260 : 160,
                    width: ResponsiveWebSite.isDesktop(context) ? 200 : 150,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 40 : 27,
                            width:
                                ResponsiveWebSite.isDesktop(context) ? 100 : 80,
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 04,
                                  backgroundColor: cBlack,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: GoogleMonstserratWidgets(
                                    text: text1[index],
                                    fontsize:
                                        ResponsiveWebSite.isDesktop(context)
                                            ? 13
                                            : 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 05 : 00,
                          );
                        },
                        itemCount: text1.length),
                  ),
                  SizedBox(
                    height: ResponsiveWebSite.isDesktop(context) ? 260 : 160,
                    width: ResponsiveWebSite.isDesktop(context) ? 200 : 150,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 40 : 27,
                            width:
                                ResponsiveWebSite.isDesktop(context) ? 100 : 80,
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 04,
                                  backgroundColor: cBlack,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: GoogleMonstserratWidgets(
                                    text: text2[index],
                                    fontsize:
                                        ResponsiveWebSite.isDesktop(context)
                                            ? 13
                                            : 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height:
                                ResponsiveWebSite.isDesktop(context) ? 05 : 00,
                          );
                        },
                        itemCount: text2.length),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: ResponsiveWebSite.isDesktop(context) ? 800 : 800,
              height: ResponsiveWebSite.isDesktop(context) ? 200 : 300,
              child: Center(
                child: GooglePoppinsWidgets(
                    text:
                        "'COSTECH DuJO The School App' aims to revolutionize the way schools in Kerala manage\n"
                        "\n"
                        "their infrastructure and interact with their stakeholders. By providing a centralized platform\n"
                        "\n"
                        "for communication,learning, and administration, the app enhances the educational experience\n"
                        "\n"
                        "for students,simplifies administrative tasks,and fosters a more connected and engaged \n"
                        "\n"
                        "educational community.",
                    fontsize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
