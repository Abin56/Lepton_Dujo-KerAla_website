import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/search_student/search_student.dart';

class SearchStuents extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(Get.find<AdminLoginScreenController>().schoolID)
                .collection("AllStudents")
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                var screenSize =MediaQuery.of(context).size;
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(

                          color: adminePrimayColor,
                          height: screenSize.width/15,
                          width: double.infinity,
                          child: Row(
                            children: [
                            GestureDetector(onTap: () {
                             
                            },
                              child:
                               CircleAvatar(radius: 60,)),
                               Padding(
                                 padding:  EdgeInsets.only(top: screenSize.width/60),
                                 child: Column(children: [
                                 // Text(snapshots.data!.docs[index]['id']),
                                 Text('Abin :', style: GoogleFonts.poppins(color: Colors.white),),
                                  Text('9562730350 :', style: GoogleFonts.poppins(color: Colors.white),),
                                   Text('123554 :', style: GoogleFonts.poppins(color: Colors.white),),
                                 
                                 ],),
                               )

                          ],)
                          
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            })
        : StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(Get.find<AdminLoginScreenController>().schoolID)
                .collection("AllStudents")
                .where('admissionNumber', isEqualTo: query)
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          child: Text(snapshots.data!.docs[index]['id']),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
  }
}
