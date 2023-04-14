import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_button.dart';

class FeesUpdates extends StatefulWidget {
  const FeesUpdates({super.key});

  @override
  State<FeesUpdates> createState() => _FeesUpdatesState();
}

class _FeesUpdatesState extends State<FeesUpdates> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FEES'),
        backgroundColor: adminePrimayColor,
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi Admin ',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width / 20,
                  ),
                  Text(
                    'Welcome  ',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(
                    height: screenSize.width / 5,
                    width: screenSize.width / 2,
                    child: LottieBuilder.network(
                        'https://assets5.lottiefiles.com/packages/lf20_SyUX5x.json'),
                  )
                  //       SizedBox(
                  // height: 400,
                  // width: 600,
                  // child: LottieBuilder.asset(
                  //     "assets/images/")),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width / 8),
              child: Container(
                height: screenSize.height * 1 / 1,
                width: screenSize.width * 1 / 4,
                child: Padding(
                  padding: EdgeInsets.only(top: screenSize.width / 18),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         ,
                            //   ),
                            // );
                          },
                          child: Container(
                              height: screenSize.width * 1 / 10,
                              width: screenSize.width * 1 / 3.7,
                              child: CustomButton(
                                text: "Create Invoices",
                                onTap: () {},
                              )
                              // color: Colors.red,
                              ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //        Meeting,
                                //   ),
                                // );
                              },
                              child: Container(
                                height: screenSize.width * 1 / 10,
                                width: screenSize.width * 1 / 3.7,
                                child: CustomButton(
                                  text: 'Edit Invoices',
                                  onTap: () {},
                                ),
                                // color: Colors.red,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         NoticeUpdates(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: CustomButton(
                              text: 'Remove Invoices',
                              onTap: () {},
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
