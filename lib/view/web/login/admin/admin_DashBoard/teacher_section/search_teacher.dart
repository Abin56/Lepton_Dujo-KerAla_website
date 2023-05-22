import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/all_teachers_controller/all_teachers_controller.dart';
import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../constant/constant.dart';
import '../../../../../google_poppins_widget/google_poppins_widget.dart';

class SearchTeachers extends SearchDelegate {
  AllTeachersController allTeachersController =
      Get.put(AllTeachersController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear));
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection("Teachers")
            .snapshots(),
        builder: (context, snapshots) {
          var screenSize = MediaQuery.of(context).size;
          if (snapshots.hasData) {
            return Scaffold(
              // backgroundColor: Colors.transparent,
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    TeacherModel data = TeacherModel.fromMap(
                        snapshots.data!.docs[index].data());
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.grey,width: 0.5),
                        ),
                        height: screenSize.width / 8,
                        width: double.infinity,
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  allTeachersController.getTeacherDetails(
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
                                child: const CircleAvatar(
                                  radius: 60,
                                )),
                            sizedBoxw40,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(snapshots.data!.docs[index]['id']),
                                  Text(
                                    data.teacherName!,
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  sizedBoxH10,
                                  Text(
                                    'Employe ID. :${data.employeeID}',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),

                                  sizedBoxH10,
                                  Text(
                                    'Phone No :${data.teacherPhNo}',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshots.data!.docs.length),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<TeacherModel> buildSuggestionList;
    if (query.isEmpty) {
      buildSuggestionList = allTeachersController.searchTeachers;
    } else {
      buildSuggestionList = allTeachersController.searchTeachers
          .where((item) =>
              item.teacherName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    if (buildSuggestionList.isEmpty) {
      return ListTile(
        title: GooglePoppinsWidgets(text: "Result not Found", fontsize: 18),
      );
    } else {
      return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              final screenSize = MediaQuery.of(context).size;

              return GestureDetector(
                onTap: () {
                  final data = allTeachersController.searchTeachers[index];

                  allTeachersController.getTeacherDetails(
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
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: screenSize.width / 8,
                    width: double.infinity,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              final data =
                                  allTeachersController.searchTeachers[index];
                            },
                            child: const CircleAvatar(
                              radius: 60,
                            )),
                        sizedBoxw40,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(snapshots.data!.docs[index]['id']),
                              Text(
                                buildSuggestionList[index].teacherName!,
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                              sizedBoxH10,
                              Text(
                                'Employee ID. :${buildSuggestionList[index].employeeID}',
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              sizedBoxH10,

                              sizedBoxH10,
                              Text(
                                'Phone No :${buildSuggestionList[index].teacherPhNo}',
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: buildSuggestionList.length),
      );
    }
  }
}
