import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import 'package:dujo_kerala_website/model/admin_models/student_protection_model/student_protection_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/students_protection_group/widgets/student_protection_dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../constant/constant.dart';
import 'widgets/student_protection_card_widget.dart';

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
        onPressed: () async {
          Get.find<StudentProtectionController>().clearField();
          await createDialogue(context);
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
            List<String> fields = const <String>[
              "headMaster",
              "chairPerson",
              "president",
              "vicePresident",
              "representative"
            ];
            List<QueryDocumentSnapshot<Map<String, dynamic>>?>
                querySnapshotList = [];
            RxList<StudentProtectionGroupModel> studentProtectionModelList =
                RxList<StudentProtectionGroupModel>([]);

            for (String data in fields) {
              querySnapshotList.add(
                snapshot.data?.docs.firstWhereOrNull(
                    (element) => element.data()["id"] == data),
              );
            }
            for (var data in querySnapshotList) {
              if (data != null) {
                studentProtectionModelList.add(
                  StudentProtectionGroupModel.fromJson(
                    data.data(),
                  ),
                );
              }
            }

            return Row(
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "Student Protection Group",
                                style: GoogleFonts.oswald(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: cWhite),
                              ),
                            ),
                            LeftSideCardWidget(
                              querySnapshotList: querySnapshotList,
                              studentProtectionModelList:
                                  studentProtectionModelList,
                              index: 0,
                              dataList: fields,
                              positionData: const [
                                "Name",
                                "Head Master",
                                "Position"
                              ],
                            ),
                            sizedBoxH20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: LeftSideCardWidget(
                                    querySnapshotList: querySnapshotList,
                                    studentProtectionModelList:
                                        studentProtectionModelList,
                                    index: 1,
                                    dataList: fields,
                                    positionData: const [
                                      "Name",
                                      "President",
                                      "Position"
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: LeftSideCardWidget(
                                    querySnapshotList: querySnapshotList,
                                    studentProtectionModelList:
                                        studentProtectionModelList,
                                    index: 2,
                                    dataList: fields,
                                    positionData: const [
                                      "Name",
                                      "Vice President",
                                      "Position"
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            sizedBoxH20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: LeftSideCardWidget(
                                    querySnapshotList: querySnapshotList,
                                    studentProtectionModelList:
                                        studentProtectionModelList,
                                    index: 3,
                                    dataList: fields,
                                    positionData: const [
                                      "Name",
                                      "Chairman",
                                      "Position"
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: LeftSideCardWidget(
                                    querySnapshotList: querySnapshotList,
                                    studentProtectionModelList:
                                        studentProtectionModelList,
                                    index: 4,
                                    dataList: fields,
                                    positionData: const [
                                      "Name",
                                      "Vice Chairman",
                                      "Position"
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
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
                                name: snapshot.data!.docs[index].data()['name'],
                                designation: snapshot.data!.docs[index]
                                    .data()['designation'],
                                position: snapshot.data!.docs[index]
                                    .data()['position'],
                                imageUrl: snapshot.data!.docs[index]
                                    .data()['imageUrl'],
                                iconData: Icons.delete,
                                imageId: snapshot.data!.docs[index]
                                    .data()['imageId'],
                                memberId:
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
    } else if (screenWidth >= 600) {
      return 2;
    } else {
      return 1;
    }
  }
}

class LeftSideCardWidget extends StatelessWidget {
  const LeftSideCardWidget({
    super.key,
    required this.querySnapshotList,
    required this.studentProtectionModelList,
    required this.index,
    required this.dataList,
    required this.positionData,
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>?> querySnapshotList;
  final RxList<StudentProtectionGroupModel> studentProtectionModelList;
  final List<String> dataList;
  final List<String> positionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      name: querySnapshotList[index] == null
          ? positionData[0]
          : studentProtectionModelList[index].name,
      designation: querySnapshotList[index] == null
          ? positionData[1]
          : studentProtectionModelList[index].designation,
      position: querySnapshotList[index] == null
          ? positionData[2]
          : studentProtectionModelList[index].position,
      iconData: Icons.edit,
      imageId: querySnapshotList[index] == null
          ? ""
          : studentProtectionModelList[index].imageId,
      memberId: dataList[index],
      imageUrl: querySnapshotList[index] == null
          ? null
          : studentProtectionModelList[index].imageUrl,
    );
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
