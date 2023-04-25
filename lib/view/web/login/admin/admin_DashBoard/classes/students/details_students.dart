import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/parents&guardian.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/student_summery.dart/student_summery.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/sampoorna/sampoorna_home.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/transfer_cretificate/tc_genrate.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../../controller/students_list/students_list.dart';
import '../../../../../../../model/create_classModel/addStudent_model.dart';
import '../../../../../../../model/profileextraDetails/students_extra_profile.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../widgets/button_container_widget.dart';

class StudentsDetails extends StatelessWidget {
  String totalstudents;
  String totalMale;
  String totaFemale;
  String schooilID;
  String classID;
  String className;
  StudentsDetails({
    required this.totaFemale,
    required this.totalMale,
    required this.totalstudents,
    required this.className,
    required this.classID,
    super.key,
    required this.schooilID,
    required this.getxController,
    required this.allData,
  });

  final StudentsProfileList getxController;
  final List<AddStudentModel> allData;

  @override
  
  Widget build(BuildContext context) {
    final _firebase = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("Classes")
        .doc(classID);
    return Container(
      height: double.infinity,
      width: 500,
      child: Obx(() {
        return getxController.indexValue.value == null || allData.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxH40,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "S T U D E N T S Info",
                          style: GoogleFonts.montserrat(
                              color: const Color.fromARGB(255, 75, 75, 75),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      sizedBoxH10,
                      LottieBuilder.network(
                        'https://assets8.lottiefiles.com/private_files/lf30_Fy9W8c.json',
                        height: 300,
                        width: double.infinity,
                      ),
                      sizedBoxH10,
                      Row(
                        children: [
                          LottieBuilder.network(
                            'https://assets5.lottiefiles.com/packages/lf20_mcydtktl.json',
                            height: 70,
                          ),
                          sizedBoxW20,
                          Text(
                            "Total Students : ${totalstudents}",
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          LottieBuilder.network(
                            'https://assets7.lottiefiles.com/packages/lf20_gslpxfoi.json',
                            height: 70,
                          ),
                          sizedBoxW20,
                          Text(
                            "Male : $totalMale",
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          LottieBuilder.network(
                            'https://assets7.lottiefiles.com/packages/lf20_pmdvl45r.json',
                            height: 70,
                          ),
                          sizedBoxW20,
                          Text(
                            "Female :$totaFemale",
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 19, 19, 19),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(
                          allData[getxController.indexValue.value!]
                              .profileImageUrl!),
                    ),
                    sizedBoxH10,
                    sizedBoxH20,
                    Row(
                      children: [
                        Text(
                          'Name : ${allData[getxController.indexValue.value!].studentName}',
                          style: tea_style,
                        ),
                        sizedBoxw10,
                        IconButton(
                          onPressed: () async {
                            TextEditingController _newStNameController =
                                TextEditingController();
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            if (_newStNameController
                                                .text.isNotEmpty) {
                                              _firebase
                                                  .collection("Students")
                                                  .doc(allData[getxController
                                                          .indexValue.value!]
                                                      .uid)
                                                  .set({
                                                'studentName':
                                                    _newStNameController.text
                                                        .trim()
                                              }, SetOptions(merge: true)).then(
                                                      (value) => Navigator.pop(
                                                          context));
                                            }
                                          },
                                          child: const Text('update')),
                                    ),
                                    sizedBoxH20,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('back')),
                                    ),
                                  ],
                                  title: const Text('Edit Student Name'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: allData[getxController
                                                      .indexValue.value!]
                                                  .studentName),
                                          controller: _newStNameController,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    sizedBoxH10,
                    Text(
                      'E mail : ${allData[getxController.indexValue.value!].studentemail}',
                      style: tea_style,
                    ),
                    sizedBoxH10,
                    Row(
                      children: [
                        Text(
                          'Phone No : ${allData[getxController.indexValue.value!].parentPhoneNumber}',
                          style: tea_style,
                        ),
                        sizedBoxw10,
                        IconButton(
                          onPressed: () async {
                            TextEditingController _newPhoneNoController =
                                TextEditingController();
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            if (_newPhoneNoController
                                                .text.isNotEmpty) {
                                              _firebase
                                                  .collection("Students")
                                                  .doc(allData[getxController
                                                          .indexValue.value!]
                                                      .uid)
                                                  .set({
                                                'parentPhoneNumber':
                                                    _newPhoneNoController.text
                                                        .trim()
                                              }, SetOptions(merge: true)).then(
                                                      (value) => Navigator.pop(
                                                          context));
                                            }
                                          },
                                          child: const Text('update')),
                                    ),
                                    sizedBoxH20,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('back')),
                                    ),
                                  ],
                                  title: const Text('Edit Phone No'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: allData[getxController
                                                      .indexValue.value!]
                                                  .parentPhoneNumber),
                                          controller: _newPhoneNoController,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    sizedBoxH10,
                    Row(
                      children: [
                        Text(
                          'Admission ID : ${allData[getxController.indexValue.value!].admissionNumber}',
                          style: tea_style,
                        ),
                        sizedBoxw10,
                        IconButton(
                          onPressed: () async {
                            TextEditingController _newAdIDController =
                                TextEditingController();
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            if (_newAdIDController
                                                .text.isNotEmpty) {
                                              _firebase
                                                  .collection("Students")
                                                  .doc(allData[getxController
                                                          .indexValue.value!]
                                                      .uid)
                                                  .set({
                                                'admissionNumber':
                                                    _newAdIDController.text
                                                        .trim()
                                              }, SetOptions(merge: true)).then(
                                                      (value) => Navigator.pop(
                                                          context));
                                            }
                                          },
                                          child: const Text('update')),
                                    ),
                                    sizedBoxH20,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('back')),
                                    ),
                                  ],
                                  title: const Text('Edit Admission ID'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: allData[getxController
                                                      .indexValue.value!]
                                                  .admissionNumber),
                                          controller: _newAdIDController,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    sizedBoxH10,
                    Text(
                      'Blood Group : ${allData[getxController.indexValue.value!].bloodgroup}',
                      style: tea_style,
                    ),
                    sizedBoxH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                getParentDatas(
                                    context: context,
                                    schooilID: schooilID,
                                    studentID: allData[
                                            getxController.indexValue.value!]
                                        .uid!);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/family.png'))),
                              ),
                            ),
                            sizedBoxW20,
                            const Text(
                              "Parents  ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.info_outlined),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await getGuardianDatas(
                                    context: context,
                                    schooilID: schooilID,
                                    studentID: allData[
                                            getxController.indexValue.value!]
                                        .uid!);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/security-guard.png'))),
                              ),
                            ),
                            sizedBoxW20,
                            const Text("Guardian  ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const Icon(Icons.info_outlined),
                          ],
                        ),
                      ],
                    ),
                    sizedBoxH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final sampoorna = await FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(Get.find<AdminLoginScreenController>()
                                    .schoolID)
                                .collection("AllStudents")
                                .doc(allData[getxController.indexValue.value!]
                                    .admissionNumber)
                                .collection("sampoorna")
                                .get();
                            sampoorna.docs.isEmpty
                                ?
                                // ignore: use_build_context_synchronously
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return SampoornaHomeScreen(
                                          schoolId: Get.find<
                                                  AdminLoginScreenController>()
                                              .schoolID);
                                    },
                                  ))
                                // ignore: use_build_context_synchronously
                                : Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return StundentSummery(
                                        stundetAdmissionId: allData[
                                                getxController
                                                    .indexValue.value!]
                                            .admissionNumber,
                                      );
                                    },
                                  ));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/folders.png'))),
                          ),
                        ),
                        sizedBoxW20,
                        const Text("Sampoorna",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Icon(Icons.info_outlined),
                        sizedBoxw10,
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(Get.find<AdminLoginScreenController>()
                                    .schoolID)
                                .collection("AllStudents")
                                .doc(allData[getxController.indexValue.value!]
                                    .admissionNumber)
                                .collection("sampoorna")
                                .where('admissionNumber',
                                    isEqualTo: allData[
                                            getxController.indexValue.value!]
                                        .admissionNumber)
                                .snapshots(),
                            builder: (context, snap) {
                              if (snap.hasData) {
                                if (snap.data!.docs.isEmpty) {
                                  return const Center();
                                } else {
                                  return const Icon(Icons.attach_file_rounded);
                                }
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })
                      ],
                    ),
                    sizedBoxH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('More'),
                        IconButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('back')),
                                      )
                                    ],
                                    title: const Text('More Options'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          sizedBoxH10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/exchange.png'))),
                                              ),
                                              const Text("Shift Class ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          sizedBoxH20,
                                          GenrateTc(allData: allData, getxController: getxController),
                                          sizedBoxH20,
                                          GestureDetector(
                                            onTap: () async {
                                              showDialog(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    actions: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              _firebase
                                                                  .collection(
                                                                      "Students")
                                                                  .doc(allData[getxController
                                                                          .indexValue
                                                                          .value!]
                                                                      .uid)
                                                                  .delete()
                                                                  .then((value) =>
                                                                      Navigator.pop(
                                                                          context));
                                                            },
                                                            child: const Text(
                                                                'ok')),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Cancel')),
                                                      )
                                                    ],
                                                    title: const Text('Alert'),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          const Text(
                                                              "Are you shure remove the student \n when press ok all data will be lost")
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: ButtonContainerWidget(
                                              curving: 20,
                                              colorindex: 6,
                                              height: 50,
                                              width: 110,
                                              child: const Center(
                                                child: Text(
                                                  'Remove',
                                                  style:
                                                      TextStyle(color: cWhite),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_downward_outlined,
                              size: 16,
                            )),
                      ],
                    ),
                    const Divider(),
                    sizedBoxH20,
                  ],
                ),
              );
      }),
    );
  }
}

