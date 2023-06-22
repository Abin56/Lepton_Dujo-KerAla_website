import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/admin_models/student_protection_model/student_protection_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/widgets/student_protection_dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../constant/constant.dart';
import 'widgets/student_protection_card_widget.dart';
import 'widgets/student_protection_left_side_widget.dart';

class StudentProtectionGroup extends StatelessWidget {
  StudentProtectionGroup({super.key});

  final StudentProtectionController studentProtectionController = Get.put(
    StudentProtectionController(),
  );
  StudentProtectionGroupModel? headMasterModel;
  StudentProtectionGroupModel? chairPersonModel;
  StudentProtectionGroupModel? presidentModel;
  StudentProtectionGroupModel? vicePresidentModel;
  StudentProtectionGroupModel? representativeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Member',
        onPressed: () async {
          studentProtectionController.clearField();
          await createStudentProtectionDialogue(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('StudentProtection')
              .snapshots(),
          builder: (context, snapshot) {
            assigningValueToModel(snapshot);
            return Row(
              children: [
                StudentProtectionLeftCardWidget(
                  headMasterModel: headMasterModel,
                  presidentModel: presidentModel,
                  vicePresidentModel: vicePresidentModel,
                  chairPersonModel: chairPersonModel,
                  representativeModel: representativeModel,
                ),
                sizedBoxW20,
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(Get.find<AdminLoginScreenController>()
                                    .schoolID)
                                .collection(
                                    Get.find<GetFireBaseData>().bYear.value)
                                .doc(Get.find<GetFireBaseData>().bYear.value)
                                .collection('StudentProtection')
                                .where(
                              "id",
                              whereNotIn: <String>[
                                "chairPerson",
                                "headMaster",
                                "president",
                                "representative",
                                "vicePresident"
                              ],
                            ).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.count(
                                  childAspectRatio: (1 / .9),
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  padding: const EdgeInsets.all(10),
                                  crossAxisCount: _getCrossAxisCount(context),
                                  children: List.generate(
                                    snapshot.data!.docs.length,
                                    (index) => StudentProtectionCardWidet(
                                      name: snapshot.data!.docs[index]
                                          .data()['name'],
                                      designation: snapshot.data!.docs[index]
                                          .data()['designation'],
                                      position: snapshot.data!.docs[index]
                                          .data()['position'],
                                      imageUrl: snapshot.data!.docs[index]
                                          .data()['imageUrl'],
                                      iconData: Icons.delete,
                                      imageId: snapshot.data!.docs[index]
                                          .data()['imageId'],
                                      memberId: snapshot.data!.docs[index]
                                          .data()['id'],
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text('No Data Found'),
                                );
                              }
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Members in group',
                              style: GoogleFonts.oswald(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: cBlack,
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return 3;
    } else if (screenWidth >= 600) {
      return 2;
    } else {
      return 1;
    }
  }

  void assigningValueToModel(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.hasData) {
      final QueryDocumentSnapshot<Map<String, dynamic>>? headMaster = snapshot
          .data?.docs
          .firstWhereOrNull((element) => element.id == "headMaster");
      final QueryDocumentSnapshot<Map<String, dynamic>>? chairPerson = snapshot
          .data?.docs
          .firstWhereOrNull((element) => element.id == "chairPerson");
      final QueryDocumentSnapshot<Map<String, dynamic>>? president = snapshot
          .data?.docs
          .firstWhereOrNull((element) => element.id == "president");
      final QueryDocumentSnapshot<Map<String, dynamic>>? vicePresident =
          snapshot.data?.docs
              .firstWhereOrNull((element) => element.id == "vicePresident");
      final QueryDocumentSnapshot<Map<String, dynamic>>? representative =
          snapshot.data?.docs
              .firstWhereOrNull((element) => element.id == "representative");

      if (headMaster != null) {
        headMasterModel =
            StudentProtectionGroupModel.fromJson(headMaster.data());
      }
      if (chairPerson != null) {
        chairPersonModel =
            StudentProtectionGroupModel.fromJson(chairPerson.data());
      }
      if (president != null) {
        presidentModel = StudentProtectionGroupModel.fromJson(president.data());
      }
      if (vicePresident != null) {
        vicePresidentModel =
            StudentProtectionGroupModel.fromJson(vicePresident.data());
      }

      if (representative != null) {
        representativeModel =
            StudentProtectionGroupModel.fromJson(representative.data());
      }
    }
  }
}

class StudentProtectionTextWidget extends StatelessWidget {
  const StudentProtectionTextWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        "MEMBER IN STUDENT PROTECTION GROUP",
        style: GoogleFonts.alumniSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
