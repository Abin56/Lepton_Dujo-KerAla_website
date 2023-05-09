import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../fonts/google_monstre.dart';
import '../login/loginscreen.dart';
import '../widgets/drop_DownList/schoolDropDownList.dart';
import '../widgets/sample/under_maintance.dart';
import 'create_school/create_school.dart';
import 'footer/footerhomep.dart';

class HomeP extends StatelessWidget {
  HomeP({super.key});

  final Uri _faceBookUrl =
      Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
  final Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
  final Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
  final Uri _utubeUrl =
      Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
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

  List<String> containerNames = [
    'Aided Schools',
    'Unaided Schoools',
    'Government Schools',
    'Aided Colleges',
    'Unaided Colleges',
    'Government Colleges',
    'Engineering',
    'Medical',
    'Others'
  ];

  List<String> lottieFiles = [
    'https://assets7.lottiefiles.com/private_files/lf30_CrFtpW.json',
    'https://assets7.lottiefiles.com/private_files/lf30_c3gZyd.json',
    'https://assets7.lottiefiles.com/private_files/lf30_G9r0Hr.json',
    'https://assets4.lottiefiles.com/private_files/lf30_pkxipgnh.json',
    'https://assets4.lottiefiles.com/private_files/lf30_pkxipgnh.json',
    'https://assets4.lottiefiles.com/private_files/lf30_pkxipgnh.json',
    'https://assets5.lottiefiles.com/packages/lf20_geumvtzy.json',
    'https://assets8.lottiefiles.com/packages/lf20_ibbakwps.json',
    'https://assets1.lottiefiles.com/packages/lf20_DkWbCBx3kE.json'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: const [
              Colors.white,

              adminePrimayColor,
              // Color.fromRGBO(189, 63, 50, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.4.w,
              2.w,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: [
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '+91 8891436651',
                              style: GoogleFonts.poppins(
                                  color: adminePrimayColor,
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.mail),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'leptondujo@gmail.com',
                              style: GoogleFonts.poppins(
                                  color: adminePrimayColor,
                                  fontSize: 14.w,
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
                  Container(
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UnderMaintanceScreen(),
                                  ));
                            },
                            child: GoogleMonstserratWidgets(
                              text: 'DuJo Tutions',
                              fontsize: 15.w,
                              color: adminePrimayColor,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(width: 20.w),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UnderMaintanceScreen(),
                                  ));
                            },
                            child: GoogleMonstserratWidgets(
                              text: 'DuJo Institutions',
                              fontsize: 15.w,
                              color: adminePrimayColor,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  ),
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
                    padding: EdgeInsets.only(left: 40.w),
                    child: Container(
                      //  width: MediaQuery.of(context).size.width / 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              _launchFacebookUrl();
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
                              _launchInstaUrl();
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
                              _launchTwitterUrl();
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
                              _launchyouTubeUrl();
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
                    SizedBox(
                      width: 600.w,
                      child: ShaderMask(
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
                              child: Positioned(
                                  left: -100,
                                  child: Image.asset(
                                    'assets/images/boy.png',
                                    width: 300.w,
                                    height: 300.h,
                                  )),
                            ),
                            Positioned(
                                left: 210,
                                child: Image.asset(
                                  'assets/images/pngegg.png',
                                  width: 400.w,
                                  height: 400.h,
                                )),
                            Positioned(
                                left: 100,
                                child: Image.asset(
                                  'assets/images/girl.png',
                                  width: 400.w,
                                  height: 400.h,
                                  fit: BoxFit.contain,
                                )),
                          ],
                        ),
                      ),
                    )
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => pages[index])));
                    },
                    child: Card(
                        color: Colors.white.withOpacity(0.5),
                        elevation: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   '',
                            //   width: 50,
                            //   height: 50,
                            // ),
                            LottieBuilder.network(
                              lottieFiles[index],
                              width: 220,
                              height: 220,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              containerNames[index],
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: adminePrimayColor,
                              ),
                            )
                          ],
                        )),
                  ),
                ));
              })),
          const SizedBox(
            height: 100,
          ),
          FooterHomeP()
        ]),
      ),
    );
  }
}

class UiContainer extends StatelessWidget {
  const UiContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 700, left: 700, top: 100, bottom: 100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 200,
          width: 100,
        ));
  }
}
