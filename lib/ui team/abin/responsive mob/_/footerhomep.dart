// ignore_for_file: must_be_immutable, unused_local_variable, prefer_final_fields

import 'package:dujo_kerala_website/ui%20team/abin/responsive%20mob/_/cancellation.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/home/family_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../view/web/home/footer/hover-text/hovertext.dart';
import '../../../../view/web/home/lepton_Admin/admin_panel_Screen.dart';
import '../../../../view/web/home/privacypolicy.dart';
import '../../../../view/web/home/terms _and_condition.dart';
import 'mob_view.dart/trademark.dart';
import 'mob_view.dart/who_we_are.dart';
import 'mob_view.dart/why_choose_us.dart';

class FooterHomeP extends StatelessWidget {
  FooterHomeP({super.key});

  Uri _faceBookUrl =
   Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
   Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
   Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
   Uri _utubeUrl =
      Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
   Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

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

  TextStyle k = GoogleFonts.poppins(fontSize: 14.w);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: 680.h,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            //color: cWhite,
            height: 400.h,
            width: double.infinity,
           // color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 220.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LEPTON DuJo',
                            style: GoogleFonts.poppins(
                              fontSize: 25.w,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(103, 53, 107, 1),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const WhoWeAre())));
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.h,
                                    child: Text(
                                      'Who We Are',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          GestureDetector(
                             onTap: () {
                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const WhyChooseUs())));
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.h,
                                    child: Text(
                                      'Why choose us',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                        
                       
                          // GestureDetector(
                          //    onTap: () {
                              
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: ((context) =>
                          //                 const Careers())));
                          //   },
                          //   child: OnHoverText(
                          //     builder: (isHoverd) {
                          //       final color =
                          //           isHoverd ? Colors.orange : Colors.black;
                          //       return SizedBox(
                          //           width: 165.h,
                          //           child: Text(
                          //             'Careers',
                          //             style: k,
                          //           ));
                          //     },
                          //   ),
                          // ),
                          
                          // GestureDetector(
                          //   onTap: () {
                          //     //  Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: ((context) =>
                          //                 LeptonAdminLoginScreen())));
                          //   },
                          //   child: OnHoverText(
                          //     builder: (isHoverd) {
                          //       final color = isHoverd
                          //           ? const Color.fromARGB(255, 255, 0, 0)
                          //           : Colors.black;
                          //       return SizedBox(
                          //           width: 170.w,
                          //           child: Text(
                          //             'Super Admin',
                          //             style: TextStyle(
                          //                 fontSize: 17.h, color: color),
                          //           ));
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Connect',
                            style: GoogleFonts.poppins(
                              fontSize: 25.w,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(103, 53, 107, 1),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchFacebookUrl();
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.h,
                                    child: Text(
                                      'Facebook',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          OnHoverText(
                            builder: (isHoverd) {
                              final color =
                                  isHoverd ? Colors.orange : Colors.black;
                              return GestureDetector(
                                onTap: () {
                                 _launchInstaUrl();
                                },
                                child: SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Instagram',
                                      style: k,
                                    )),
                              );
                            },
                          ),
                          InkWell(onTap: () {
                                    _launchTwitterUrl();
                          },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Twitter',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                               _launchyouTubeUrl();
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Youtube',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Legal',
                            style: GoogleFonts.poppins(
                              fontSize: 25.w,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(103, 53, 107, 1),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const TermsAndConditions())));
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Terms & Conditions',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicy.route);
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Privacy Policy',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const FamilyPolicyScreen())));
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Family Policy',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const TrademarkAndPolicy())));
                                  
                          },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Trademark Policy',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,                                                                                                                                      
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const CancellationPolicy()))); 
                            },
                            child: OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Refund and Cancellation Policy',
                                      style: k,
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address",
                                style: GoogleFonts.poppins(
                                    fontSize: 20.w,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                 const Icon(Icons.location_on),
                                Text(
                                  ' Lepton Plus Communications (OPC) Pvt.Ltd'
                                  '\n   5th Floor ,Karimpanal Statue Avenue ,G.H. Road,',
                                  style: k,
                                ),
                              ],
                            ),
                            Text(
                              '          Statue ,Thiruvananthapuram-695001. Kerala , India',
                              style: k,
                            ),
                            Row(
                              children: [
                                 const Icon(Icons.phone),
                                Text(
                                  '+91 97469 66651 | +91 97463 66651 | +91 471 4053483',
                                  style: k,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                 const Icon(Icons.mail),
                                Text(
                                  ' info@leptoncommunications.com,',
                                  style: k,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                 const Icon(Icons.mail),
                                Text(' leptoncommunications@gmail.com', style: k),
                              ],
                            ),
                          ]),

                  
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFF26A69A),
          ),
          SizedBox(
            height: 200.w,
            width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200.w,
                    width: 300.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453'))),
                  ),
                  Text(
                    'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to providing high end sustainable products and services that\nenhances the quality of life',
                    style: GoogleFonts.poppins(
                      fontSize: 18.w,
                        color: cBlack),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              height: 60.w,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Copyright ©️ All rights reserved | by LeptonCommunications",
                    style: GoogleFonts.poppins(
                        fontSize: 15.w,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
