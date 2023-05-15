import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/responsive.dart';
import '../../../view/colors/colors.dart';
import '../../../view/web/home/create_school/create_school.dart';
import '../../../view/web/home/family_policy.dart';
import '../../../view/web/home/footer/email/mailsender.dart';
import '../../../view/web/home/footer/hover-text/hovertext.dart';
import '../../../view/web/home/lepton_Admin/admin_panel_Screen.dart';
import '../../../view/web/home/privacypolicy.dart';
import '../../../view/web/home/terms _and_condition.dart';
import '../../../view/web/login/loginscreen.dart';
import '../../../view/web/widgets/drop_DownList/schoolDropDownList.dart';


class HomwPageTwo extends StatefulWidget {
  const HomwPageTwo({Key? key}) : super(key: key);

  @override
  State<HomwPageTwo> createState() => _HomwPageTwoState();
}

class _HomwPageTwoState extends State<HomwPageTwo> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
        ResponsiveWidget.isSmallScreen(context)
          ?
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.menu,size: 35,  // add custom icons also
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Container(

                          child: Image.asset("assets/images/leptdujo.png",height: 100,width: 100,),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [

                  Container(
                      height: screenSize.height*3.13,
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white,Colors.blue ],
                        )
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                top: screenSize.height*0.35),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 1),
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                  height: screenSize.height*0.25,
                                  width: screenSize.width*0.75,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: Container(
                                          child: Text(
                                            "Watch and Guide, \n"
                                                "Let Them Study !",
                                            style:
                                            TextStyle(
                                                fontSize: screenSize.width*0.075),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Image.asset("assets/images/dujon.png",height: 100,width: 100,),
                                          ),
                                          const SizedBox(width: 5,),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Schools",style:
                                              TextStyle(color: Colors.orange,
                                              fontSize: screenSize.height*0.03),  // add custom icons also
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.65),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 1),
                                    color: Colors.blueGrey,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.05,
                                width: screenSize.width*0.5,
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "Create School Profile",
                                      style:
                                      TextStyle(
                                          fontSize: screenSize.width*0.05),
                                    ),
                                  ),
                                ),

                              ),


