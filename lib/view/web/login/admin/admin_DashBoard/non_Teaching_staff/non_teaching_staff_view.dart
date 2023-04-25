import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/teachersList/teachers_list.dart';
import 'package:dujo_kerala_website/model/profileextraDetails/teacher_extra_profile.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/teacherDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NonTeachingStaffView extends StatelessWidget {
  String schoolID;
  final getxController = Get.put(TeachersProfileList());
  NonTeachingStaffView({super.key, required this.schoolID});

  @override
  Widget build(BuildContext context) {
    List<AddExtraDetailsofTeacherModel> allData = [];
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Non Teaching Staff List',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: adminePrimayColor),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolID)
            .collection('NonTeachingStaffs')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "N o n   T e a c h i n g   S t a f f s   List",
                    style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                sizedBoxH20,
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('SchoolListCollection')
                          .doc(schoolID)
                          .collection('NonTeachingStaffs')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          Text('No Staffs Added');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Row(
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Non Teaching Staffs",
                                    style: GoogleFonts.montserrat(
                                        color: Color.fromARGB(255, 75, 75, 75),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  LottieBuilder.network(
                                      'https://assets1.lottiefiles.com/packages/lf20_m2aybuxx.json'),
                                ],
                              ),
                            ),
                            Flexible(
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('SchoolListCollection')
                                      .doc(schoolID)
                                      .collection('NonTeachingStaffs')
                                      .snapshots(),
                                  builder: ((context, snapshot) {
                                    if(snapshot.hasError){
                                      return Center(child: Text('No Data'),);
                                    }

                                    if(snapshot.connectionState == ConnectionState.waiting){
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: CircleAvatar(
                                                    radius: 90,
                                                    child: Image.asset('assets/images/steward.png'), 
                                                    backgroundColor: Colors.blue,
                                                  ),
                                                ),
                                                Text(snapshot.data!
                                                    .docs[index]['staffName'], style:   GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),), sizedBoxH10, 
                                                                       Text('Designation: '+ snapshot.data!
                                                    .docs[index]['designation'], style:   GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),)                                            ],
                                            ),
                                          );
                                        });
                                  })),
                            )
                          ],
                        );
                      }),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }
}
