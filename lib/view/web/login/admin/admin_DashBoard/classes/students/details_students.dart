import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/parents&guardian.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../controller/students_list/students_list.dart';
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
  final List<AddExtraDetailsofStudentsModel> allData;

  @override
  Widget build(BuildContext context) {
    final _firebase = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schooilID)
        .collection('Classes')
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
                              .studentImage),
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
                                                      .id)
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
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    sizedBoxH10,
                    Text(
                      'E mail : ${allData[getxController.indexValue.value!].id}',
                      style: tea_style,
                    ),
                    sizedBoxH10,
                    Row(
                      children: [
                        Text(
                          'Phone No : ${allData[getxController.indexValue.value!].parentPhNo}',
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
                                                      .id)
                                                  .set({
                                                'parentPhNo':
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
                                                  .parentPhNo),
                                          controller: _newPhoneNoController,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(
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
                                                      .id)
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
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    sizedBoxH10,
                    Text(
                      'Blood Group : ${allData[getxController.indexValue.value!].bloodGroup}',
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
                                        .id);
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
                                        .id);
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
                    sizedBoxH20,
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
                                                            'assets/images/work.png'))),
                                              ),
                                              const Text("TC Genrate ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
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
                                                                      .id)
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
                                                          Text(
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
                                              child: Center(
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

final tea_style = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 115, 114, 114),
    fontSize: 14,
    fontWeight: FontWeight.w600);