//////////////////////////



                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [adminePrimayColor, Colors.transparent],
                                  ).createShader(
                                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Stack(
                                  children: [
                                    Transform.rotate(
                                      angle: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 45,top: 75),
                                        child: Positioned(
                                            left: -50,
                                            child: Image.asset(
                                                'assets/images/collage bg mob.png',
                                                width: 150,
                                                height: 250
                                            )),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.35),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 1),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.25,
                                width: screenSize.width*0.75,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Container(
                                        child: Text(
                                          "Keep going. We provide, \n"
                                              "Everything you need !",
                                          style:
                                          TextStyle(
                                              fontSize: screenSize.width*0.065),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset("assets/images/dujon.png",height: 100,width: 100,),
                                        ),
                                        const SizedBox(width: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Colleges",style:
                                          TextStyle(color: Colors.orange,
                                              fontSize: screenSize.height*0.03),  // add custom icons also
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.65),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 1),
                                    color: Colors.blueGrey,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.05,
                                width: screenSize.width*0.5,
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "Create College Profile",
                                      style:
                                      TextStyle(
                                          fontSize: screenSize.width*0.05),
                                    ),
                                  ),
                                ),

                              ),

                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [adminePrimayColor, Colors.transparent],
                                  ).createShader(
                                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Stack(
                                  children: [
                                    Transform.rotate(
                                      angle: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 35,top: 75),
                                        child: Positioned(
                                            left: -50,
                                            child: Image.asset(
                                                'assets/images/women1.png',
                                                width: 150,
                                                height: 250
                                            )),
                                      ),
                                    ),
                                    
                                   

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.35),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 1),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.25,
                                width: screenSize.width*0.75,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Container(
                                        child: Text(
                                          "Log on, \n"
                                              "Feed Your Mind!\n"
                                              "Chane the World!!",
                                          style:
                                          TextStyle(
                                              fontSize: screenSize.width*0.065),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset("assets/images/dujon.png",height: 100,width: 100,),
                                        ),
                                        const SizedBox(width: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Professionals",style:
                                          TextStyle(color: Colors.orange,
                                              fontSize: screenSize.height*0.03),  // add custom icons also
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.65),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 1),
                                    color: Colors.blueGrey,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.05,
                                width: screenSize.width*0.5,
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "Create Your Profile",
                                      style:
                                      TextStyle(
                                          fontSize: screenSize.width*0.05),
                                    ),
                                  ),
                                ),

                              ),

                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [adminePrimayColor, Colors.transparent],
                                  ).createShader(
                                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Stack(
                                  children: [

                                    Transform.rotate(
                                      angle: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 190,top: 58),
                                        child: Positioned(
                                            left: -50,
                                            child: Image.asset(
                                                'assets/images/women1.png',
                                                width: 150,
                                                height: 250
                                            )),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.35),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 1),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.25,
                                width: screenSize.width*0.75,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Container(
                                        child: Text(
                                          "It's in You,"
                                              "  Awake! and \n"
                                              "Chase Your Dream !",
                                          style:
                                          TextStyle(
                                              fontSize: screenSize.width*0.065),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset("assets/images/dujon.png",height: 100,width: 100,),
                                        ),
                                        const SizedBox(width: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Competitions",style:
                                          TextStyle(color: Colors.orange,
                                              fontSize: screenSize.height*0.03),  // add custom icons also
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 45,
                                    top: screenSize.height*0.65),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 1),
                                    color: Colors.blueGrey,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                height: screenSize.height*0.05,
                                width: screenSize.width*0.6,
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "Create Institution Profile",
                                      style:
                                      TextStyle(
                                          fontSize: screenSize.width*0.05),
                                    ),
                                  ),
                                ),

                              ),

                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [adminePrimayColor, Colors.transparent],
                                  ).createShader(
                                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Stack(
                                  children: [
                                    Transform.rotate(
                                      angle: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 35,top: 75),
                                        child: Positioned(
                                            left: -50,
                                            child: Image.asset(
                                                'assets/images/boy1.png',
                                                width: 150,
                                                height: 250
                                            )),
                                      ),
                                    ),
                                   
                                  

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height*3.13-screenSize.height*0.2),
                    alignment: Alignment.bottomCenter,
                    color: adminScreencolor,
                    height: screenSize.height*0.2,
                    child:   Container(
            height: 400,
            width: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                              style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold, color: const Color.fromRGBO(103, 53, 107, 1),),
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
                                      style: k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color = isHoverd
                                    ? const Color.fromARGB(255, 168, 15, 4)
                                    : Colors.black;
                                return SizedBox(
                                    width: 180,
                                    child: Text(
                                      'Lepton DuJo For Business',
                                      style: k,
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
                                      style: k,
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
                                      style: k,
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
                                      style: k,
                                    ));
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            LeptonAdminLoginScreen())));
                              },
                              child: OnHoverText(
                                builder: (isHoverd) {
                                  final color = isHoverd
                                      ? const Color.fromARGB(255, 255, 0, 0)
                                      : Colors.black;
                                  return SizedBox(
                                      width: 160.w,
                                      child: Text(
                                        'Super Admin',
                                        style: TextStyle(
                                            fontSize: 18, color: color),
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
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(103, 53, 107, 1),
                              ),
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Blog',
                                      style: k,
                                    ));
                              },
                            ),
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const CondactusUserScreen();
                                      },
                                    ));
                                  },
                                  child: SizedBox(
                                      width: 160.w,
                                      child: Text(
                                        'Contact US',
                                        style: k,
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
                                      style: k,
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
                                      style: k,
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
                              style: GoogleFonts.poppins(
                                fontSize: 25,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const PrivacyPolicy())));
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
                            OnHoverText(
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
                            OnHoverText(
                              builder: (isHoverd) {
                                final color =
                                    isHoverd ? Colors.orange : Colors.black;
                                return SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Cancellation Policy',
                                      style: k,
                                    ));
                              },
                            ),
                          ],
                        ),

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.w,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'Lepton Plus Communications OPC) Pvt.Ltd'
                                '\n5th Floor ,Karimpanal Statue Avenue ,G.H. Road, ',
                                style: k,
                              ),
                              Text(
                                'Statue ,Thiruvananthapuram-695001. Kerala , India',
                                style: k,
                              ),
                              Text(
                                '+91 97469 66651 | +91 97463 66651 | +91 471 4053483	',
                                style: k,
                              ),
                              Text(
                                'info@leptoncommunications.com,',
                                style: k,
                              ),
                              Text('leptoncommunications@gmail.com', style: k),
                            ]),
 ],
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
                    'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to providing high end sustainable products and services that\nenhances the quality of life',
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(255, 255, 255, 1)),
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
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
            ],
              ),
            ),
          ),
        
      
    
                  ),
                  Container(
                    color: Colors.blueAccent,
                    margin: EdgeInsets.only(left: screenSize.width*0.1,top: screenSize.height*3.13-screenSize.width*0.5),
                    height: screenSize.width*0.2,
                    width: screenSize.width-screenSize.width*0.2,
                  
                  ),

  ]),
            ]
  ),
        )
      

      
                  
                
              
            
          
        
        :
         Column(children: [
          Padding(
            padding: EdgeInsets.only(right: 80.0.w, left: 80.w),
            child: SizedBox(
              //
              height: 60.w,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    //color: cBlue,
                    width: 400.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '+91 8891436651',
                              style: GoogleFonts.poppins(
                                  color: adminePrimayColor,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.mail),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'leptondujo@gmail.com',
                              style: GoogleFonts.poppins(
                                  color: adminePrimayColor,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
                  SizedBox(width: 20.w),
           
                  Padding(
                    padding: EdgeInsets.only(left: 220.w),
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Enter Your School ID'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      GetSchoolListDropDownButton()
                                    ],
                                    // children: [
                                    //   // TextFormField(
                                    //   //   controller:schoolIdController,
                                    //   // )
                                    // ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () async {
                                      if (schoolListValue['docid'] == null) {
                                        return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Alert'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        'Sorry you have no access to delete')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        await Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const LoginScreen();
                                          },
                                        ));
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontSize: 18.w,
                              fontWeight: FontWeight.bold,
                              color: cred),
                        ),
                      ), 
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: Container(
                    //  width: MediaQuery.of(context).size.width / 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        
                          InkWell(
                            onTap: () {
                         //     _launchFacebookUrl();
                            },
                            child: Image.asset(
                              'assets/images/frdd.png',
                              height: 25.h,
                              width: 38.w,
                              color: adminePrimayColor,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                           //   _launchInstaUrl();
                            },
                            child: Image.asset(
                              'assets/images/instag.png',
                              height: 40.h,
                              width: 40.w,
                              color: adminePrimayColor,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                          //    _launchTwitterUrl();
                            },
                            child: Image.asset(
                              'assets/images/twitt.png',
                              height: 29.h,
                              width: 30.w,
                              color: adminePrimayColor,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                            //  _launchyouTubeUrl() ;
                            },
                            child: Image.asset(
                              'assets/images/utube.png',
                              height: 28.h,
                              width: 28.w,
                              color: adminePrimayColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 80.0.w,
              left: 80.w,
            ),
            child: SizedBox(
              // color: cBlue,
              width: MediaQuery.of(context).size.width,
              height: 500.h,
              // color: Color.fromARGB(255, 142, 234, 243),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                    //  / mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180.w,
                          child: Image.asset(
                            'assets/images/leptdujo.png',
                            // color: adminePrimayColor.withOpacity(0.5),
                            width: 170.w,
                            height: 170.h,
                          ),
                        ),
                        // sizedBoxH40,
                        // sizedBoxH40,
                        // sizedBoxH20,
                        Padding(
                          padding: EdgeInsets.only(top: 120.h),
                          child: Text(
                            'Watch And Guide,\nLet Them Study',
                            style: GoogleFonts.montserrat(
                              fontSize: 50.w,
                              fontWeight: FontWeight.bold,
                              color: adminePrimayColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          //padding: EdgeInsets.all(20),
                          height: 60.h,
                          minWidth: 250.w,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SchoolProfile();
                              },
                            ));
                          },
                          color: adminePrimayColor,
                          child: Text(
                            'Create School Profile',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16.w,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                   
                  ]),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Dujo Kerala Schools',
                style: GoogleFonts.poppins(
                    fontSize: 20.w,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.7)),
              ),
              Text(
                'Dujo Kerala Colleges',
                style: GoogleFonts.poppins(
                    fontSize: 20.w,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.7)),
              ),
              Text('Dujo Customize',
                  style: GoogleFonts.poppins(
                      fontSize: 20.w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7))),
            ],
          ),
          GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(9, (index) {
                return Center(
                    child: SizedBox(
                  height: 500,
                  width: 500,
                  child: GestureDetector(
                    onTap: () {
                        
                    },
                    child: Card(
                        color: Colors.white.withOpacity(0.5),
                        elevation: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [

                            SizedBox(
                              height: 20,
                            ),
                          ]
                        )),
                  ),
                ));
              })),
            // const SizedBox(height: 100,),
          //FooterHomeP()
               ]),
            
    )
   );
 }
}
TextStyle k = GoogleFonts.poppins();