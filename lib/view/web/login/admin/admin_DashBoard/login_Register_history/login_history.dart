import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/loginHistory_model/login_history_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/google_monstre.dart';

class AdminLoginDetailsScreen extends StatelessWidget {
  String schoolID;
  String dateId;
  AdminLoginDetailsScreen(
      {required this.schoolID, required this.dateId, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 13, 204, 204),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Admin Login Register"),
        backgroundColor: adminePrimayColor,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w),
              // color: Color.fromARGB(255, 13, 204, 204),
              // height: size.height * 1.4,
              width: 1510.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: SizedBox(
                          width: screenSize.width * 0.032,
                          //color: Color.fromARGB(255, 63, 181, 102),
                          child: Center(
                            child: GoogleMonstserratWidgets(
                                text: 'Sl no',
                                fontsize: 15.w,
                                color: cBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          //color: cBlue,
                          alignment: Alignment.centerLeft,
                          width: screenSize.width * 0.39,
                          child: Center(
                            child: GoogleMonstserratWidgets(
                              text: 'ID ',
                              fontsize: 13.w,
                              color: cBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                          //   color: Colors.amber,
                          width: screenSize.width * 0.21,
                          child: Center(
                            child: GoogleMonstserratWidgets(
                                text: 'LoginTime ',
                                fontsize: 13.w,
                                color: cBlack,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        //   color: Colors.cyan,
                        width: screenSize.width * 0.22,
                        child: Center(
                          child: GoogleMonstserratWidgets(
                              text: 'LogOutTime',
                              fontsize: 13.w,
                              color: cBlack,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height,
                    //       width: screenSize.width * 1 / 2,
                    child: Flexible(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("SchoolListCollection")
                            .doc(
                                Get.find<AdminLoginScreenController>().schoolID)
                            .collection(Get.find<GetFireBaseData>().bYear.value)
                            .doc(Get.find<GetFireBaseData>().bYear.value)
                            .collection("LoginHistory")
                            .doc(dateId)
                            .collection(dateId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemBuilder: (context, index) {
                                  AdminLoginDetailHistoryModel data =
                                      AdminLoginDetailHistoryModel.fromMap(
                                          snapshot.data!.docs[index].data());
                                  return Padding(
                                    padding: EdgeInsets.only(top: 5.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: cWhite,
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
                                        // borderRadius: BorderRadius.all(Radius.circular(5.w))
                                      ),
                                      height: 60.w,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30.w),
                                              child: SizedBox(
                                                width: screenSize.width * 0.032,
                                                //9color: Color.fromARGB(255, 63, 181, 102),
                                                child: Center(
                                                  child:
                                                      GoogleMonstserratWidgets(
                                                          text: '${index + 1}',
                                                          fontsize: 15.w,
                                                          color: cBlack,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: Container(
                                                // color: cBlue,
                                                alignment: Alignment.centerLeft,
                                                width: screenSize.width * 0.39,
                                                child: Center(
                                                  child:
                                                      GoogleMonstserratWidgets(
                                                    text:
                                                        'ID  : ${data.adminuser}',
                                                    fontsize: 13.w,
                                                    color: cBlack,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            SizedBox(

                                                /// color: Colors.amber,
                                                width: screenSize.width * 0.21,
                                                child: Center(
                                                  child: GoogleMonstserratWidgets(
                                                      text:
                                                          'LoginTime  : ${data.loginTime}',
                                                      fontsize: 13.w,
                                                      color: cBlack,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            SizedBox(
                                              //color: Colors.cyan,
                                              width: screenSize.width * 0.22,
                                              child: Center(
                                                child: GoogleMonstserratWidgets(
                                                    text:
                                                        'LogOutTime  : ${data.logOutTime ?? 'Not found'}',
                                                    fontsize: 13.w,
                                                    color: cBlack,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.docs.length);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
