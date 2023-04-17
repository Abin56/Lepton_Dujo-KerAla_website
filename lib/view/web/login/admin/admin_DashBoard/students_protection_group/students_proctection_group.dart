import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import 'package:dujo_kerala_website/model/admin_models/student_protection_model/student_protection_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/widgets/student_protection_dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import 'widgets/student_protection_card_widget.dart';
import 'widgets/student_protection_left_side_widget.dart';

class StudentProtectionGroup extends StatelessWidget {
  StudentProtectionGroup({super.key});

  final StudentProtectionController studentProtectionController = Get.put(
    StudentProtectionController(),
  );

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: adminePrimayColor,
      appBar: AppBar(
        title: const Text('Student ProtectionGroup'),
        backgroundColor: adminePrimayColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<StudentProtectionController>().clearField();
          showDialogueStudentProtection(
              context, 'Create', () => createFunction(context), '', '', '');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection('StudentProtection')
              .snapshots(),
          builder: (context, snapshot) {
            final headMasterData = snapshot.data?.docs.firstWhereOrNull(
                (element) => element.data()["id"] == "headMaster");
            final chaiPersonData = snapshot.data?.docs.firstWhereOrNull(
                (element) => element.data()["id"] == "chairPerson");
            final presidentData = snapshot.data?.docs.firstWhereOrNull(
                (element) => element.data()["id"] == "president");
            final vicePresidentData = snapshot.data?.docs.firstWhereOrNull(
                (element) => element.data()["id"] == "vicePresident");
            final representativeData = snapshot.data?.docs.firstWhereOrNull(
                (element) => element.data()["id"] == "representative");
            return Row(
              children: [
                SingleChildScrollView(
                  child: LeftSideWidget(
                    screenSize: screenSize,
                    headMasterData: headMasterData,
                    chaiPersonData: chaiPersonData,
                    presidentData: presidentData,
                    vicePresidentData: vicePresidentData,
                    representativeData: representativeData,
                  ),
                ),
                const VerticalDivider(
                  thickness: 5,
                  color: Colors.black,
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('SchoolListCollection')
                          .doc(Get.find<AdminLoginScreenController>().schoolID)
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
                              (index) => CardWidget(
                                firstName:
                                    snapshot.data!.docs[index].data()['name'],
                                secondName: snapshot.data!.docs[index]
                                    .data()['designation'],
                                thirdName: snapshot.data!.docs[index]
                                    .data()['position'],
                                imageUrl: snapshot.data!.docs[index]
                                    .data()['imageUrl'],
                                iconData: Icons.delete,
                                imageId: snapshot.data!.docs[index]
                                    .data()['imageId'],
                                memberid:
                                    snapshot.data!.docs[index].data()['id'],
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text('No Data Found'),
                          );
                        }
                      }),
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
    } else if (screenWidth >= 900) {
      return 3;
    } else if (screenWidth >= 600) {
      return 2;
    } else {
      return 1;
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
      child: Text("MEMBER IN SPG",
          style: GoogleFonts.alumniSans(
              fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

void createFunction(BuildContext context) {
  Get.find<StudentProtectionController>().addStudentProtectionGroupMember(
      StudentProtectionGroupModel(
        name: Get.find<StudentProtectionController>().nameController.text,
        position:
            Get.find<StudentProtectionController>().positionController.text,
        designation:
            Get.find<StudentProtectionController>().designationController.text,
        id: '',
        imageUrl:
            Get.find<StudentProtectionController>().imageData['imageUrl'] ?? "",
        imageId:
            Get.find<StudentProtectionController>().imageData['imageId'] ?? "",
      ),
      context);
}
