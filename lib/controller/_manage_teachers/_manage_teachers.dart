import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            height: 250.w,
            width: 300.w,
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
                                height: 40.w,
                                child: Row(
                                  children: [
                                    GoogleMonstserratWidgets(text: snap.data?.docs[index]['subjectName'],
                                   fontsize: 15.w,fontWeight: FontWeight.w700),
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
                                            .doc(
                                                snap.data!.docs[index]['docid'])
                                            .set({
                                          'teacherdocid': teacherid,
                                          'docid': snap.data!.docs[index]
                                              ['docid'],
                                          'subjectName': snap.data!.docs[index]['subjectName']
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
                                        icon: const Icon(Icons.add,color: cBlue,))
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
            Container(
              margin: EdgeInsets.only(bottom: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: cred,
                    child: Center(
                      child: TextButton(
                        child: GoogleMonstserratWidgets(fontsize: 13.w,
                         text: 'Cancel', color: cWhite,fontWeight: FontWeight.w700),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: cgreen,
                    child: Center(
                      child: TextButton(
                        child: GoogleMonstserratWidgets(text: 'Ok', fontsize: 13.w,
                        color: cWhite,fontWeight: FontWeight.w700),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
          title: const Text('Alert '),
          content: SingleChildScrollView(
            child: SizedBox(
              height: 250.w,
              width: 300.w,
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
                              height: 50.w,
                              child: Row(
                                children: [
                                  GoogleMonstserratWidgets(text: "${index + 1}", fontsize: 14.w),

                                sizedBoxW20,
                                GoogleMonstserratWidgets(text: snap.data!.docs[index]['subjectName'],
                                fontsize: 14.w,fontWeight: FontWeight.w600),

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
                                                      'Once remove the access all data will be lost \n Are you sure ?')
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child:  GoogleMonstserratWidgets(text: 'Cancel', fontsize: 14.w),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),


                                              GestureDetector(onTap: () async {
                                                    await firebaseFirestore
                                                        .collection(
                                                            Get.find<
                                                                  GetFireBaseData>()
                                                          .bYear
                                                          .value)
                                                      .doc(Get.find<
                                                              GetFireBaseData>()
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
                                                          .docs[index]['docid'])
                                                      .delete()
                                                      .then((value) {
                                                    showToast(msg: 'Removed');
                                                    Navigator.of(context).pop();
                                                  });
                                                },
                                                child: Container(child:
                                                 GoogleMonstserratWidgets(
                                                  text: 'Ok', fontsize: 14.w,color: cred,
                                                  fontWeight: FontWeight.w600,)),
                                              ),
                                              // TextButton(
                                              //   child: const Text('ok'),
                                              //   onPressed: ()
                                              // ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.remove,color: cBlue,)),
                                    GoogleMonstserratWidgets(text: 'Remove', fontsize: 13.w)
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  color: cred,
                  child: Center(
                    child: TextButton(
                      child: GoogleMonstserratWidgets(text: 'Cancel',
                       fontsize: 13.w,color: cWhite,fontWeight: FontWeight.w600),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),

                Container(
                  color: cgreen,
                  child: Center(
                    child: TextButton(
                      child: GoogleMonstserratWidgets(text: 'Ok',
                       fontsize: 13.w,color: cWhite,fontWeight: FontWeight.w600),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
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
                    'Once remove the teacher all data will be lost \n Are you sure ?')
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
              child: const Text('Ok'),
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
