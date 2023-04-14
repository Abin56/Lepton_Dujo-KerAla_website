import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../model/create_school_model/create_school_model.dart';
import '../../../../constant/constant.dart';
import '../../../widgets/button_container_widget.dart';

class RequestedSchoolsListScreen extends StatefulWidget {
  const RequestedSchoolsListScreen({super.key});

  @override
  State<RequestedSchoolsListScreen> createState() =>
      _RequestedSchoolsListScreenState();
}

class _RequestedSchoolsListScreenState
    extends State<RequestedSchoolsListScreen> {
  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("RequestedSchools")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                        child: AnimationLimiter(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        padding: EdgeInsets.all(_w / 60),
                        crossAxisCount: columnCount,
                        children: List.generate(
                          snapshot.data!.docs.length,
                          (int index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 300),
                              columnCount: columnCount,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 900),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 40,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                        height: _h / 1000,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            bottom: _w / 400,
                                            left: _w / 100,
                                            right: _w / 100),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ButtonContainerWidget(
                                                  curving: 10,
                                                  colorindex: 0,
                                                  height: 40,
                                                  width: 130,
                                                  child: Center(
                                                    child: Text(
                                                      stringTimeToDateConvert(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['postedDate']),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      ['schoolName'],
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      ['postedDate'],
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH20,
                                                Text(
                                                  "Country : India",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  "State : Kerala",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  "City : ${snapshot.data!.docs[index]['district']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  "Place : ${snapshot.data!.docs[index]['place']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH20,
                                                Text(
                                                  "Email  : ${snapshot.data!.docs[index]['email']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  "Password  : ${snapshot.data!.docs[index]['password']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Text(
                                                  "Phone No  : ${snapshot.data!.docs[index]['phoneNumber']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                sizedBoxH30,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final schoolDetails1 = await CreatedSchoolAddModel(
                                                            email: snapshot.data!.docs[index]
                                                                ['email'],
                                                            phoneNumber: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                ['phoneNumber'],
                                                            id: snapshot.data!.docs[index]
                                                                ['schoolID'],
                                                            schoolName: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                ['schoolName'],
                                                            schoolID: snapshot.data!.docs[index]
                                                                ['schoolID'],
                                                            district: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                ['district'],
                                                            place: snapshot.data!.docs[index]['place'],
                                                            adminUserName: snapshot.data!.docs[index]['adminUserName'],
                                                            password: snapshot.data!.docs[index]['password'],
                                                            postedDate: snapshot.data!.docs[index]['postedDate']);

                                                        CreateSchoolAddToFireBase()
                                                            .createSchoolController(
                                                                schoolDetails1,
                                                                context)
                                                            .then((value) => FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'RequestedSchools')
                                                                .doc(snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    [
                                                                    'schoolID'])
                                                                .delete())
                                                            .then((value) =>
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        ((context) =>
                                                                            AlertDialog(
                                                                              content: Text('Succesfully Approved!'),
                                                                            ))));
                                                      },
                                                      child:
                                                          ButtonContainerWidget(
                                                        curving: 10,
                                                        colorindex: 3,
                                                        height: 40,
                                                        width: 130,
                                                        child: Center(
                                                          child: Text(
                                                            "Approve",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      child:
                                                          ButtonContainerWidget(
                                                        curving: 10,
                                                        colorindex: 6,
                                                        height: 40,
                                                        width: 130,
                                                        child: Center(
                                                          child: Text(
                                                            "Reject",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            }),
      ),
    );
  }
}
