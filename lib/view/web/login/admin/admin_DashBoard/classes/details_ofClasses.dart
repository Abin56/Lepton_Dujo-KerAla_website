// https://assets2.lottiefiles.com/packages/lf20_ijdvsseu.json

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/list_students.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/add_class/add_new_class.dart';

import '../../../../../constant/constant.dart';
import '../../../../widgets/button_container_widget.dart';
import '../teacher_section/class_listing_drop_down.dart';

class ClassesDeatils extends StatelessWidget {
  String schooilID;
  String totalStudents;
  String noofMale;
  String noofFemale;
  double width;
  ClassesDeatils({
    super.key,
    required this.schooilID,
    required this.getxController,
    required this.allData,
    required this.totalStudents,
    required this.noofMale,
    required this.noofFemale,
    required this.width
  });

  final getxController;
  final List<SchoolClassesModel> allData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: width,
      child: Obx(() {
        return getxController.indexValue.value == null || allData.isEmpty
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedBoxH30,
                  Text(
                    "Students Info ",
                    style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 75, 75, 75),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  sizedBoxH40,
                  Row(
                    children: [
                      sizedBoxW20,
                      LottieBuilder.network(
                        'https://assets2.lottiefiles.com/packages/lf20_ijdvsseu.json',
                        height: 100,
                      ),
                      sizedBoxW20,
                      Text(
                        " Total Students :  $totalStudents",
                        style: GoogleFonts.montserrat(
                            color: const Color.fromARGB(255, 17, 16, 16),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Row(
                  //     children: [
                  //       LottieBuilder.network(
                  //         'https://assets10.lottiefiles.com/packages/lf20_sxoye5rr.json',
                  //         height: 100,
                  //       ),
                  //       Text(
                  //         " Total Male :  $noofMale",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color.fromARGB(255, 11, 11, 11),
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // sizedBoxH10,
                  // Row(
                  //   children: [
                  //     LottieBuilder.network(
                  //       'https://assets2.lottiefiles.com/packages/lf20_pt810qkq.json',
                  //       height: 100,
                  //     ),
                  //     Text(
                  //       " Total Female :  $noofFemale",
                  //       style: GoogleFonts.poppins(
                  //           color: const Color.fromARGB(255, 22, 22, 22),
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/classes.png'),
                    ),
                    sizedBoxH30,
                    Text(
                      'Class : ${allData[getxController.indexValue.value!].className}',
                      style: tea_style,
                    ),
                    sizedBoxH10,
                    Text(
                      'Class Incharge :  ${allData[getxController.indexValue.value!].classTeacherName}',
                      style: tea_style,
                    ),
                    sizedBoxH10,
        
                    sizedBoxH10,
              
                    sizedBoxH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            updateClass(
                                context,
                                allData[getxController.indexValue.value!]
                                    .docid,
                                allData[getxController.indexValue.value!]
                                    .className,
                                schooilID);
                          },
                          child: ButtonContainerWidget(
                            curving: 20,
                            colorindex: 3,
                            height: 30,
                            width: 110,
                            child: Center(
                              child: Text(
                                'Edit',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 255, 254, 254),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Remove All the data'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text(
                                            ' All data will be lost'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () async {
                                        FirebaseFirestore.instance
                                            .collection("SchoolListCollection")
                                            .doc(Get.find<
                                                    AdminLoginScreenController>()
                                                .schoolID)
                                            .collection(Get
                                                    .find<GetFireBaseData>()
                                                .bYear
                                                .value)
                                            .doc(Get.find<GetFireBaseData>()
                                                .bYear
                                                .value)
                                            .collection("Classes")
                                            .doc(allData[getxController
                                                    .indexValue.value!]
                                                .docid)
                                            .delete()
                                            .then((value) =>
                                                Navigator.pop(context));
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: ButtonContainerWidget(
                            curving: 20,
                            colorindex: 6,
                            height: 30,
                            width: 110,
                            child: Center(
                              child: Text(
                                'Remove',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 255, 254, 254),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    sizedBoxH40,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ListOfStudents(
                                  className:
                                      allData[getxController.indexValue.value!]
                                          .className,
                                  classID:
                                      allData[getxController.indexValue.value!]
                                          .docid,
                                  schoolID: schooilID);
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2))),
                            height: 45,
                            width: 150,
                            child: Center(
                              child: Text(
                                "View Students",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }

  updateClass(
    BuildContext context,
    String classID,
    String className,
    String schooilID,
  ) async {
    TextEditingController newclassNameController = TextEditingController();

    var screenSize = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Class Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      height: 200,
                      width: 400,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: newclassNameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Name : $className',
                            ),
                          ),
                        ),
                        sizedBoxH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 150,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 3, 39, 68),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Change Incharge '),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child:
                                                        GetClassInchargeListDropDownButton(
                                                      schoolID: schooilID,
                                                    )),
                                                SizedBox(
                                                  height: 50,
                                                  width: 140,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              "SchoolListCollection")
                                                          .doc(
                                                              Get.find<AdminLoginScreenController>()
                                                                  .schoolID)
                                                          .collection(
                                                              Get.find<GetFireBaseData>()
                                                                  .bYear
                                                                  .value)
                                                          .doc(Get.find<
                                                                  GetFireBaseData>()
                                                              .bYear
                                                              .value)
                                                          .collection("Classes")
                                                          .doc(allData[
                                                                  getxController
                                                                      .indexValue
                                                                      .value!]
                                                              .docid)
                                                          .set(
                                                              {
                                                            "classIncharge":
                                                                classesInchargeListValue![
                                                                    'id'],
                                                          },
                                                              SetOptions(
                                                                  merge: true)).then(
                                                              (value) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "SchoolListCollection")
                                                            .doc(schooilID)
                                                            .collection(
                                                                "Teachers")
                                                            .doc(allData[
                                                                    getxController
                                                                        .indexValue
                                                                        .value!]
                                                                .classTeacherdocid)
                                                            .set(
                                                                {
                                                              "classIncharge":
                                                                  classesInchargeListValue![
                                                                      'id'],
                                                            },
                                                                SetOptions(
                                                                    merge:
                                                                        true));
                                                      }).then(
                                                              (value) =>
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false, // user must tap button!
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'Message'),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              ListBody(
                                                                            children: const <Widget>[
                                                                              Text('Successfully Updated'),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        actions: <
                                                                            Widget>[
                                                                          TextButton(
                                                                            child:
                                                                                const Text('Ok'),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ));
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 3, 39, 68),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    child: const Text("Change"),
                                                  ),
                                                ),
                                                sizedBoxH10,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    TextButton(
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text("Change Incharge")),
                            ),
                            SizedBox(
                              height: 60,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 3, 39, 68),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () async {
                                  final newclassName =
                                      newclassNameController.text.trim();

                                  try {
                                    final data = FirebaseFirestore.instance
                                        .collection("SchoolListCollection")
                                        .doc(Get.find<
                                                AdminLoginScreenController>()
                                            .schoolID)
                                        .collection(Get.find<GetFireBaseData>()
                                            .bYear
                                            .value)
                                        .doc(Get.find<GetFireBaseData>()
                                            .bYear
                                            .value)
                                        .collection("Classes")
                                        .doc(allData[getxController
                                                .indexValue.value!]
                                            .docid);
                                    if (newclassName.isNotEmpty) {
                                      await data.update({
                                        "className": newclassName
                                      }).then((value) {
                                        return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Message'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        'Successfully Updated'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      });
                                    } else {
                                      return;
                                    }
                                  } on FirebaseException catch (e) {
                                    log(e.message.toString());
                                  }
                                },
                                child: const Text("Update details"),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
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
          ],
        );
      },
    );
  }
}

final tea_style = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 115, 114, 114),
    fontSize: 14,
    fontWeight: FontWeight.w600);
