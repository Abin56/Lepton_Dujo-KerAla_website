import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:dujo_kerala_website/view/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';

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
      backgroundColor: Colors.white,
      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(
                    color: cWhite,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ! Admin ',
                          style: ralewayStyle.copyWith(
                            fontSize: 45.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.width / 40,
                        ),
                        Text(
                          'Fees Updates  ',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.width / 40,
                        ),
                        Text(
                          'Update FEES',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width / 8),
              child: SizedBox(
                height: screenSize.height * 1 / 1,
                width: screenSize.width * 1 / 4,
                child: Padding(
                  padding: EdgeInsets.only(top: screenSize.height / 4),
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
                          child: SizedBox(
                              height: screenSize.width * 1 / 15,
                              width: screenSize.width * 1 / 3,
                              child: CustomContainer(
                                text: "Create Invoices",
                                onTap: () {},
                              )
                              // color: Colors.red,
                              ),
                        ),
                      ),
                      sizedBoxH20,
                      Padding(
                          padding: const EdgeInsets.all(10),
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
                            child: SizedBox(
                              height: screenSize.width * 1 / 15,
                              width: screenSize.width * 1 / 3,
                              child: CustomContainer(
                                text: 'Edit Invoices',
                                onTap: () {},
                              ),
                              // color: Colors.red,
                            ),
                          )),
                      sizedBoxH20,
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
                          child: SizedBox(
                            height: screenSize.width * 1 / 15,
                            width: screenSize.width * 1 / 3,
                            child: CustomContainer(
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
