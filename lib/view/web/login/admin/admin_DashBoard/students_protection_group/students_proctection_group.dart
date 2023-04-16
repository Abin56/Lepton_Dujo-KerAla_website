import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import 'package:dujo_kerala_website/model/admin_models/student_protection_model/student_protection_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../constant/constant.dart';

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
          backgroundColor: Colors.blue),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                              CardWidget(
                                firstName:
                                    headMasterData?.data()["name"] ?? "name",
                                secondName:
                                    headMasterData?.data()["position"] ??
                                        "position",
                                thirdName:
                                    headMasterData?.data()["designation"] ??
                                        "designation",
                                iconData: Icons.edit,
                                imageId:
                                    headMasterData?.data()["imageId"] ?? "",
                                memberid: headMasterData?.data()["id"] ??
                                    "headMaster",
                                imageUrl: headMasterData?.data()["imageUrl"] ??
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
                              ),
                              sizedBoxH20,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: CardWidget(
                                      firstName:
                                          chaiPersonData?.data()["name"] ??
                                              "name",
                                      secondName:
                                          chaiPersonData?.data()["position"] ??
                                              "position",
                                      thirdName: chaiPersonData
                                              ?.data()["designation"] ??
                                          "designation",
                                      iconData: Icons.edit,
                                      imageId:
                                          chaiPersonData?.data()["imageId"] ??
                                              "chairPerson",
                                      memberid: chaiPersonData?.data()["id"] ??
                                          "chairPerson",
                                      imageUrl: chaiPersonData
                                              ?.data()["imageUrl"] ??
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
                                    ),
                                  ),
                                  Flexible(
                                    child: CardWidget(
                                      firstName:
                                          presidentData?.data()["name"] ??
                                              "name",
                                      secondName:
                                          presidentData?.data()["position"] ??
                                              "position",
                                      thirdName: presidentData
                                              ?.data()["designation"] ??
                                          "designation",
                                      iconData: Icons.edit,
                                      imageId:
                                          presidentData?.data()["imageId"] ??
                                              "president",
                                      memberid: presidentData?.data()["id"] ??
                                          "president",
                                      imageUrl: presidentData
                                              ?.data()["imageUrl"] ??
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
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
                                    child: CardWidget(
                                      firstName:
                                          vicePresidentData?.data()["name"] ??
                                              "name",
                                      secondName: vicePresidentData
                                              ?.data()["position"] ??
                                          "position",
                                      thirdName: vicePresidentData
                                              ?.data()["designation"] ??
                                          "designation",
                                      iconData: Icons.edit,
                                      imageId: vicePresidentData
                                              ?.data()["imageId"] ??
                                          "vicePresident",
                                      memberid:
                                          vicePresidentData?.data()["id"] ??
                                              "vicePresident",
                                      imageUrl: vicePresidentData
                                              ?.data()["imageUrl"] ??
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
                                    ),
                                  ),
                                  Flexible(
                                    child: CardWidget(
                                      firstName:
                                          representativeData?.data()["name"] ??
                                              "name",
                                      secondName: representativeData
                                              ?.data()["position"] ??
                                          "position",
                                      thirdName: representativeData
                                              ?.data()["designation"] ??
                                          "designation",
                                      iconData: Icons.edit,
                                      imageId: representativeData
                                              ?.data()["imageId"] ??
                                          "representative",
                                      memberid:
                                          representativeData?.data()["id"] ??
                                              "representative",
                                      imageUrl: representativeData
                                              ?.data()["imageUrl"] ??
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
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

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.imageUrl,
    required this.iconData,
    required this.memberid,
    required this.imageId,
  });

  final String firstName;
  final String secondName;
  final String thirdName;

  final String imageUrl;
  final IconData iconData;
  final String memberid;
  final String imageId;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 200,
        child: Column(
          children: <Widget>[
            sizedBoxH10,
            FittedBox(
              child: CircleAvatar(
                maxRadius: MediaQuery.of(context).size.width * .03,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            FittedBox(
              child: Text(
                firstName,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                secondName,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                thirdName,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                FittedBox(
                  child: IconButton(
                    onPressed: () {
                      if (iconData == Icons.remove) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Remove'),
                              content: const Text(
                                  'Are you sure you want to remove this Notice'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await Get.find<
                                            StudentProtectionController>()
                                        .removeMember(memberid, imageId);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Remove'),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        final StudentProtectionController
                            studentProtectionController =
                            Get.find<StudentProtectionController>();

                        studentProtectionController.nameController.text =
                            firstName;
                        studentProtectionController.positionController.text =
                            secondName;
                        studentProtectionController.designationController.text =
                            thirdName;
                        showDialogueStudentProtection(context, 'edit', () {
                          Get.find<StudentProtectionController>()
                              .updateStudentProtectionMemberDetail(
                                  memberid,
                                  StudentProtectionGroupModel(
                                    name: studentProtectionController
                                        .nameController.text,
                                    position: studentProtectionController
                                        .nameController.text,
                                    designation: studentProtectionController
                                        .nameController.text,
                                    id: memberid,
                                    imageUrl: studentProtectionController
                                            .imageData["imageUrl"] ??
                                        imageUrl,
                                    imageId: imageId,
                                  ),
                                  context);
                        }, memberid, imageId, imageUrl);
                      }
                    },
                    icon: Icon(
                      iconData,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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

showDialogueStudentProtection(BuildContext context, String editOrCreate,
    VoidCallback function, String memberId, String imageid, String imageUrl) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          icon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)),
          content: Obx(
            () => Get.find<StudentProtectionController>()
                    .isLoadingDialogue
                    .value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: 350,
                    width: 250,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () async {
                              if (editOrCreate == "Create") {
                                await Get.find<StudentProtectionController>()
                                    .upLoadImage();
                              } else {
                                await Get.find<StudentProtectionController>()
                                    .updateImage(memberId, imageid);
                              }
                            },
                            child: Get.find<StudentProtectionController>()
                                    .isLoadingImage
                                    .value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(Get.find<
                                                        StudentProtectionController>()
                                                    .imageData['imageUrl'] ==
                                                null &&
                                            imageUrl.isEmpty
                                        ? "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                                        : Get.find<StudentProtectionController>()
                                                .imageData['imageUrl'] ??
                                            imageUrl),
                                    radius: 30,
                                  )),
                        sizedBoxH20,
                        StudentProtectionTextField(
                          hintText: 'Name',
                          controller: Get.find<StudentProtectionController>()
                              .nameController,
                        ),
                        sizedBoxH20,
                        StudentProtectionTextField(
                          hintText: 'Position',
                          controller: Get.find<StudentProtectionController>()
                              .positionController,
                        ),
                        sizedBoxH20,
                        StudentProtectionTextField(
                          hintText: 'Designation',
                          controller: Get.find<StudentProtectionController>()
                              .designationController,
                        ),
                        sizedBoxH20,
                        ElevatedButton(
                          onPressed: function,
                          child: Text(editOrCreate),
                        )
                      ],
                    ),
                  ),
          ));
    },
  );
}

class StudentProtectionTextField extends StatelessWidget {
  const StudentProtectionTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
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
        imageUrl: Get.find<StudentProtectionController>().imageData['imageUrl'],
        imageId: Get.find<StudentProtectionController>().imageData['imageId'],
      ),
      context);
}
