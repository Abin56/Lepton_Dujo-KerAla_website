// ignore_for_file: prefer_final_fields

import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../view/web/home/family_policy.dart';
import '../../../../../view/web/home/privacypolicy.dart';
import '../../../../../view/web/home/terms _and_condition.dart';


class FooterMob extends StatelessWidget {
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
   FooterMob({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(left: 10.w),
      height: 178.h,
      width: double.infinity,
      color:  const Color.fromARGB(255, 13, 122, 117),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Lepton DuJo',
                    style: GoogleFonts.poppins(
                      fontSize: 10.h,
                      fontWeight: FontWeight.bold,
                      color: cWhite
                    //  color: const Color.fromRGBO(103, 53, 107, 1),
                    ),
                  ),
                  SizedBox(
                      width: 80.h,
                      child: Text(
                        'Who We Are',
                        style: k,
                      )),
                  SizedBox(
                      width: 80.h,
                      child: Text(
                        'Why choose us',
                        style: k,
                      )),
                 
                
                  SizedBox(
                      width: 80.h,
                      child: Text(
                        'Careers',
                        style: k,
                      )),
                  
                  GestureDetector(
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) =>
                      //             LeptonAdminLoginScreen())));
                    },
                    child: SizedBox(
                        width: 80.h,
                        child: Text(
                          'Super Admin',
                          style: TextStyle(fontSize:8.h, color: Colors.white),
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 60.w),
                child: Column(
                  children: [
                    Text(
                      'Connect',
                      style: GoogleFonts.poppins(
                        fontSize: 10.h,
                        fontWeight: FontWeight.bold,
                        color: cWhite
                        //color: const Color.fromRGBO(103, 53, 107, 1),
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                       _launchFacebookUrl();
                      },
                      child: SizedBox(
                          width: 80.h,
                          child: Text(
                            'Facebook',
                            style: k,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchInstaUrl();
                      },
                      child: SizedBox(
                          width: 80.h,
                          child: Text(
                            'Instagram',
                            style: k,
                          )),
                    ),
                    GestureDetector(
                       onTap: () {
                        _launchTwitterUrl();
                      },
                      child: SizedBox(
                        width: 80.h,
                        child: Text(
                          'Twitter',
                          style: k,
                        ),
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                         _launchyouTubeUrl();
                      },
                      child: SizedBox(
                          width: 80.h,
                          child: Text(
                            'Youtube',
                            style: k,
                          )),
                    ),
                  ],
                ),
              ),
  
          
          Container(
            margin: EdgeInsets.only(bottom: 5.w),
            child: Column(
                  
                  children: [
                    Text(
                      'Legal',
                      style: GoogleFonts.poppins(
                        fontSize: 9.h,
                        fontWeight: FontWeight.bold,
                        color: cWhite
                        //color: const Color.fromRGBO(103, 53, 107, 1),
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
                        child: SizedBox(
            width: 80.h,
            child: Text(
              'Terms & Conditions',
              style: k,
            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const PrivacyPolicy())));
                        },
                        child: SizedBox(
            width: 80.h,
            child: Text(
              'Privacy Policy',
              style: k,
            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const FamilyPolicyScreen())));
                        },
                        child: SizedBox(
            width: 80.h,
            child: Text(
              'Family Policy',
              style: k,
            ))),
                    GestureDetector(
                       onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const PrivacyPolicy())));
                        },
                      child: SizedBox(
                          width: 80.h,
                          child: Text(
                            'Trademark Policy',
                            style: k,
                          )),
                    ),
                    GestureDetector(
                       onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const PrivacyPolicy())));
                        },
                      child: SizedBox(
                          width: 80.h,
                          child: Text(
                            'Cancellation Policy',
                            style: k,
                          )),
                    ),
                  ],
                ),
          ),
              

          ],
          ),
          
             Container(
              margin: EdgeInsets.only(left: 30.w),
               child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address",
                                style: GoogleFonts.poppins(
                                    fontSize: 18.w,
                                    color: cWhite,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                  Icon(Icons.location_on,color: cWhite,size: 15.w),
                                Text(
                                  ' Lepton Plus Communications (OPC) Pvt.Ltd'
                                  '\n   5th Floor ,Karimpanal Statue Avenue ,G.H. Road, ',
                                  style: f,
                                ),
                              ],
                            ),
                            Text(
                              '          Statue ,Thiruvananthapuram-695001. Kerala , India',
                              style: f,
                            ),
                            Row(
                              children: [
                                  Icon(Icons.phone,color: cWhite,size: 15.w),
                                Text(
                                  ' +91 97469 66651 | +91 97463 66651 | +91 471 4053483	',
                                  style: f,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                  Icon(Icons.mail,color: cWhite,size: 15.w),
                                Text(
                                  ' info@leptoncommunications.com,',
                                  style: f,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                  Icon(Icons.mail,color: cWhite,size: 15.w),
                                Text(' leptoncommunications@gmail.com', style: f),
                              ],
                            ),
                            ]),
             ),

              Divider(
                      thickness: 1.h,
                      color: const Color(0xFF26A69A),
                    ),
                    Container(
                       margin: EdgeInsets.only(left: 5.w),
                      height: 60.h,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.h,
                            width: 100.h,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453'))),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: Text(
                              'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to providing high end sustainable products and services that\nenhances the quality of life',
                              style: GoogleFonts.poppins(
                                  fontSize: 6.h,
                                  color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ],
                      ),
                    ),
                     Expanded(
                       child: Container(
                        color: Colors.black,
                        height: 18.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Copyright © All rights reserved | by LeptonCommunications",
                              style: GoogleFonts.poppins(
                                  fontSize: 20.w,
                       
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        )
                        ),
                     ),
      ]),
    );
  }
}

TextStyle k = GoogleFonts.poppins(fontSize: 10.w,color: cWhite);
TextStyle f = GoogleFonts.poppins(fontSize: 7.w,color: cWhite);