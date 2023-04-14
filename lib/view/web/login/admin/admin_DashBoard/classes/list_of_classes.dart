import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/class_list/class_list_model.dart';
import '../../../../../../model/create_classModel/create_classModel.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import 'details_ofClasses.dart';


class ListOfClassesScreen extends StatefulWidget {
  String schoolID;
  String NoofStundents = '';
  String NoofMaleStundets = '';
  String NoofFemaleStudents = '';

  ListOfClassesScreen({required this.schoolID, super.key});

  @override
  State<ListOfClassesScreen> createState() => _ListOfClassesScreenState();
}

class _ListOfClassesScreenState extends State<ListOfClassesScreen> {
  final getxController = Get.put(ClassProfileList());

  @override
  void initState() {
getStudntsCount();
    getMaleCount();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    List<AddClassesModel> allData = [];
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Classes List'),
      backgroundColor: adminePrimayColor),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection('Classes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "C L A S S E S List",
                    style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                sizedBoxH20,
                Expanded(
                  child: Row(
                    children: [
                      ClassesDeatils(
                          noofFemale: widget.NoofFemaleStudents,
                          noofMale: widget.NoofMaleStundets,
                          totalStudents: widget.NoofStundents,
                          schooilID: widget.schoolID,
                          getxController: getxController,
                          allData: allData),
                      Container(
                        height: double.infinity - 10,
                        width: 2,
                        color: Colors.black.withOpacity(0.3),
                      ),
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
                                AddClassesModel data =
                                    AddClassesModel.fromJson(
                                        snapshot.data!.docs[index].data());
                                allData.add(data);
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
                                          onTap: () async {
                                            getxController.indexValue.value =
                                                index;
                                          },
                                          child: Container(
                                            height: 400,
                                            width: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 60,
                                                    backgroundColor: Color.fromARGB(255, 210, 235, 255),
                                                    child: CircleAvatar(
                                                      radius: 50,
                                                      backgroundColor: Colors.transparent,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/classes.png'),
                                                    ),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "C L A S S ${index + 1}",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.grey,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    'Create Date : ${stringTimeToDateConvert(data.joinDate)}',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "Class : ${data.className}",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "Class Incharge : ${data.classIncharge}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Class ID : ${data.classID}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }

  Future<void> getStudntsCount() async {
    var a = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection('Classes')
        .get();
    final data = a.docs.map((e) {
      return e.data()['id'];
    }).toList();
    int studentsLength = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(widget.schoolID)
          .collection('Classes')
          .doc(data[i])
          .collection('Students')
          .get();

      studentsLength = studentsLength + b.docs.length;
    }
    setState(() {
      widget.NoofStundents = studentsLength.toString();
      print(studentsLength);
    });
  }

  Future<void> getMaleCount() async {
    var a = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection('Classes')
        .get();
    final data = a.docs.map((e) {
      return e.data()['id'];
    }).toList();

    int maleCount = 0;
    int femaleCount = 0;

    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(widget.schoolID)
          .collection('Classes')
          .doc(data[i])
          .collection('Students')
          .get();
      for (var element in b.docs) {
        if (element.data()['gender'] == 'male') {
          maleCount++;
        } else if (element.data()['gender'] == 'female') {
          femaleCount++;
        }
      }
    }

    // print(maleCount);
    // print(femaleCount);
    setState(() {
      widget.NoofMaleStundets = maleCount.toString();
      widget.NoofFemaleStudents = femaleCount.toString();
    });
  }
}
