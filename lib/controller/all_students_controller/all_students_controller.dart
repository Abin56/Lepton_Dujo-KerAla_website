import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui team/sruthi/guardianInfo_alert_box.dart';
import '../../ui team/sruthi/parent_guardian_alert_box_widget.dart';
import '../../view/constant/constant.dart';
import '../../view/web/login/admin/admin_DashBoard/classes/details_ofClasses.dart';
import '../../view/web/login/admin/admin_DashBoard/sampoorna/sampoorna_home.dart';
import '../../view/web/login/admin/admin_DashBoard/transfer_cretificate/tc_genrate.dart';
import '../../view/web/widgets/button_container_widget.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AllStudentsController extends GetxController {
  final controller = Get.put(GetFireBaseData());

  final firebaseFirestore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  getStudentsDetails(
    BuildContext context,
    String classID,
    String? studentImage,
    String? studentName,
    String? studentEmail,
    String? phoneNumber,
    String? employeeID,
    String? houseName,
    String? place,
    String? district,
    String? gender,
    String? alphone,
    String? bloodgroup,
    String docid,
  ) async {
    log('Student iDDDDDD$docid');
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Text('Student Details'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(studentImage ?? ""),
                      ),
                      sizedBoxH30,
                      Row(
                        children: [
                          Text(
                            'Name : $studentName',
                            style: tea_style,
                          ),
                          IconButton(
                              onPressed: () async {
                                editStudentName(
                                    context, studentName ?? "", classID, docid);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ))
                        ],
                      ),
                      Text(
                        'Gender : $gender',
                        style: tea_style,
                      ),
                      Text(
                        'Blood Group : $bloodgroup',
                        style: tea_style,
                      ),
                      Text(
                        'E mail : $studentEmail',
                        style: tea_style,
                      ),
                      Row(
                        children: [
                          Text(
                            'Phone No : $phoneNumber',
                            style: tea_style,
                          ),
                          IconButton(
                              onPressed: () async {
                                await editPhoneNumber(
                                    context, phoneNumber ?? "", classID, docid);
                              },
                              icon: const Icon(Icons.edit, color: Colors.green))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Admission ID : $employeeID',
                            style: tea_style,
                          ),
                          IconButton(
                              onPressed: () async {
                                editEmployeID(
                                    context, docid, employeeID!, classID);
                              },
                              icon: const Icon(Icons.edit, color: Colors.green))
                        ],
                      ),
                      sizedBoxH10,
                      const Divider(),
                      sizedBoxH10,
                      const Text("More Details........"),
                      sizedBoxH10,
                      Text(
                        'Al.No : $alphone',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'House Name : $houseName',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'District : $district',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'Place  : $place',
                        style: tea_style,
                      ),
                      GestureDetector(
                         onTap: () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            ParentAlert_box_Widget(
                                          classID: classID,
                                          studentID: docid,
                                          text: 'Parent Info',
                                        ),
                                      );
                                    },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            ParentAlert_box_Widget(
                                          classID: classID,
                                          studentID: docid,
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
                              GestureDetector(
                                onTap: () async {
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) =>
                                                GuardianInfoAlert_box_Widget(
                                              classID: classID,
                                              studentID: docid,
                                              text: 'Guardian Info',
                                            ),
                                          );
                                        },
                                child: Container(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) =>
                                                GuardianInfoAlert_box_Widget(
                                              classID: classID,
                                              studentID: docid,
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
                                          style:
                                              TextStyle(fontWeight: FontWeight.bold)),
                                      const Icon(Icons.info_outlined),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      sizedBoxH20,
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                genrateTc(context, docid, studentName!);
                              },
                              child: ButtonContainerWidget(
                                curving: 5,
                                colorindex: 0,
                                height: 40.h,
                                width: 120.w,
                                child: Center(
                                  child: Text(
                                    'Genrate TC',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 255, 254, 254),
                                        fontSize: 14.w,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SampoornaHomeScreen(
                                        schoolId: schoolListValue!['docid'],
                                        studentId: docid);
                                  },
                                ));
                              },
                              child: Center(
                                child: ButtonContainerWidget(
                                  curving: 5,
                                  colorindex: 0,
                                  height: 42.h,
                                  width: 150.w,
                                  child: 
                                  Center(
                                    child: GoogleMonstserratWidgets(text: 
                                      'Genrate Sampoorna', fontsize: 13.w,
                                      color:  const Color.fromARGB(
                                              255, 255, 254, 254), 
                                          fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxH20,
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            removeStudent(context, classID, docid);
                          },
                          child: ButtonContainerWidget(
                            curving: 10,
                            colorindex: 6,
                            height: 40.h,
                            width: 110.w,
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
                        ),
                      )
                    ],
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

  editEmployeID(BuildContext context, String studentID, String admissionNuber,
      String classID) async {
    TextEditingController admissionNumberController = TextEditingController();
    final GlobalKey<FormState> updateFormkey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: updateFormkey,
          child: AlertDialog(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text('Change admission number'),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (admissionNumberController.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: admissionNumberController,
                    decoration: InputDecoration(hintText: admissionNuber),
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
                  if (updateFormkey.currentState!.validate()) {
                    await firebaseFirestore
                        .collection('classes')
                        .doc(classID)
                        .collection('Students')
                        .doc(studentID)
                        .update({
                      'admissionNumber': admissionNumberController.text.trim()
                    }).then((value) {
                      showToast(msg: "AdmissionNumber Changed");
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  } else {
                    return;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  editStudentName(BuildContext context, String studentName, String classID,
      String studentID) async {
    TextEditingController nameController = TextEditingController();
    final GlobalKey<FormState> updateFormkey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: updateFormkey,
          child: AlertDialog(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                sizedBoxw10,
                const Text('Change Name'),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (nameController.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    decoration: InputDecoration(hintText: studentName),
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
                  if (updateFormkey.currentState!.validate()) {
                    await firebaseFirestore
                        .collection('classes')
                        .doc(classID)
                        .collection('Students')
                        .doc(studentID)
                        .update({
                      'studentName': nameController.text.trim()
                    }).then((value) {
                      FirebaseFirestore.instance
                          .collection("SchoolListCollection")
                          .doc(Get.find<AdminLoginScreenController>().schoolID)
                          .collection('AllStudents')
                          .doc(studentID)
                          .update({'studentName': nameController.text.trim()});
                    }).then((value) {
                      showToast(msg: "Name Changed");
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  } else {
                    return;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  editPhoneNumber(BuildContext context, String phoneNumber, String classID,
      String studentId) async {
    TextEditingController phoneNumnberCOntroller = TextEditingController();
    final GlobalKey<FormState> updateFormkey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: updateFormkey,
          child: AlertDialog(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text('Change PhoneNumber'),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (phoneNumnberCOntroller.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: phoneNumnberCOntroller,
                    decoration: InputDecoration(hintText: phoneNumber),
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
                  if (updateFormkey.currentState!.validate()) {
                    await firebaseFirestore
                        .collection('classes')
                        .doc(classID)
                        .collection('Students')
                        .doc(studentId)
                        .update({
                      'parentPhoneNumber': phoneNumnberCOntroller.text.trim()
                    }).then((value) {
                      showToast(msg: "PhoneNumber Changed");
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  } else {
                    return;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  removeStudent(BuildContext context, String classID, String studentId) async {
    if (schoolListValue!['docid'] == FirebaseAuth.instance.currentUser!.uid) {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text('Alert'),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Once Student a teacher all data will be lost \n Are you shure to delete ?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  firebaseFirestore
                      .collection('classes')
                      .doc(classID)
                      .collection('Students')
                      .doc(studentId)
                      .delete()
                      .then((value) {
                    showToast(msg: "Removed");
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Sorry you have no access to delete')
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

  genrateTc(BuildContext context, String studentID, String studentName) async {
    TextEditingController sController = TextEditingController();
    TextEditingController regController = TextEditingController();
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gentrate Tc'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter S.No'),
                    controller: sController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter Reg.No'),
                    controller: regController,
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
              Obx(() {
                controller.getParentDetail(studentID);
                controller.getSchoolDetail();
                if (controller.schoolName.value.isEmpty &&
                    controller.placeNameofSchool.value.isEmpty &&
                    controller.parentNAme.value.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Get.to(GenrateTC(
                          sno: sController.text.trim(),
                          regNo: regController.text.trim(),
                          parentName: controller.parentNAme.value,
                          studentName: studentName,
                          schoolName: controller.schoolName.value,
                          schoolPlace: controller.placeNameofSchool.value));
                    },
                  );
                }
              }),
            ],
          );
        });
  }
}
