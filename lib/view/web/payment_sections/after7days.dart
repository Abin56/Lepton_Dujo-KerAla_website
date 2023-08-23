import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:flutter/material.dart';

class After7DaysPaymentScreen extends StatelessWidget {
  int countofStudents = 201;

  String schoolId;
  After7DaysPaymentScreen({required this.schoolId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GooglePoppinsWidgets(
                text:
                    " 7 Days trial periods are over. Hereafter payment scheme will be enabled!",
                fontsize: 20),
          ),
          sizedBoxH20,
          IconButton(
              onPressed: () async {
                return showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('SchoolListCollection')
                            .doc(schoolId)
                            .collection('AllStudents')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return AlertDialog(
                              title: GooglePoppinsWidgets(
                                  text: "COSTECH DuJo", fontsize: 20),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    GoogleMonstserratWidgets(
                                        text:
                                            "No of Students : ${snapshot.data?.docs.length}",
                                        fontsize: 20),
                                    GoogleMonstserratWidgets(
                                        text: "Prices : ${getPrice(200)}",
                                        fontsize: 20),
                                    IconButton(
                                        onPressed: () async {
                                          getPrice(snapshot.data!.docs.length);
                                        },
                                        icon: const Icon(Icons.abc))
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                        });
                  },
                );
              },
              icon: const Icon(Icons.payment)),

          //
          //
          FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('SchoolListCollection')
                  .doc('3I7G8YS5ZAZ0rZ2doX4MHlfV4OC3')
                  .collection('payments')
                  .doc('payment')
                  .get(),
              builder: (context, snap) {
                if (snap.hasData) {
                  if (countofStudents > snap.data!.data()!['maxStudents']) {
                    FirebaseFirestore.instance
                        .collection('SchoolListCollection')
                        .doc('3I7G8YS5ZAZ0rZ2doX4MHlfV4OC3')
                        .update({'deactive': false}).then((value) {
                      return showDialog(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Alert'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(
                                      'Please pay balance Amount ,\n since your number of students have been increased by ${countofStudents}students'),
                                  Text(
                                      'Balance amount : ${int.parse((getPrice(countofStudents))) - int.parse((snap.data!.data()!['currentTotal']))}')
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                    log("message");
                  } else {
                    FirebaseFirestore.instance
                        .collection('SchoolListCollection')
                        .doc('3I7G8YS5ZAZ0rZ2doX4MHlfV4OC3')
                        .update({'deactive': true});
                    log('sd');
                  }
                  return GoogleMonstserratWidgets(
                      text: "Pay balance amout ", fontsize: 20);
                } else {
                  return const Center();
                }
              }),
        ],

        ///
        ///
        ///
        ///
      )),
    );
  }
}

String getPrice(int noofStudents) {
  if (noofStudents >= 1200) {
    return '90000';
  } else if (noofStudents >= 1200 && noofStudents >= 1001) {
    return '80000';
  } else if (noofStudents >= 1000 && noofStudents >= 751) {
    return '70000';
  } else if (noofStudents >= 750 && noofStudents >= 501) {
    return '55000';
  } else if (noofStudents >= 500 && noofStudents >= 401) {
    return '35000';
  } else if (noofStudents >= 400 && noofStudents >= 301) {
    return '30000';
  } else if (noofStudents >= 300 && noofStudents >= 201) {
    return '25000';
  } else if (noofStudents >= 200 && noofStudents >= 101) {
    return '20000';
  } else if (noofStudents >= 100) {
    return '15000';
  } else {
    return '15000';
  }
}
