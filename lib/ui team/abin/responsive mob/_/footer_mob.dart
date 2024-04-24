import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class FooterMob1 extends StatelessWidget {
  const FooterMob1({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        //margin: EdgeInsets.only(left: 10.w),
        height: 500.h,
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
                      'LEPTON DuJo',
                      style: GoogleFonts.poppins(
                        fontSize: 15.h,
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
                          'LEPTON DuJo For Business',
                          style: k,
                        )),
                    SizedBox(
                        width: 80.h,
                        child: Text(
                          'Affiliates',
                          style: k,
                        )),
                    SizedBox(
                        width: 80.h,
                        child: Text(
                          'Careers',
                          style: k,
                        )),
                    SizedBox(
                        width: 80.h,
                        child: Text(
                          'News',
                          style: k,
                        )),
                    // GestureDetector(
                    //   onTap: () {
                    //     //  Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: ((context) =>
                    //     //             LeptonAdminLoginScreen())));
                    //   },
                    //   child: SizedBox(
                    //       width: 80.h,
                    //       child: Text(
                    //         'Super Admin',
                    //         style: TextStyle(fontSize: 12.h, color: Colors.white),
                    //       )),
                    // ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 60.w),
                  child: Column(
                    children: [
                      Text(
                        'Connect',
                        style: GoogleFonts.poppins(
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold,
                          color: cWhite
                          //color: const Color.fromRGBO(103, 53, 107, 1),
                        ),
                      ),
                      SizedBox(
                          width: 80.h,
                          child: Text(
                            'Blog',
                            style: k,
                          )),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return const CondactusUserScreen();
                          //   },
                          // ));
                        },
                        child: SizedBox(
                            width: 80.h,
                            child: Text(
                              'Contact US',
                              style: k,
                            )),
                      ),
                      SizedBox(
                        width: 80.h,
                        child: Text(
                          'Help Center',
                          style: k,
                        ),
                      ),
                      SizedBox(
                          width: 80.h,
                          child: Text(
                            'Security',
                            style: k,
                          )),
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
                          fontSize: 15.h,
                          fontWeight: FontWeight.bold,
                          color: cWhite
                          //color: const Color.fromRGBO(103, 53, 107, 1),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) =>
                            //             const TermsAndConditions())));
                          },
                          child: SizedBox(
              width: 80.h,
              child: Text(
                'Terms & Conditions',
                style: k,
              ))),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) =>
                            //             const PrivacyPolicy())));
                          },
                          child: SizedBox(
              width: 80.h,
              child: Text(
                'Privacy Policy',
                style: k,
              ))),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) =>
                            //             const FamilyPolicyScreen())));
                          },
                          child: SizedBox(
              width: 80.h,
              child: Text(
                'Family Policy',
                style: k,
              ))),
                      SizedBox(
                          width: 80.h,
                          child: Text(
                            'Trademark Policy',
                            style: k,
                          )),
                      SizedBox(
                          width: 80.h,
                          child: Text(
                            'Refund and Cancellation Policy',
                            style: k,
                          )),
                    ],
                  ),
            ),
                
    
            ],
            ),
            
               Container(
                margin: EdgeInsets.only(left: 30.h),
                 child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18.h,
                                      color: cWhite,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                    Icon(Icons.location_on,color: cWhite,size: 15.h),
                                  Text(
                                    ' Lepton Plus Communications OPC) Pvt.Ltd'
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
                                    Icon(Icons.phone,color: cWhite,size: 15.h),
                                  Text(
                                    ' +91 97469 66651 | +91 97463 66651 | +91 471 4053483	',
                                    style: f,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                    Icon(Icons.mail,color: cWhite,size: 15.h),
                                  Text(
                                    ' info@leptoncommunications.com,',
                                    style: f,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                    Icon(Icons.mail,color: cWhite,size: 15.h),
                                  Text(' leptoncommunications@gmail.com', style: f),
                                ],
                              ),
                              ]),
               ),
    
                // Divider(
                //         thickness: 1.h,
                //         color: const Color(0xFF26A69A),
                //       ),
                      Container(
                         margin: EdgeInsets.only(left: 5.h),
                        height: 220.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30.h,
                              width: 100.h,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453'))),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.h),
                              child: Text(
                                'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to providing high end sustainable products and services that\nenhances the quality of life',
                                style: GoogleFonts.poppins(
                                    fontSize: 8.w,
                                    color: const Color.fromARGB(255, 255, 255, 255)),
                              ),
                            )
                          ],
                        ),
                      ),
                       Container(
                        color: Colors.black,
                        height: 78.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Copyright © All rights reserved | by LeptonCommunications",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.h,
                       
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        )
                        ),
        ]),
      ),
    );
  }
}

TextStyle k = GoogleFonts.poppins(fontSize: 10.h,color: cWhite);
TextStyle f = GoogleFonts.poppins(fontSize: 7.h,color: cWhite);
