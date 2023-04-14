import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constant.dart';
import '../../../widgets/button_container_widget.dart';

class DetailsSchoolsScreen extends StatefulWidget {
   DetailsSchoolsScreen({super.key, required this.schoolSnap});

   QueryDocumentSnapshot<Map<String, dynamic>> schoolSnap;

  

  @override
  State<DetailsSchoolsScreen> createState() => _DetailsSchoolsScreenState();
}

class _DetailsSchoolsScreenState extends State<DetailsSchoolsScreen> {
  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            height: 700,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxH10,
                        Text(
                          widget.schoolSnap['schoolName'],
                          style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        sizedBoxH10,
                        Text(
                          widget.schoolSnap['postedDate'],
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH20,
                        Text(
                          "Country : India",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "State : Kerala",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "City : ${widget.schoolSnap['district']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "Place : ${widget.schoolSnap['place']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH20,
                        Text(
                          "Email  : ${widget.schoolSnap['email']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "Password  : ${widget.schoolSnap['password']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "Phone No  : ${widget.schoolSnap['phoneNumber']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            sizedBoxW20,

                             ButtonContainerWidget(
                              curving: 10,
                              colorindex: 3,
                              height: 40,
                              width: 130,
                              child: Center(
                                child: Text(
                                  "Activate",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            sizedBoxW20,

                            ButtonContainerWidget(
                              curving: 10,
                              colorindex: 6,
                              height: 40,
                              width: 130,
                              child: Center(
                                child: Text(
                                  "Deactivate",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            sizedBoxW20,
                            ButtonContainerWidget(
                              curving: 10,
                              colorindex: 6,
                              height: 40,
                              width: 130,
                              child: Center(
                                child: Text(
                                  "Delete",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                  sizedBoxW20,
                  Container(
                    height: double.infinity - 10,
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  StreamBuilder( 
                    stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolSnap['schoolID']).collection('Admins').snapshots(),
                    builder: (context, snapshot) { 
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return Expanded(
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
                                              bottom: _w / 100,
                                              left: _w / 200,
                                              right: _w / 200),
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
                                                        "Date : 20-10-200",
                                                        style: GoogleFonts.poppins(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "A D M I N  ${index + 1}",
                                                    style: GoogleFonts.montserrat(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "March 27,2018 10:00 PM",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  sizedBoxH10,
                                                  CircleAvatar(
                                                    radius: 40,
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "Name : ${snapshot.data!.docs[index]['name']}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Email : ${snapshot.data!.docs[index]['email']}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Phone No  : ${snapshot.data!.docs[index]['phone number']}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
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
                      ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
