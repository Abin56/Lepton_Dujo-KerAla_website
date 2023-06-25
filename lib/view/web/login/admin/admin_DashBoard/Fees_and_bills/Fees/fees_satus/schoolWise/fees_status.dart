import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_bills_controller.dart';
import '../../fees_notification/widgets/fees_left_side_widget.dart';
import 'fees_class_status.dart';

class FeesStstatues extends StatelessWidget {
  FeesStstatues({super.key});

  final FeesBillsController feesBillsController =
      Get.put(FeesBillsController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          FeesHalfContainerWidget(
              screenSize: screenSize, text: 'Fees Catergories'),
          Expanded(
            child: FutureBuilder(
              future: feesBillsController.fetchCategoryList(),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FeesClassStatus(
                                      feesCategory: snapshot.data?[index]
                                          ["id"]),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(211, 122, 117, 117)
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
                                    text: snapshot.data?[index]["categoryName"],
                                    fontsize: 15.w,
                                    color: cBlack,
                                    fontWeight: FontWeight.w600),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
