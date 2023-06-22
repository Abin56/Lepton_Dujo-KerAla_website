import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_new_class/add_new_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/teachersList/teachers_list.dart';
import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../constant/constant.dart';
import '../../../../widgets/button_container_widget.dart';

class TeacherDeatils extends StatelessWidget {
  AddSchoolClassController addSchoolClassController =
      Get.put(AddSchoolClassController());
  String schooilID;
  TeacherDeatils({
    super.key,
    required this.schooilID,
    required this.getxController,
    required this.allData,
  });

  final TeachersProfileList getxController;
  final List<TeacherModel> allData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: 500,
      child: Obx(() {
        return getxController.indexValue.value == null || allData.isEmpty
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "T e a c h e r ",
                      style: GoogleFonts.montserrat(
                          color: const Color.fromARGB(255, 75, 75, 75),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    LottieBuilder.network(
                        'https://assets8.lottiefiles.com/private_files/lf30_Fy9W8c.json')
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(
                            allData[getxController.indexValue.value!]
                                    .imageUrl ??
                                ''),
                      ),
                      sizedBoxH30,
                      Text(
                        'Name : ${allData[getxController.indexValue.value!].teacherName}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      // Text(
                      //   'Class Incharge :  ${allData[getxController.indexValue.value!].}',
                      //   style: tea_style,
                      // ),
                      sizedBoxH10,
                      Text(
                        'E mail : ${allData[getxController.indexValue.value!].teacherEmail}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'Phone No : ${allData[getxController.indexValue.value!].teacherPhNo}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'Employe ID : ${allData[getxController.indexValue.value!].employeeID}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      // Text(
                      //   'Blood Group : ${allData[getxController.indexValue.value!].b}',
                      //   style: tea_style,
                      // ),
                      sizedBoxH10,
                      const Divider(),
                      sizedBoxH10,
                      const Text("More Details........"),
                      sizedBoxH10,
                      Text(
                        'House No : ${allData[getxController.indexValue.value!].houseNumber}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'House Name : ${allData[getxController.indexValue.value!].houseName}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'District : ${allData[getxController.indexValue.value!].district}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'Place  : ${allData[getxController.indexValue.value!].place}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'Creation Date : ${allData[getxController.indexValue.value!].createdAt}',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              updateTeacher(
                                  context,
                                  allData[getxController.indexValue.value!]
                                          .employeeID ??
                                      '',
                                  allData[getxController.indexValue.value!]
                                          .teacherName ??
                                      "",
                                  allData[getxController.indexValue.value!]
                                          .teacherPhNo ??
                                      "",
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
                                    title: const Text('Remove all the data?'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text(' All data will be lost'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ok'),
                                        onPressed: () async {
                                          FirebaseFirestore.instance
                                              .collection(
                                                  "SchoolListCollection")
                                              .doc(schooilID)
                                              .collection("Teachers")
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
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }

  updateTeacher(
    BuildContext context,
    String employeeID,
    String teacherName,
    String phoneNumber,
    String schooilID,
  ) async {
    TextEditingController newEmployeIDController = TextEditingController();
    TextEditingController newteacherNameInchargeController =
        TextEditingController();
    TextEditingController newPhoneNumberController = TextEditingController();

    var screenSize = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Teacher Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      height: screenSize.width * 1 / 4,
                      width: screenSize.width * 1 / 4,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: newteacherNameInchargeController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Name : $teacherName',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: newPhoneNumberController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Phone number : $phoneNumber',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: newEmployeIDController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Employe ID : $employeeID',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   height: 60,
                            //   width: 150,
                            //   child: ElevatedButton(
                            //       style: ElevatedButton.styleFrom(
                            //         backgroundColor:
                            //             const Color.fromARGB(255, 3, 39, 68),
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(20),
                            //         ),
                            //       ),
                            //       onPressed: () async {
                            //         addSchoolClassController.setclassIncharge(
                            //             allData[getxController
                            //                     .indexValue.value!]
                            //                 .docid!,
                            //             context);
                            //       },
                            //       child: const Text("Change Incharge")),
                            // ),
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
                                  final newEmployID =
                                      newEmployeIDController.text.trim();
                                  final newTeacherName =
                                      newteacherNameInchargeController.text
                                          .trim();
                                  final newPhoneNumber =
                                      newPhoneNumberController.text.trim();

                                  try {
                                    final data = FirebaseFirestore.instance
                                        .collection("SchoolListCollection")
                                        .doc(schooilID)
                                        .collection("Teachers")
                                        .doc(allData[getxController
                                                .indexValue.value!]
                                            .docid);
                                    if (newTeacherName.isNotEmpty &&
                                        newEmployID.isEmpty &&
                                        newPhoneNumber.isEmpty) {
                                      await data.update({
                                        "teacherName": newTeacherName
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
                                    } else if (newTeacherName.isEmpty &&
                                        newPhoneNumber.isNotEmpty &&
                                        newEmployID.isNotEmpty) {
                                      await data.update({
                                        "teacherPhNo": newPhoneNumber
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
                                    } else if (newTeacherName.isEmpty &&
                                        newPhoneNumber.isEmpty &&
                                        newEmployID.isNotEmpty) {
                                      await data.update({
                                        "employeeID": newEmployID
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
                                    } else if (newTeacherName.isNotEmpty &&
                                        newEmployID.isNotEmpty &&
                                        newPhoneNumber.isNotEmpty) {
                                      await data.update({
                                        "teacherName": newTeacherName,
                                        "employeeID": newEmployID,
                                        "teacherPhNo": newPhoneNumber,
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
                                    } else if (newTeacherName.isNotEmpty &&
                                        newPhoneNumber.isNotEmpty &&
                                        newEmployID.isEmpty) {
                                      await data.update({
                                        "teacherName": newTeacherName,
                                        "teacherPhNo": newPhoneNumber,
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
                                    } else if (newTeacherName.isNotEmpty &&
                                        newEmployID.isNotEmpty &&
                                        newPhoneNumber.isEmpty) {
                                      await data.update({
                                        "teacherName": newTeacherName,
                                        "employeeID": newEmployID,
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
                                    } else if (newTeacherName.isEmpty &&
                                        newPhoneNumber.isNotEmpty &&
                                        newEmployID.isNotEmpty) {
                                      await data.update({
                                        "teacherPhNo": newPhoneNumber,
                                        "employeeID": newEmployID
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
              child: const Text('Ok'),
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
