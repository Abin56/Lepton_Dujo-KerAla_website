// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/all_teachers_controller/all_teachers_controller.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/search_teacher.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/teacher_section/teacherDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/teachersList/teachers_list.dart';
import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class ListOfSchoolTeachers extends StatelessWidget {
  AllTeachersController allTeachersController =
      Get.put(AllTeachersController());
  String schoolID;
  final getxController = Get.put(TeachersProfileList());
  ListOfSchoolTeachers({required this.schoolID, super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _showSearch() async {
      await showSearch(context: context, delegate: SearchTeachers());
    }

    List<TeacherModel> allData = [];
    int columnCount = 3;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Teachers List'),
          backgroundColor: adminePrimayColor),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolID)
            .collection('Teachers')
            .orderBy('teacherName', descending: false)
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
                  child: Row(
                    children: [
                      Text(
                        "T e a c h e r s List",
                        style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      InkWell(
                        child: Container(
                          width: screenSize.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _showSearch();
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 19,
                                    )),
                                sizedBoxw10,
                                Text(
                                  "Search",
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          _showSearch();
                        },
                      )
                    ],
                  ),
                ),
                sizedBoxH20,
                Expanded(
                  child: Row(
                    children: [
                      TeacherDeatils(
                          schooilID: schoolID,
                          getxController: getxController,
                          allData: allData),
                      Container(
                        height: double.infinity - 10,
                        width: 2,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: AnimationLimiter(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.all(w / 60),
                            crossAxisCount: columnCount,
                            children: List.generate(
                              snapshot.data!.docs.length,
                              (int index) {
                                TeacherModel data = TeacherModel.fromMap(
                                    snapshot.data!.docs[index].data());
                                allData.add(data);
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
                                          onTap: () async {
                                            allTeachersController
                                                .getTeacherDetails(
                                              context,
                                              data.imageUrl,
                                              data.teacherName,
                                              data.teacherEmail,
                                              data.teacherPhNo,
                                              data.employeeID,
                                              data.houseName,
                                              data.houseNumber,
                                              data.place,
                                              data.district,
                                              data.gender,
                                              data.altPhoneNo,
                                              data.docid!,
                                            );
                                          },
                                          child: SizedBox(
                                            height: 400,
                                            width: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                     CircleAvatar(
                                                      radius: 60.w,
                                                      child: CircleAvatar(
                                                        radius: 30.w,
                                                        backgroundImage: AssetImage(
                                                            'assets/images/teacherr.png'),
                                                      ),
                                                    ),
                                                    sizedBoxH10,
                                                    Text(
                                                      "T E A C H E R ${index + 1}",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 18.w,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    sizedBoxH10,
                                                    Text(
                                                      'Created Date : ${stringTimeToDateConvert(data.createdAt!)}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        fontSize: 14.w,
                                                      ),
                                                    ),
                                                    sizedBoxH10,
                                                    Text(
                                                      "Name : ${data.teacherName}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.w,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    ),
                                                    sizedBoxH10,
                                                    Text(
                                                      "Email : ${data.teacherEmail}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12.w,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Phone No  : ${data.teacherPhNo}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12.w ,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }
}
