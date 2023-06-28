import 'dart:developer';

import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../controller/fees_bills/fees_create_controller.dart';
import 'fees_class_students.dart';

class FeesClassStatus extends StatelessWidget {
  FeesClassStatus({super.key, required this.feesCategory});
  final FeesCreateController _feesCreateController =
      Get.put(FeesCreateController());

  final String feesCategory;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          FeesStatusContainerWidget(
              screenSize: screenSize, text: 'Fees class list'),
          Expanded(
            child: FutureBuilder(
                future: _feesCreateController.getAllClasses(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: snapshot.data?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(20.w),
                          child: GestureDetector(
                            onTap: () {
                              try {
                                if (snapshot.data != null &&
                                    snapshot.data![index].docid.isNotEmpty) {
                                  snapshot.data![index].docid;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FeesClassStudents(
                                          classId: snapshot.data![index].docid,
                                          feesCategory: feesCategory,
                                        ),
                                      ));
                                }
                              } catch (e) {
                                log(e.toString());
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              211, 122, 117, 117)
                                          .withOpacity(0.5),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.w),
                                  )),
                              height: 80.w,
                              width: 160.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  GoogleMonstserratWidgets(
                                    text: snapshot.data?[index].className ?? "",
                                    fontsize: 15.w,
                                    color: cBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class FeesStatusContainerWidget extends StatelessWidget {
  FeesStatusContainerWidget({
    super.key,
    required this.screenSize,
    required this.text,
  });

  final Size screenSize;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height - 10,
      width: 800.w,
      // height: screenSize.height,
      color: adminePrimayColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButtonBackWidget(
              color: cWhite,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hi ! Admin ',
                  style: ralewayStyle.copyWith(
                    fontSize: 40.0.w,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: screenSize.width / 20,
                ),
                Text(
                  text,
                  style: ralewayStyle.copyWith(
                    fontSize: 25.0.w,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 350.h,
                  width: 790.w,
                  child: LottieBuilder.network(
                      "https://assets1.lottiefiles.com/packages/lf20_ystsffqy.json"),
                )
              ],
            ),
          ]),
    );
  }
}
