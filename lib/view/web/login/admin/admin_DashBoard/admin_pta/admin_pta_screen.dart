import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/admin_models/admin_pta_model/admin_pta_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_pta/widgets/admin_pta_card_widget.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_pta/widgets/admin_pta_dialogue_widget.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/Getx/admin/pta/pta_controller.dart';
import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../utils/screen_size.dart';
import '../../../../../constant/constant.dart';

class AdminPtaScreen extends StatelessWidget {
  AdminPtaScreen({super.key});

  final PtaController ptaController = Get.put(
    PtaController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('School PTA'),
      // backgroundColor: adminePrimayColor,
      //   elevation: 0,
      // ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Member',
        onPressed: () async {
          Get.find<PtaController>().clearField();
          await createAdminPtaDialogue(context);
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
              .collection('pta')
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
            RxList<AdminPtaModel> adminPtaModelList = RxList<AdminPtaModel>([]);

            for (String data in fields) {
              querySnapshotList.add(
                snapshot.data?.docs.firstWhereOrNull(
                    (element) => element.data()["id"] == data),
              );
            }
            for (var data in querySnapshotList) {
              if (data != null) {
                adminPtaModelList.add(
                  AdminPtaModel.fromJson(
                    data.data(),
                  ),
                );
              }
            }

            return Row(
              children: [
                SingleChildScrollView(
                    child: Container(
                  color: adminePrimayColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButtonBackWidget(
                            color: cWhite,
                          ),
                          Text(
                            "School PTA",
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: cWhite,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                        
                          SizedBox(
                            width: ScreenSize.width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    "PTA Executive Members",
                                    style: GoogleFonts.oswald(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: cWhite,
                                    ),
                                  ),
                                  sizedBoxH10,
                                  LeftSideCardWidget(
                                    querySnapshotList: querySnapshotList,
                                    adminPtaModelList: adminPtaModelList,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: LeftSideCardWidget(
                                          querySnapshotList: querySnapshotList,
                                          adminPtaModelList: adminPtaModelList,
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
                                          adminPtaModelList: adminPtaModelList,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        child: LeftSideCardWidget(
                                          querySnapshotList: querySnapshotList,
                                          adminPtaModelList: adminPtaModelList,
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
                                          adminPtaModelList: adminPtaModelList,
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
                      ),
                    ],
                  ),
                )),
                // const VerticalDivider(
                //   thickness: 5,
                //   color: Colors.black,
                // ),
                  sizedBoxW20,
                Expanded(
               
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(Get.find<AdminLoginScreenController>().schoolID)
                                .collection(Get.find<GetFireBaseData>().bYear.value)
                                .doc(Get.find<GetFireBaseData>().bYear.value)
                                .collection('pta')
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
                                    (index) => PtaCardWidget(
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
                      ),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Members In PTA',
                                     style: GoogleFonts.oswald(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: cBlack,)
                               ) ],
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
}

class LeftSideCardWidget extends StatelessWidget {
  const LeftSideCardWidget({
    super.key,
    required this.querySnapshotList,
    required this.adminPtaModelList,
    required this.index,
    required this.dataList,
    required this.positionData,
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>?> querySnapshotList;
  final RxList<AdminPtaModel> adminPtaModelList;
  final List<String> dataList;
  final List<String> positionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return PtaCardWidget(
      name: querySnapshotList[index] == null
          ? positionData[0]
          : adminPtaModelList[index].name,
      designation: querySnapshotList[index] == null
          ? positionData[1]
          : adminPtaModelList[index].designation,
      position: querySnapshotList[index] == null
          ? positionData[2]
          : adminPtaModelList[index].position,
      iconData: Icons.edit,
      imageId: dataList[index],
      memberId: dataList[index],
      imageUrl: querySnapshotList[index] == null
          ? null
          : adminPtaModelList[index].imageUrl,
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
      child: Text(
        "MEMBER IN PTA",
        style: GoogleFonts.alumniSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
