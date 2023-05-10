import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/all_Students/search_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/class_list/class_list_model.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/add_class/add_new_class.dart';
import '../../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../../ui team/sruthi/student_details_alert_box_widget.dart';
import '../../../../../constant/constant.dart';
import '../classes/details_ofClasses.dart';

class AllStudentList extends StatefulWidget {
  String NoofStundents = '';
  String NoofMaleStundets = '';
  String NoofFemaleStudents = '';

  AllStudentList({super.key});

  @override
  State<AllStudentList> createState() => _AllStudentListState();
}

class _AllStudentListState extends State<AllStudentList> {
  Future<void> _showSearch() async {
    await showSearch(context: context, delegate: SearchStuents());
  }

  final getxController = Get.put(ClassProfileList());

  @override
  Widget build(BuildContext context) {
    List<SchoolClassesModel> allData = [];
    int columnCount = 4;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection('AllStudents')
            .orderBy('studentName', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      sizedBoxW20,
                      Text(
                        "A L L S T U D E N T S",
                        style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      InkWell(
                        child: Container(
                          width: screenSize.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _showSearch();
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 19,
                                    )),
                                sizedBoxw10,
                                Text(
                                  "Search",
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          _showSearch();
                        },
                      )
                    ],
                  ),
                ),
                sizedBoxH20,
                Expanded(
                  child: Row(
                    children: [
                      ClassesDeatils(
                          width: 370,
                          noofFemale: widget.NoofFemaleStudents,
                          noofMale: widget.NoofMaleStundets,
                          totalStudents: snapshot.data!.docs.length.toString(),
                          schooilID:
                              Get.find<AdminLoginScreenController>().schoolID,
                          getxController: getxController,
                          allData: allData),
                      Container(
                        height: screenSize.width * 6,
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
                                AddStudentModel data = AddStudentModel.fromMap(
                                    snapshot.data!.docs[index].data());

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
                                          child: GestureDetector(
                                            onTap: () async {
                                              _showlert(context, data);
                                            },
                                            child: SizedBox(
                                              height: screenSize.width * 6,
                                              width: screenSize.width / 10,
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    screenSize.width / 100),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius:
                                                          screenSize.width / 40,
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              210,
                                                              235,
                                                              255),
                                                      child: CircleAvatar(
                                                        radius:
                                                            screenSize.width /
                                                                50,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            const AssetImage(
                                                                'assets/images/classes.png'),
                                                      ),
                                                    ),
                                                    // sizedBoxH10,
                                                    Text(
                                                      data.studentName ?? "",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              letterSpacing: 1,
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: screenSize
                                                                      .width /
                                                                  120,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),

                                                    Text(
                                                      'Create Date : ${stringTimeToDateConvert(data.createDate ?? "")}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        fontSize:
                                                            screenSize.width /
                                                                120,
                                                      ),
                                                    ),

                                                    FutureBuilder(
                                                        future: FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "SchoolListCollection")
                                                            .doc(Get
                                                                    .find<
                                                                        AdminLoginScreenController>()
                                                                .schoolID)
                                                            .collection(Get
                                                                    .find<
                                                                        GetFireBaseData>()
                                                                .bYear
                                                                .value)
                                                            .doc(Get.find<
                                                                    GetFireBaseData>()
                                                                .bYear
                                                                .value)
                                                            .collection(
                                                                "classes")
                                                            .doc(data.classID)
                                                            .get(),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                              .hasData) {
                                                            return Text(
                                                              "${snapshot.data!.data()?['className'] ?? ''}",
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      screenSize
                                                                              .width /
                                                                          120,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            );
                                                          } else {
                                                            return const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            );
                                                          }
                                                        }),
                                                    //sizedBoxH10,
                                                    Text(
                                                      "Phone No ${data.parentPhoneNumber}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenSize.width /
                                                                130,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Admission ID : ${data.admissionNumber}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenSize.width /
                                                                130,
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
        .collection('classes')
        .get();
    final data = a.docs.map((e) {
      return e.data()['docid'];
    }).toList();
    int studentsLength = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('classes')
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


}

void _showlert(BuildContext context, AddStudentModel data) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Student_Details_AlertBox_Widget(
            studentID: data.docid ?? "",
            studentImage: data.profileImageUrl,
            studentName: data.studentName ?? "",
            studentClass: data.classID ?? "",
            admissionNumber: data.admissionNumber ?? "",
            studentGender: data.gender ?? "",
            bloodGroup: data.bloodgroup ?? "",
            studentEmail: data.studentemail ?? "",
            houseName: data.houseName ?? "",
            place: data.place ?? "",
            district: data.district ?? "",
          ));
}
