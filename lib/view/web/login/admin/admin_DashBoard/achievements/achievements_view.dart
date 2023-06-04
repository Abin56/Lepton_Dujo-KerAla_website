import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../widgets/Iconbackbutton.dart';

// ignore: must_be_immutable
class AchievementsViewAndEdit extends StatelessWidget {
  AchievementsViewAndEdit({super.key, required this.schoolID});

  String schoolID;

  TextEditingController studentNameEditController = TextEditingController();
  TextEditingController dateEditController = TextEditingController();
  TextEditingController admissionNumberEditController = TextEditingController();
  TextEditingController achievementHeadEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: adminePrimayColor,
        //   title: Text('Achievements List', style: GoogleFonts.poppins(color: Colors.white),),
        // ),
        body: Row(
      children: [
        Container(
          color: adminePrimayColor,
          height: size.height * 1.4,
          width: size.width * 1 / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButtonBackWidget(color: cWhite),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi Admin ',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text(
                    'View Achievements',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    width: size.width / 2,
                    child: LottieBuilder.network(
                        'https://assets10.lottiefiles.com/packages/lf20_akRaH1h1KF.json'),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          child: Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('SchoolListCollection')
                  .doc(schoolID)
                  .collection(Get.find<GetFireBaseData>().bYear.value)
                  .doc(Get.find<GetFireBaseData>().bYear.value)
                  .collection('Achievements')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                        snapshot.data!.docs[index]['photoUrl']),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description: ' +
                                        snapshot.data!.docs[index]
                                            ['description'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Admission Number: ' +
                                        snapshot.data!.docs[index]
                                            ['admissionNumber'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      'Achievement: ' +
                                          snapshot.data!.docs[index]
                                              ['achievement'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    'Date Of Achievement: ' +
                                        snapshot.data!.docs[index]
                                            ['dateofAchievement'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Achievements'),
                                                  content: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller:
                                                            studentNameEditController,
                                                        decoration:
                                                            InputDecoration(
                                                          border: const OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          hintText: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                              ['description'],
                                                        ),
                                                      ),
                                                      sizedBoxH10,
                                                      TextFormField(
                                                        controller:
                                                            dateEditController,
                                                        decoration: InputDecoration(
                                                            border: const OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            hintText: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                [
                                                                'dateofAchievement']),
                                                      ),
                                                      sizedBoxH10,
                                                      TextFormField(
                                                        controller:
                                                            admissionNumberEditController,
                                                        decoration: InputDecoration(
                                                            border: const OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            hintText: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                [
                                                                'admissionNumber']),
                                                      ),
                                                      sizedBoxH10,
                                                      TextFormField(
                                                        controller:
                                                            achievementHeadEditController,
                                                        decoration: InputDecoration(
                                                            border: const OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            hintText: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                [
                                                                'achievement']),
                                                      ),
                                                      sizedBoxH10,
                                                    ],
                                                  ),
                                                  actions: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Row(
                                                        children: [
                                                          MaterialButton(
                                                            onPressed:
                                                                () async {
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'SchoolListCollection')
                                                                  .doc(schoolID)
                                                                  .collection(
                                                                      Get.find<GetFireBaseData>()
                                                                          .bYear
                                                                          .value)
                                                                  .doc(Get.find<
                                                                          GetFireBaseData>()
                                                                      .bYear
                                                                      .value)
                                                                  .collection(
                                                                      'Achievements')
                                                                  .doc(snapshot
                                                                          .data!
                                                                          .docs[
                                                                      index]['uid'])
                                                                  .set({
                                                                'dateofAchievement': (dateEditController
                                                                            .text ==
                                                                        '')
                                                                    ? snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'dateofAchievement']
                                                                    : dateEditController
                                                                        .text,
                                                                'description': (studentNameEditController
                                                                            .text ==
                                                                        '')
                                                                    ? snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'description']
                                                                    : studentNameEditController
                                                                        .text,
                                                                'achievement': (achievementHeadEditController
                                                                            .text ==
                                                                        '')
                                                                    ? snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'achievement']
                                                                    : achievementHeadEditController
                                                                        .text,
                                                                'admissionNumber': (admissionNumberEditController
                                                                            .text ==
                                                                        '')
                                                                    ? snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'admissionNumber']
                                                                    : admissionNumberEditController
                                                                        .text,
                                                                'photoUrl': snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    [
                                                                    'photoUrl'],
                                                                'studentID': snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    [
                                                                    'studentID'],
                                                                'studentName': snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    [
                                                                    'studentName'],
                                                                'uid': snapshot
                                                                        .data!
                                                                        .docs[
                                                                    index]['uid'],
                                                              });

                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            color: Colors.blue,
                                                            child: const Text(
                                                                'Edit'),
                                                          ),
                                                          sizedBoxW20,
                                                          MaterialButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            color: Colors.blue,
                                                            child: const Text(
                                                                'Cancel'),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        color: Colors.blue,
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      MaterialButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection(
                                                  'SchoolListCollection')
                                              .doc(schoolID)
                                              .collection(
                                                  Get.find<GetFireBaseData>()
                                                      .bYear
                                                      .value)
                                              .doc(Get.find<GetFireBaseData>()
                                                  .bYear
                                                  .value)
                                              .collection('Achievements')
                                              .doc(snapshot.data!.docs[index]
                                                  ['uid']).delete();
                                        },
                                        color: Colors.red,
                                        child: const Text('Delete',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
