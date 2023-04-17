import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import 'student_protection_card_widget.dart';

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget({
    super.key,
    required this.screenSize,
    required this.headMasterData,
    required this.chaiPersonData,
    required this.presidentData,
    required this.vicePresidentData,
    required this.representativeData,
  });

  final Size screenSize;
  final QueryDocumentSnapshot<Map<String, dynamic>>? headMasterData;
  final QueryDocumentSnapshot<Map<String, dynamic>>? chaiPersonData;
  final QueryDocumentSnapshot<Map<String, dynamic>>? presidentData;
  final QueryDocumentSnapshot<Map<String, dynamic>>? vicePresidentData;
  final QueryDocumentSnapshot<Map<String, dynamic>>? representativeData;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                CardWidget(
                  firstName: headMasterData?.data()["name"] ?? "name",
                  secondName: headMasterData?.data()["position"] ?? "position",
                  thirdName:
                      headMasterData?.data()["designation"] ?? "designation",
                  iconData: Icons.edit,
                  imageId: headMasterData?.data()["imageId"] ?? "",
                  memberid: headMasterData?.data()["id"] ?? "headMaster",
                  imageUrl: headMasterData?.data()["imageUrl"],
                ),
                sizedBoxH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CardWidget(
                          firstName: chaiPersonData?.data()["name"] ?? "name",
                          secondName:
                              chaiPersonData?.data()["position"] ?? "position",
                          thirdName: chaiPersonData?.data()["designation"] ??
                              "designation",
                          iconData: Icons.edit,
                          imageId: chaiPersonData?.data()["imageId"] ??
                              "chairPerson",
                          memberid:
                              chaiPersonData?.data()["id"] ?? "chairPerson",
                          imageUrl: chaiPersonData?.data()["imageUrl"]),
                    ),
                    Flexible(
                      child: CardWidget(
                          firstName: presidentData?.data()["name"] ?? "name",
                          secondName:
                              presidentData?.data()["position"] ?? "position",
                          thirdName: presidentData?.data()["designation"] ??
                              "designation",
                          iconData: Icons.edit,
                          imageId:
                              presidentData?.data()["imageId"] ?? "president",
                          memberid: presidentData?.data()["id"] ?? "president",
                          imageUrl: presidentData?.data()["imageUrl"]),
                    ),
                  ],
                ),
                sizedBoxH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: CardWidget(
                          firstName:
                              vicePresidentData?.data()["name"] ?? "name",
                          secondName: vicePresidentData?.data()["position"] ??
                              "position",
                          thirdName: vicePresidentData?.data()["designation"] ??
                              "designation",
                          iconData: Icons.edit,
                          imageId: vicePresidentData?.data()["imageId"] ??
                              "vicePresident",
                          memberid: vicePresidentData?.data()["id"] ??
                              "vicePresident",
                          imageUrl: vicePresidentData?.data()["imageUrl"]),
                    ),
                    Flexible(
                      child: CardWidget(
                          firstName:
                              representativeData?.data()["name"] ?? "name",
                          secondName: representativeData?.data()["position"] ??
                              "position",
                          thirdName:
                              representativeData?.data()["designation"] ??
                                  "designation",
                          iconData: Icons.edit,
                          imageId: representativeData?.data()["imageId"] ??
                              "representative",
                          memberid: representativeData?.data()["id"] ??
                              "representative",
                          imageUrl: representativeData?.data()["imageUrl"]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
