import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../get_firebase-data/get_firebase_data.dart';

class ManageTeachersController extends GetxController {
  RxMap<String, bool?> subjectlist = RxMap({});
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid']);

  ///////////////////
  addteachersToClass(String teacherdocID, String teacherName) async {
    firebaseFirestore
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
        .collection('teachers')
        .doc(teacherdocID)
        .set({
      'docid': teacherdocID,
      'teacherName': teacherName,
    }).then((value) {
      showToast(msg: "Added");
    });
  }

  addSubjectsToTeacher(BuildContext context, String teacherid) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Manage Subject'),
          content: SizedBox(
            height: 400,
            width: 500,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('SchoolListCollection')
                    .doc(schoolListValue!['docid'])
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection('classes')
                    .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
                    .collection('subjects')
                    .snapshots(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          subjectlist[snap.data?.docs[index]['subjectName']] =
                              null;
                          return Obx(() => Container(
                                color: subjectlist[snap.data?.docs[index]
                                            ['subjectName']] ==
                                        null
                                    ? Colors.transparent
                                    : const Color.fromARGB(255, 145, 238, 148),
                                height: 40,
                                child: Row(
                                  children: [
                                    Text(snap.data?.docs[index]['subjectName']),
                                    IconButton(
                                        onPressed: () async {
                                          subjectlist[snap.data!.docs[index]
                                              ['subjectName']!] = true;
                                          firebaseFirestore
                                              .collection(
                                                  Get.find<GetFireBaseData>()
                                                      .bYear
                                                      .value)
                                              .doc(Get.find<GetFireBaseData>()
                                                  .bYear
                                                  .value)
                                              .collection('classes')
                                              .doc(Get.find<GetFireBaseData>()
                                                  .getTeacherClassRole
                                                  .value)
                                              .collection('teachers')
                                              .doc(teacherid)
                                              .collection('teacherSubject')
                                              .doc(snap.data!.docs[index]
                                                  ['docid'])
                                              .set({
                                            'teacherdocid': teacherid,
                                            'docid': snap.data!.docs[index]
                                                ['docid'],
                                            'subjectName': snap.data!
                                                .docs[index]['subjectName']
                                          }).then((value) {
                                            firebaseFirestore
                                                .collection(
                                                    Get.find<GetFireBaseData>()
                                                        .bYear
                                                        .value)
                                                .doc(Get.find<GetFireBaseData>()
                                                    .bYear
                                                    .value)
                                                .collection('classes')
                                                .doc(Get.find<GetFireBaseData>()
                                                    .getTeacherClassRole
                                                    .value)
                                                .collection('subjects')
                                                .doc(snap.data!.docs[index]
                                                    ['docid'])
                                                .set({
                                              'teacherId': teacherid,
                                            },SetOptions(merge: true));
                                          }).then((value) {
                                            showToast(msg: 'Added');
                                          });
                                        },
                                        icon: const Icon(Icons.add))
                                  ],
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snap.data!.docs.length);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  viewTeacherSubjects(BuildContext context, String teacherid) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: SizedBox(
              height: 500,
              width: 700,
              child: StreamBuilder(
                  stream: firebaseFirestore
                      .collection(Get.find<GetFireBaseData>().bYear.value)
                      .doc(Get.find<GetFireBaseData>().bYear.value)
                      .collection('classes')
                      .doc(
                          Get.find<GetFireBaseData>().getTeacherClassRole.value)
                      .collection('teachers')
                      .doc(teacherid)
                      .collection('teacherSubject')
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  Text("${index + 1}"),
                                  sizedBoxW20,
                                  Text(snap.data!.docs[index]['subjectName']),
                                  IconButton(
                                      onPressed: () async {
                                        return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Alert'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        'Once remove the access all data will be lost \n Are you shure ?')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('ok'),
                                                  onPressed: () async {
                                                    await firebaseFirestore
                                                        .collection(
                                                            Get.find<GetFireBaseData>()
                                                                .bYear
                                                                .value)
                                                        .doc(
                                                            Get.find<GetFireBaseData>()
                                                                .bYear
                                                                .value)
                                                        .collection('classes')
                                                        .doc(Get.find<
                                                                GetFireBaseData>()
                                                            .getTeacherClassRole
                                                            .value)
                                                        .collection('teachers')
                                                        .doc(teacherid)
                                                        .collection(
                                                            'teacherSubject')
                                                        .doc(snap.data!
                                                                .docs[index]
                                                            ['docid'])
                                                        .delete()
                                                        .then((value) {
                                                      showToast(msg: 'Removed');
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.remove))
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: snap.data!.docs.length);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  removeTeacher(BuildContext context, String teacherid) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Once remove the teacher all data will be lost \n Are you shure ?')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                await firebaseFirestore
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection('classes')
                    .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
                    .collection('teachers')
                    .doc(teacherid)
                    .delete()
                    .then((value) {
                  showToast(msg: 'Removed');
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
