import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/student_summery.dart/student_summery.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/sampoorna/sampoorna_home.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/transfer_cretificate/tc_genrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../../controller/students_list/students_list.dart';
import '../../../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../../../ui team/sruthi/guardianInfo_alert_box.dart';
import '../../../../../../../ui team/sruthi/parent_guardian_alert_box_widget.dart';
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
    final firebase = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("Classes")
        .doc(classID);
    return SizedBox(
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
                      Row(
                        children: [
                         
                          SizedBox(width: 20.w,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "STUDENTS INFO",
                              style: GoogleFonts.montserrat(
                                  color: const Color.fromARGB(255, 75, 75, 75),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
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
                            "Total Students : $totalstudents",
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     LottieBuilder.network(
                      //       'https://assets7.lottiefiles.com/packages/lf20_gslpxfoi.json',
                      //       height: 70,
                      //     ),
                      //     sizedBoxW20,
                      //     Text(
                      //       "Male : $totalMale",
                      //       style: GoogleFonts.poppins(
                      //           color: const Color.fromARGB(255, 0, 0, 0),cd ..
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     LottieBuilder.network(
                      //       'https://assets7.lottiefiles.com/packages/lf20_pmdvl45r.json',
                      //       height: 70,
                      //     ),
                      //     sizedBoxW20,
                      //     Text(
                      //       "Female :$totaFemale",
                      //       style: GoogleFonts.poppins(
                      //           color: const Color.fromARGB(255, 19, 19, 19),
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
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
                            TextEditingController newStNameController =
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
                                            if (newStNameController
                                                .text.isNotEmpty) {
                                              firebase
                                                  .collection("Students")
                                                  .doc(allData[getxController
                                                          .indexValue.value!]
                                                      .docid)
                                                  .set({
                                                'studentName':
                                                    newStNameController.text
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
                                  title: const Text('Edit student name'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: allData[getxController
                                                      .indexValue.value!]
                                                  .studentName),
                                          controller: newStNameController,
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
                            TextEditingController newPhoneNoController =
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
                                            if (newPhoneNoController
                                                .text.isNotEmpty) {
                                              firebase
                                                  .collection("Students")
                                                  .doc(allData[getxController
                                                          .indexValue.value!]
                                                      .docid)
                                                  .set({
                                                'parentPhoneNumber':
                                                    newPhoneNoController.text
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
                                          controller: newPhoneNoController,
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
                            TextEditingController newAdIDController =
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
                                            if (newAdIDController
                                                .text.isNotEmpty) {
                                              firebase
                                                  .collection("Students")
                                                  .doc(allData[getxController
                                                          .indexValue.value!]
                                                      .docid)
                                                  .set({
                                                'admissionNumber':
                                                    newAdIDController.text
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
                                          controller: newAdIDController,
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
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => ParentAlert_box_Widget(
                                    classID: allData[
                                            getxController.indexValue.value!]
                                        .classID!,
                                    studentID: allData[
                                            getxController.indexValue.value!]
                                        .docid!,
                                    text: 'Parent Info',
                                  ),
                                );
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
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                      GuardianInfoAlert_box_Widget(
                                    classID: allData[
                                            getxController.indexValue.value!]
                                        .classID!,
                                    studentID: allData[
                                            getxController.indexValue.value!]
                                        .docid!,
                                    text: 'Guardian Info',
                                  ),
                                );
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
                                    .docid)
                                .collection("sampoorna")
                                .get();
                            sampoorna.docs.isEmpty
                                ?
                                // ignore: use_build_context_synchronously
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return SampoornaHomeScreen(
                                        studentId:allData[getxController.indexValue.value!]
                                    .docid! ,
                                          schoolId: Get.find<
                                                  AdminLoginScreenController>()
                                              .schoolID);
                                    },
                                  )) 
                                // ignore: use_build_context_synchronously
                                : Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return StundentSummery(
                                        studentId: allData[
                                                getxController
                                                    .indexValue.value!]
                                            .docid!,
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
                                              const Text("Class promotion",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          sizedBoxH20,
                                          GenrateTc(
                                              allData: allData,
                                              getxController: getxController),
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
                                                              firebase
                                                                  .collection(
                                                                      "Students")
                                                                  .doc(allData[getxController
                                                                          .indexValue
                                                                          .value!]
                                                                      .docid)
                                                                  .delete()
                                                                  .then((value) =>
                                                                      Navigator.pop(
                                                                          context));
                                                            },
                                                            child: const Text(
                                                                'Ok')),
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
                                                        children: const <
                                                            Widget>[
                                                          Text(
                                                              "By removing a student, you are deleting all the details associated with that student. Are you sure to proceed?")
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
  String schoolName = '';
  String schoolplace = '';
  @override
  void initState() {
    getSchoolDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection("AllStudents")
            .doc(widget.allData[widget.getxController.indexValue.value!].docid)
            .collection("sampoorna")
            .where('docid',
                isEqualTo: widget
                    .allData[widget.getxController.indexValue.value!].docid)
            .snapshots(),
        builder: (context, snappp) {
          return GestureDetector(
            onTap: () {
              TextEditingController sNo = TextEditingController();
              TextEditingController regNo = TextEditingController();

              showDialog(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Genrating.. TC'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          const Text('Enter Details'),
                          TextFormField(
                            controller: sNo,
                            decoration: const InputDecoration(hintText: "S.NO"),
                          ),
                          TextFormField(
                            controller: regNo,
                            decoration:
                                const InputDecoration(hintText: "Reg No"),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return GenrateTC(
                                  sno: sNo.text.trim(),
                                  regNo: regNo.text.trim(),
                                  parentName: snappp.data!.docs[0]
                                      ['nameOfStudentFather'],
                                  studentName: snappp.data!.docs[0]
                                      ['nameOfStudent'],
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/work.png'))),
                ),
                const Text(" Genrate TC",
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
