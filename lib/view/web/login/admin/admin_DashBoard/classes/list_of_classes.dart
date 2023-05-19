import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/all_class_controller/all_class_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/class_list/class_list_model.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/add_class/add_new_class.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import 'details_ofClasses.dart';

class ListOfClassesScreen extends StatefulWidget {
  AllClassController allClassController = Get.put(AllClassController());
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

  @override
  Widget build(BuildContext context) {
    List<SchoolClassesModel> allData = [];
    int columnCount = 3;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Classes List'),
          backgroundColor: adminePrimayColor),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
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
                          width: 500,
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
                            padding: EdgeInsets.all(w / 60),
                            crossAxisCount: columnCount,
                            children: List.generate(
                              snapshot.data!.docs.length,
                              (int index) {
                                SchoolClassesModel data =
                                    SchoolClassesModel.fromMap(
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
                                            widget.allClassController.showclass(
                                                context,
                                                data.className,
                                                data.docid,
                                                );
                                          },
                                          child: SizedBox(
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
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 210, 235, 255),
                                                    child: CircleAvatar(
                                                      radius: 50,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                                    "Class Incharge : ${data.classTeacherName}",
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
            return const Center(
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
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .get();
    final data = a.docs.map((e) {
      return e.data()['docid'];
    }).toList();
    int studentsLength = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("classes")
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
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .get();
    final data = a.docs.map((e) {
      return e.data()['docid'];
    }).toList();

    int maleCount = 0;
    int femaleCount = 0;

    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("Classes")
          .doc(data[i])
          .collection('Students')
          .get();
      for (var element in b.docs) {
        if (element.data()['gender'] == 'Male') {
          maleCount++;
        } else if (element.data()['gender'] == 'Female') {
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
