import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../../controller/all_students_controller/all_students_controller.dart';
import '../../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../../controller/students_list/students_list.dart';
import '../../../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../widgets/Iconbackbutton.dart';
import 'details_students.dart';

class ListOfStudents extends StatefulWidget {
  String schoolID;
  String classID;
  String className;
  String NoofStundents = '';
  String NoofMaleStundets = '';
  String NoofFemaleStudents = '';

  ListOfStudents(
      {required this.classID,
      required this.className,
      required this.schoolID,
      super.key});

  @override
  State<ListOfStudents> createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {
  AllStudentsController allStudentsController =
      Get.put(AllStudentsController());
  final getxController = Get.put(StudentsProfileList());

  @override
  void initState() {
    getGenderCount();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<AddStudentModel> allData = [];
    int columnCount = 3;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
            .doc(widget.classID)
            .collection("Students")
            .orderBy('studentName', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH10,
                Row(
                  children: [
                    IconButtonBackWidget(color: cBlack),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "C L A S S : ${widget.className}",
                        style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                sizedBoxH20,
                Expanded(
                  child: Row(
                    children: [
                      StudentsDetails(
                          totaFemale: widget.NoofFemaleStudents.toString(),
                          totalMale: widget.NoofMaleStundets.toString(),
                          totalstudents: snapshot.data!.docs.length.toString(),
                          className: widget.className,
                          classID: widget.classID,
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
                                AddStudentModel data = AddStudentModel.fromMap(
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
                                            allStudentsController
                                                .getStudentsDetails(
                                              context,
                                              data.classID!,
                                              data.profileImageUrl,
                                              data.studentName,
                                              data.studentemail,
                                              data.parentPhoneNumber,
                                              data.admissionNumber,
                                              data.houseName,
                                              data.place,
                                              data.district,
                                              data.gender,
                                              data.alPhoneNumber,
                                              data.bloodgroup ?? "",
                                              data.docid!,
                                            );
                                            //////////////////////
                                            //////
                                            ///
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
                                                  CircleAvatar(
                                                      radius: 60,
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              210,
                                                              235,
                                                              255),
                                                      child: Container(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: data.gender ==
                                                                'Male'
                                                            ? LottieBuilder.network(
                                                                'https://assets7.lottiefiles.com/packages/lf20_gslpxfoi.json')
                                                            : data.gender ==
                                                                    'Female'
                                                                ? LottieBuilder
                                                                    .network(
                                                                        'https://assets7.lottiefiles.com/packages/lf20_pmdvl45r.json')
                                                                : LottieBuilder
                                                                    .network(
                                                                        'https://assets4.lottiefiles.com/packages/lf20_u7yrcwlk.json'),
                                                      )),
                                                  sizedBoxH10,
                                                  Text(
                                                    'Created Date : ${stringTimeToDateConvert(data.createDate!)}',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "Name : ${data.studentName}",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "Admission No : ${data.admissionNumber}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Gender : ${data.gender}",
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

  Future<void> getGenderCount() async {
    int maleCount = 0;
    int femaleCount = 0;
    var a = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .doc(widget.classID)
        .collection("Students")
        .get();

    int studentsLength = 0;
    for (int i = 0; i <= a.docs.length - 1; i++) {
      if (a.docs[i].data()['gender'] == 'male') {
        maleCount++;
      } else if (a.docs[i].data()['gender'] == 'female') {
        femaleCount++;
      }
    }
    setState(() {
      widget.NoofMaleStundets = maleCount.toString();
      widget.NoofFemaleStudents = femaleCount.toString();
    });
  }
}