class GenrateTc extends StatefulWidget {
  const GenrateTc({
    super.key,
    required this.allData,
    required this.getxController,
  });

  final List<AddStudentModel> allData;
  final StudentsProfileList getxController;

  @override
  State<GenrateTc> createState() => _GenrateTcState();
}

class _GenrateTcState extends State<GenrateTc> {
  String schoolName ='';
  String schoolplace='';
  @override
  void initState() {
getSchoolDetails();
    super.initState();
  }
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(
                "SchoolListCollection")
            .doc(Get.find<
                    AdminLoginScreenController>()
                .schoolID)
            .collection("AllStudents")
            .doc(widget.allData[widget.getxController
                    .indexValue.value!]
                .admissionNumber)
            .collection("sampoorna")
            .where('admissionNumber',
                isEqualTo: widget.allData[
                        widget.getxController
                            .indexValue
                            .value!]
                    .admissionNumber)
            .snapshots(),
        builder: (context, snappp) {
          return GestureDetector(
            onTap: () {
              TextEditingController sNo =
                  TextEditingController();
              TextEditingController
                  regNo =
                  TextEditingController();

              showDialog(
                context: context,
                barrierDismissible:
                    false, // user must tap button!
                builder: (BuildContext
                    context) {
                  return AlertDialog(
                    title: const Text(
                        'Genrating.. TC'),
                    content:
                        SingleChildScrollView(
                      child: ListBody(
                        children: <
                            Widget>[
                        const Text(
                              'Enter Details'),
                        
                          TextFormField(
                            controller:
                                sNo,
                                decoration: const InputDecoration(
                                  hintText: "S.NO"
                                ),
                          ),
               
                          TextFormField(
                            controller:
                                regNo,
                                decoration: const InputDecoration(
                                  hintText: "Reg No"
                                ),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                            'cancel'),
                        onPressed: () {
                          Navigator.of(
                                  context)
                              .pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                            'ok'),
                        onPressed:
                            () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                            builder:
                                (context) {
                              return GenrateTC(
                                  sno: sNo
                                      .text
                                      .trim(),
                                  regNo: regNo
                                      .text
                                      .trim(),
                                  parentName: snappp.data!.docs[0]
                                      [
                                      'nameOfStudentFather'],
                                  studentName:
                                      snappp.data!.docs[0][
                                          'nameOfStudent'],
                                  schoolName: schoolName,
                                  schoolPlace: schoolplace);
                            },
                          ));
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/work.png'))),
                ),
                const Text("TC Genrate ",
                    style: TextStyle(
                        fontWeight:
                            FontWeight
                                .bold)),
              ],
            ),
          );
        });
  }
  void getSchoolDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .get();
    setState(() {
      schoolName = vari.data()!['schoolName'];
      schoolplace = vari.data()!['place'];
});
}
}

final tea_style = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 115, 114, 114),
    fontSize: 14,
    fontWeight: FontWeight.w600);
