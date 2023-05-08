import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors.dart';
import '../family_policy.dart';
import '../lepton_Admin/admin_panel_Screen.dart';
import '../privacypolicy.dart';
import '../terms _and_condition.dart';
import 'email/mailsender.dart';
import 'hover-text/hovertext.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

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
              padding:  const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
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
                              style: GoogleFonts.poppins(fontSize: screenSize.width/50,fontWeight: FontWeight.bold )
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Who We Are',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                     width: screenSize.width/17,
                                    child: Text(
                                      'Why choose us',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                            Container(color:Colors.transparent,
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? const Color.fromARGB(255, 168, 15, 4) : Colors.black;
                                  return SizedBox(
                                       width: screenSize.width/10,
                                      child: Text(
                                        'Lepton DuJo For Business',
                                        style:
                                            TextStyle(fontSize: screenSize.width/115, color: color,fontWeight: FontWeight.bold),
                                      ));
                                },
                              ),
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Affiliates',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Carrers',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'News',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),

                             GestureDetector(
                              onTap: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
                                       Navigator.push(context, MaterialPageRoute(builder: ((context) =>LeptonAdminLoginScreen())));
                                
                              },

                               child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? const Color.fromARGB(255, 255, 0, 0) : Colors.black;
                                  return SizedBox(
                                      width: screenSize.width/15,
                                      
                                      child: Text(
                                        'Super Admin',
                                        style:
                                            TextStyle(fontSize: screenSize.width/100, color: color,fontWeight: FontWeight.bold),
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
                              style: GoogleFonts.poppins(fontSize: screenSize.width/50,fontWeight: FontWeight.bold )
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Blog',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
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
                                      width: screenSize.width/20,
                                      child: Text(
                                        'Contact US',
                                        style:
                                            TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                      )),
                                );
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Help Center',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Security',
                                      style:
                                          TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
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
                              style: GoogleFonts.poppins(fontSize: screenSize.width/50,fontWeight: FontWeight.bold )
                            ),
                            GestureDetector(
                              onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder:((context) =>const TermsAndConditions())));
                              },
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? Colors.orange : Colors.black;
                                  return SizedBox(
                                      width: screenSize.width/20,
                                      child: Text(
                                        'Terms & Conditions',
                                        style:
                                            TextStyle(fontSize: screenSize.width/110, color: color,fontWeight: FontWeight.bold),
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
                                      width: screenSize.width/20,
                                      child: Text(
                                        'Family Policy',
                                        style:
                                            TextStyle(fontSize:  screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                      ));
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:((context) => const PrivacyPolicy())));
                              },
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color =
                                      isHoverd ? Colors.orange : Colors.black;
                                  return SizedBox(
                                      width: screenSize.width/20,
                                      child: Text(
                                        'Privacy Policy',
                                        style:
                                            TextStyle(fontSize:  screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                      ));
                                },
                              ),
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/20,
                                    child: Text(
                                      'Trademark Policy',
                                      style:
                                          TextStyle(fontSize:  screenSize.width/110, color: color,fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: screenSize.width/18,
                                    child: Text(
                                      'Cancellation Policy',
                                      style:
                                          TextStyle(fontSize:  screenSize.width/115, color: color,fontWeight: FontWeight.bold),
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
                                  GoogleFonts.poppins(fontSize: screenSize.width/50,fontWeight: FontWeight.bold)
                            ),
                            Row(
                              children: [
                                 Icon(Icons.location_on,color: const Color.fromARGB(255, 4, 124, 4),size: screenSize.width/50),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Lepton Plus Communications(OPC) Pvt.Ltd.5th Floor',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                                    Text('Karimpanal Statue Avenue,G.H. Road, Statue',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                                    Text('Thiruvananthapuram-695001. Kerala , India',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                             ],
                             ),
                             ],
                            ),
                            sizedBoxW20,
                             Row(
                              children: [
                                 Icon(Icons.location_on,color: const Color.fromARGB(255, 4, 124, 4),size: screenSize.width/50),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Lepton plus communications(opc) pvt. Ltd Dotspace Business center,',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                                    Text('TC 24/3088,Ushasandya Building,Kowdiar - Devasom Board Road,',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                                    Text('Kowdiar, Trivandrum - 695003. Kerala , India',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                             ],
                             ),
                             ],
                            ),
                            sizedBoxW20,
                             Row(
                              children: [
                                Icon(Icons.phone,color: Colors.blue,size: screenSize.width/50),
                                Text('	+91 471 4053483	',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            sizedBoxW20,
                           
                            Row(
                              children: [
                                Icon(Icons.phone_android,size: screenSize.width/50),
                                Text('	+91 97469 66651 | +91 97463 66651',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            sizedBoxW20,
                             Row(
                              children: [
                                Icon(Icons.mail_outline_sharp,color: Colors.red,size: screenSize.width/50),
                                Text('info@leptoncommunications.com,''\n leptoncommunications@gmail.com',style: TextStyle(fontSize:  screenSize.width/110,fontWeight: FontWeight.bold)),
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
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding:  const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: screenSize.width/10,
                    width: screenSize.width/6,
                    decoration:  const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453'))),
                  ),
                  Text(
                    'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to\n providing high end sustainable products and services that\nenhances the quality of life',
                    style: GoogleFonts.poppins(fontSize: screenSize.width/98,),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: cBlack,
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Copyright ©️ All rights reserved | by LeptonCommunications",
                  style: GoogleFonts.poppins(fontSize: screenSize.width/98,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
