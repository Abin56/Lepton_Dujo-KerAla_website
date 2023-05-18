import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/Iconbackbutton.dart';

class ShiftClassStudents extends StatefulWidget {
  const ShiftClassStudents({super.key});

  @override
  State<ShiftClassStudents> createState() => _ShiftClassStudentsState();
}

class _ShiftClassStudentsState extends State<ShiftClassStudents> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Row(children: [
      Container(
        color: const Color.fromARGB(255, 12, 34, 133),
        height: size.height * 1.4,
        width: size.width * 1 / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButtonBackWidget(color: cWhite),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi  ',
                    style: ralewayStyle.copyWith(
                      fontSize: 45.0.w,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width / 20,
                  ),
                  Text(
                    'Shift students to next class',
                    style: ralewayStyle.copyWith(
                      fontSize: 22.0.w,
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
        //
        height: screenSize.height * 1.4,
        width: screenSize.width * 1 / 2,

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          //    borderRadius: BorderRadius.all
          //  (Radius.circular(20.w))
        ),

        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 50.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GoogleMonstserratWidgets(
                          text: 'Class :',
                          fontsize: 20.w,
                          fontWeight: FontWeight.w600),
                      Container(
                        height: 50.w,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border
                              .all(), //borderRadius: BorderRadius.circular(13),
                        ),
                        child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Select Class",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                          items: [
                            "Class 1",
                            "Class 2",
                            "Class 3",
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                              var yourVar = val.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20.w,),

                  Row(
                    children: [
                      GoogleMonstserratWidgets(
                          text: 'Batch :',
                          fontsize: 20.w,
                          fontWeight: FontWeight.w600),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Container(
                          height: 50.w,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            //borderRadius: BorderRadius.circular(13),
                          ),
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Select Batch",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
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
                            items: [
                              "Batch 1",
                              "Batch 2",
                              "Batch 3",
                            ].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(() {
                                var yourVar = val.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.w),
                  height: screenSize.height,
                  width: 650.w,
                  decoration: BoxDecoration(
                      //border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10.w))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.w,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: GoogleMonstserratWidgets(
                                  text: 'slno',
                                  fontsize: 14.w,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GoogleMonstserratWidgets(
                                text: 'studentname',
                                fontsize: 14.w,
                                fontWeight: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.w),
                                  child: Center(
                                    child: GoogleMonstserratWidgets(
                                      text: "ADD",
                                      fontsize: 14.w,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        ShiftClassWidget(studentname: 'Student 1', slno: '1'),
                        SizedBox(
                          height: 20.w,
                        ),
                        ShiftClassWidget(
                          slno: '2',
                          studentname: 'Student 2',
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        ShiftClassWidget(
                          slno: '3',
                          studentname: 'Student 3',
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    ])));
  }
}

class ShiftClassWidget extends StatelessWidget {
  ShiftClassWidget({
    required this.studentname,
    required this.slno,
    super.key,
  });
  String slno;
  String studentname;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cWhite,
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 60.w,
      width: 600.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: GoogleMonstserratWidgets(
            text: slno,
            fontsize: 14.w,
            fontWeight: FontWeight.w600,
          ),
        ),
        sizedBoxW20,
        GoogleMonstserratWidgets(
          text: studentname,
          fontsize: 14.w,
          fontWeight: FontWeight.w600,
        ),
        sizedBoxW20,
        GestureDetector(
          onTap: () {
            showToast(msg: 'Added Sucessfully');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30.w,
              width: 80.w,
              decoration: const BoxDecoration(
                color: cBlue,
              ),
              child: Center(
                child: GoogleMonstserratWidgets(
                  text: "ADD",
                  fontsize: 14.w,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
