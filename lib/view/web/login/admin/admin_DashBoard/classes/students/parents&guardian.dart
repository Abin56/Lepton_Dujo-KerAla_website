import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constant/constant.dart';

Future<void> getParentDatas(
    {required BuildContext context,
    required String schooilID,
    required String studentID}) async {
  final firebase = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(schooilID)
      .collection("Students_Parents");
  return showDialog(
    context: context,
    builder: (context) {
      return FutureBuilder(
          future: firebase.where('wStudent', isEqualTo: studentID).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              log(snapshot.data!.docs[0].data()['parentImage'].toString());
              return SizedBox(
                height: 400,
                width: double.infinity,
                child: AlertDialog(
                  actions: [
                    sizedBoxH20,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok')),
                    ),
                  ],
                  title: const Text('Guardian Info'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(snapshot
                                        .data!.docs[0]
                                        .data()['parentImage']
                                        .toString()),
                                  ),
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(snapshot
                                        .data!.docs[0]
                                        .data()['fatherImage']
                                        .toString()),
                                  ),
                                ],
                              ),
                              sizedBoxH20,
                              Text(
                                'Parent Name : ${snapshot.data!.docs[0].data()['parentName']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Father Name : ${snapshot.data!.docs[0].data()['nameofFather']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Parent Email : ${snapshot.data!.docs[0].data()['parentEmail']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Row(
                                children: [
                                  Text(
                                    'Phone No : ${snapshot.data!.docs[0].data()['parentPhoneNumber']}',
                                    style: info_style,
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            final newParentNo =
                                                TextEditingController();
                                            return AlertDialog(
                                              actions: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    firebase
                                                        .doc(snapshot
                                                                .data!.docs[0]
                                                                .data()[
                                                            'parentEmail'])
                                                        .set(
                                                            {
                                                          'parentPhoneNumber':
                                                              newParentNo.text
                                                                  .trim()
                                                        },
                                                            SetOptions(
                                                                merge:
                                                                    true)).then(
                                                            (value) {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text('update')),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text('Cancel')),
                                                ),
                                              ],
                                              title:
                                                  const Text('Update Number'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller: newParentNo,
                                                      decoration: InputDecoration(
                                                          hintText: snapshot
                                                              .data!.docs[0]
                                                              .data()[
                                                                  'parentPhoneNumber']
                                                              .toString()),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ))
                                ],
                              ),
                              sizedBoxH10,
                              Text(
                                'Join Date : ${snapshot.data!.docs[0].data()['joinDate']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Address: ${snapshot.data!.docs[0].data()['houseName']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Place : ${snapshot.data!.docs[0].data()['place']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'State : ${snapshot.data!.docs[0].data()['state']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Pincode : ${snapshot.data!.docs[0].data()['pincode']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          });
    },
  );
}

Future<void> getGuardianDatas(
    {required BuildContext context,
    required String schooilID,
    required String studentID}) async {
  final firebase = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(schooilID)
      .collection("Student_Guardian");
  return showDialog(
    context: context,
    builder: (context) {
      return FutureBuilder(
          future: firebase.where('wStudent', isEqualTo: studentID).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              log(snapshot.data!.docs[0].data()['parentImage'].toString());
              return SizedBox(
                height: 400,
                width: double.infinity,
                child: AlertDialog(
                  actions: [
                    sizedBoxH20,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok')),
                    ),
                  ],
                  title: const Text('Parents Info'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(snapshot
                                    .data!.docs[0]
                                    .data()['guardianImage']
                                    .toString()),
                              ),
                              sizedBoxH20,
                              Text(
                                'Guardian Name : ${snapshot.data!.docs[0].data()['guardianName']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              sizedBoxH10,
                              Row(
                                children: [
                                  Text(
                                    'Phone No : ${snapshot.data!.docs[0].data()['guardianPhoneNumber']}',
                                    style: info_style,
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            final newParentNo =
                                                TextEditingController();
                                            return AlertDialog(
                                              actions: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    firebase
                                                        .doc(snapshot
                                                            .data!.docs[0]
                                                            .data()['id'])
                                                        .set(
                                                            {
                                                          'guardianPhoneNumber':
                                                              newParentNo.text
                                                                  .trim()
                                                        },
                                                            SetOptions(
                                                                merge:
                                                                    true)).then(
                                                            (value) {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text('update')),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text('Cancel')),
                                                ),
                                              ],
                                              title:
                                                  const Text('Update Number'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller: newParentNo,
                                                      decoration: InputDecoration(
                                                          hintText: snapshot
                                                              .data!.docs[0]
                                                              .data()[
                                                                  'guardianPhoneNumber']
                                                              .toString()),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ))
                                ],
                              ),
                              sizedBoxH10,
                              Text(
                                'Join Date : ${snapshot.data!.docs[0].data()['joinDate']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Address: ${snapshot.data!.docs[0].data()['houseName']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Place : ${snapshot.data!.docs[0].data()['place']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'State : ${snapshot.data!.docs[0].data()['state']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                              Text(
                                'Pincode : ${snapshot.data!.docs[0].data()['pincode']}',
                                style: info_style,
                              ),
                              sizedBoxH10,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          });
    },
  );
}

final info_style = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 43, 43, 43),
    fontSize: 14,
    fontWeight: FontWeight.w600);
