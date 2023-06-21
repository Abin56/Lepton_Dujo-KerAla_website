import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fees_notification/widgets/fees_left_side_widget.dart';

class FeesStstatues extends StatelessWidget {
  const FeesStstatues({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          FeesHalfContainerWidget(screenSize: screenSize, text: 'Fees Status'),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // .withOpacity(0.9),
                        // border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(211, 122, 117, 117)
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 10.w,
                        ),
                        GoogleMonstserratWidgets(
                            text: '',
                            fontsize: 15.w,
                            color: cBlack,
                            fontWeight: FontWeight.w600),
                        GestureDetector(
                          onTap: () async {
                            showToast(msg: '');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    // color: cWhite
                                    ),
                                color: Colors.blue.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.w))),
                            width: 105.w,
                            height: 29.w,
                            child: Center(
                              child: GoogleMonstserratWidgets(
                                text: '',
                                fontsize: 13.w,
                                color: cBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
