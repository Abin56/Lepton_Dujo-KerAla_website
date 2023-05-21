import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/shift_class/shift_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/shitft_class_controller/shift_class_controller.dart';
import '../../../../../fonts/fonts.dart';

class ShiftClassPage extends StatelessWidget {
  ShiftClassPage({super.key});

  final ShiftClassController shiftClassController =
      Get.put(ShiftClassController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Row(children: [
        Container(
          color: const Color.fromARGB(255, 12, 34, 133),
          height: screenSize.height,
          width: screenSize.width * 1 / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  shiftClassController.clearData();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                    color: Colors.white, size: 25.w, weight: 900),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi  ',
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
                      'Shift your class',
                      style: ralewayStyle.copyWith(
                        fontSize: 25.0,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width / 5.5,
                      width: screenSize.width / 2,
                      child: LottieBuilder.network(
                          "https://assets10.lottiefiles.com/private_files/lf30_6if6i6i8.json"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 200.w),
          height: 100.w,
          width: 380.w,
          decoration: BoxDecoration(
              color: cWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.w))),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Select Class'),
                    content: Container(
                      height: 50.w,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 238, 238, 238)),
                        //borderRadius: BorderRadius.circular(13),
                      ),
                      child: FutureBuilder(
                          future: shiftClassController.fetchOldClass(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Obx(() => DropdownButton(
                                    value:
                                        shiftClassController.oldClassId.value,
                                    hint: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Select Class",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 18.w),
                                      ),
                                    ),
                                    underline: const SizedBox(),
                                    style: TextStyle(
                                      fontSize: 18.w,
                                      color: Colors.black,
                                    ),
                                    icon: const Padding(
                                      padding: EdgeInsets.all(
                                        13,
                                      ),
                                      child: Icon(Icons.arrow_drop_down,
                                          size: 18, color: Colors.grey),
                                    ),
                                    isExpanded: true,
                                    items: snapshot.data?.map(
                                      (val) {
                                        return DropdownMenuItem<String>(
                                          value: val.docid,
                                          child: Text(val.className),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (val) {
                                      if (val != null) {
                                        shiftClassController.oldClassId.value =
                                            val;
                                      }
                                    },
                                  ));
                            } else {
                              return const Center(
                                child: Text("No data found"),
                              );
                            }
                          }),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0.w),
                            child: MaterialButton(
                                color: Colors.red,
                                onPressed: () {
                                  shiftClassController.clearData();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                )),
                          ),
                          MaterialButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ShiftClassStudents(),
                                ));
                              },
                              child: Text(
                                'Ok',
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: GoogleMonstserratWidgets(
              text: 'Shift Your Class',
              fontsize: 20.w,
            ),
          ),
        ),
      ])
    ])));
  }
}
