import 'package:dujo_kerala_website/controller/school_approve/school_approve_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../controller/add_Newschool/add_new_schhol.dart';
import '../../../../../model/create_school_model/create_school_model.dart';
import '../../../../constant/constant.dart';
import '../../../widgets/button_container_widget.dart';

class RequestedSchoolsListScreen extends StatelessWidget {
  AddNewSchoolController addNewSchoolController =
      Get.put(AddNewSchoolController());
  SchoolApproveController schoolApproveController =
      Get.put(SchoolApproveController());

  RequestedSchoolsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Obx(() {
      if (schoolApproveController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (schoolApproveController.reqschools.isEmpty) {
        return const Center(
          child: Text("No Datas Found"),
        );
      } else {
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                  child: AnimationLimiter(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(_w / 60),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    schoolApproveController.reqschools.length,
                    (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        columnCount: columnCount,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                  height: _h / 1000,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      bottom: _w / 400,
                                      left: _w / 100,
                                      right: _w / 100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ButtonContainerWidget(
                                            curving: 10,
                                            colorindex: 0,
                                            height: 40,
                                            width: 130,
                                            child: Center(
                                              child: Text(
                                                stringTimeToDateConvert(
                                                    schoolApproveController
                                                        .reqschools[index]
                                                        .postedDate),
                                                style: GoogleFonts.poppins(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            schoolApproveController
                                                .reqschools[index].schoolName,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            schoolApproveController
                                                .reqschools[index].postedDate,
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH20,
                                          Text(
                                            "Country : India",
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            "State : Kerala",
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            "City : ${schoolApproveController.reqschools[index].district}",
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            "Place : ${schoolApproveController.reqschools[index].place}",
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH20,
                                          Text(
                                            "Email  : ${schoolApproveController.reqschools[index].email}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            "Password  : ${schoolApproveController.reqschools[index].password}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH10,
                                          Text(
                                            "Phone No  : ${schoolApproveController.reqschools[index].phoneNumber}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          sizedBoxH30,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await schoolApproveController
                                                      .approveFucntion(
                                                          schoolApproveController
                                                                  .reqschools[
                                                              index],
                                                          context);
                                                },
                                                child: ButtonContainerWidget(
                                                  curving: 10,
                                                  colorindex: 3,
                                                  height: 40,
                                                  width: 130,
                                                  child: Center(
                                                    child: Text(
                                                      "Approve",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  schoolApproveController
                                                      .rejectSchoolList(
                                                          schoolApproveController
                                                              .reqschools[index]
                                                              .docid);
                                                },
                                                child: ButtonContainerWidget(
                                                  curving: 10,
                                                  colorindex: 6,
                                                  height: 40,
                                                  width: 130,
                                                  child: Center(
                                                    child: Text(
                                                      "Reject",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ))
            ],
          )),
        );
      }
    });
  }
}
