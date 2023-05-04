import 'package:dujo_kerala_website/view/web/home/family_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../privacypolicy.dart';
import '../terms _and_condition.dart';
import 'email/mailsender.dart';
import 'hover-text/hovertext.dart';

class FooterHomeP extends StatelessWidget {
   FooterHomeP({super.key});

  TextStyle k = GoogleFonts.poppins();

  @override
  Widget build(BuildContext context) {
     var screenSize =MediaQuery.of(context).size;
    return Container(
      height: 680,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lepton DuJo',
                              style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 53, 107, 1),),
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Who We Are',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Why choose us',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Color.fromARGB(255, 168, 15, 4) : Colors.black;
                                return SizedBox(
                                    width: 180,
                                    child: Text(
                                      'Lepton DuJo For Business',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Affiliates',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Careers',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'News',
                                      style:
                                          k,
                                    ));
                              },
                            ),

                             GestureDetector(
                              onTap: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
                                      // Navigator.push(context, MaterialPageRoute(builder: ((context) =>LeptonAdminLoginScreen())));
                                
                              },

                               child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? Color.fromARGB(255, 255, 0, 0) : Colors.black;
                                  return SizedBox(
                                      width: 160.w,
                                      
                                      child: Text(
                                        'Super Admin',
                                        style:
                                            TextStyle(fontSize: 18, color: color),
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
                              'Connect',
                              style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 53, 107, 1),),
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Blog',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return const  CondactusUserScreen();
                                    },));
                                  },
                                  child: SizedBox(
                                      width: 160.w,
                                      child: Text(
                                        'Contact US',
                                        style:
                                            k,
                                      )),
                                );
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Help Center',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Security',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Legal',
                              style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold,color: Color.fromRGBO(103, 53, 107, 1),),
                            ),
                            GestureDetector(
                              onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder:((context) =>TermsAndConditions())));
                              },
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? Colors.orange : Colors.black;
                                  return SizedBox(
                                      width: 160.w,
                                      child: Text(
                                        'Terms & Conditions',
                                        style:
                                            k,
                                      ));
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:((context) => PrivacyPolicy())));
                              },
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? Colors.orange : Colors.black;
                                  return SizedBox(
                                      width: 160.w,
                                      child: Text(
                                        'Privacy Policy',
                                        style:
                                            k,
                                      ));
                                },
                              ),
                            ),
                              GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:((context) => const FamilyPolicyScreen())));
                              },
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? Colors.orange : Colors.black;
                                  return SizedBox(
                                      width: 160.w,
                                      child: Text(
                                        'Family Policy',
                                        style:
                                            k,
                                      ));
                                },
                              ),
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Trademark Policy',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Cancellation Policy',
                                      style:
                                          k,
                                    ));
                              },
                            ),
                          ],
                        ),
                        Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text(
                              "Address", 
                              style:
                                  GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold,color: Color.fromRGBO(103, 53, 107, 1),),
                            ),
                            Row(
                              children: [
                                 Icon(Icons.map_outlined,color: Color.fromARGB(255, 4, 124, 4)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Lepton Plus Communications(OPC) Pvt.Ltd.5th Floor', style: k,),
                                    Text('Karimpanal Statue Avenue,G.H. Road, Statue', style: k,),
                                    Text('Thiruvananthapuram-695001. Kerala , India', style: k,),
                             ],
                             ),
                             ],
                            ),
                            
                        
                             Row(
                              children: [
                                Icon(Icons.phone,color: Colors.blue),
                                Text('	+91 471 4053483	', style: k,),
                              ],
                            ),
                           
                            Row(
                              children: [
                                Icon(Icons.phone_android),
                                Text('	+91 97469 66651 | +91 97463 66651', style: k,),
                              ],
                            ),
                             Row(
                              children: [
                                Icon(Icons.mail_outline_sharp,color: Colors.red),
                                Text('info@leptoncommunications.com,''\n leptoncommunications@gmail.com', style: k,),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFF26A69A),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453'))),
                  ),
                  Text(
                    'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to\n providing high end sustainable products and services that\nenhances the quality of life',
                 style:  GoogleFonts.poppins(color: Color.fromRGBO(103, 53, 107, 1)),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Copyright ©️ All rights reserved | by LeptonCommunications",
                  style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}