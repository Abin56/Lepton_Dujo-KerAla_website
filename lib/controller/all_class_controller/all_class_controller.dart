import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/list_students.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/web/login/admin/admin_DashBoard/classes/students_attendance/students_attendance_page.dart';
import '../../view/web/widgets/button_container_widget.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AllClassController extends GetxController {
  final firebaseFirestore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value)
      .collection('classes');
  showclass(BuildContext context, String className, String docid,
      String classInchargeTeacherName) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(className),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  width: 420.w,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250.w,
                          height: 150.h,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GoogleMonstserratWidgets(
                                      text: 'ClassName : $className',
                                      fontsize: 14.w),
                                  IconButton(
                                      onPressed: () async {
                                        await changeClassName(
                                            context, docid, className);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                        size: 30.w,
                                      )),
                                  IconButton(
                                      onPressed: () async {
                                        deleteBatchClasses(context, docid);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30.w,
                                      ))
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StreamBuilder(
                                      stream: firebaseFirestore
                                          .doc(docid)
                                          .collection('Students')
                                          .snapshots(),
                                      builder: (context, snapshotss) {
                                        if (snapshotss.hasData) {
                                          return GoogleMonstserratWidgets(
                                            text:
                                                'Total Students : ${snapshotss.data?.docs.length}',
                                            fontsize: 15.w,
                                          );
                                        } else {
                                          return Center(
                                            child: circularProgressIndicator,
                                          );
                                        }
                                      }),
                                ],
                              ),
                              sizedBoxH10,
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GoogleMonstserratWidgets(
                                      text:
                                          'ClassIncharge : $classInchargeTeacherName',
                                      fontsize: 15.w),
                                ],
                              ),
                            ],
                          ),
                        ),
                        sizedBoxH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ListOfStudents(
                                            classID: docid,
                                            className: className,
                                            schoolID: Get.find<
                                                    AdminLoginScreenController>()
                                                .schoolID);
                                      },
                                    ));
                                  },
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 0,
                                    height: 30.h,
                                    width: 120.w,
                                    child: Center(
                                      child: Text(
                                        'View Students',
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                sizedBoxH20,
                                GestureDetector(
                                  onTap: () async {},
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 0,
                                    height: 30.h,
                                    width: 120.w,
                                    child: Center(
                                      child: Text(
                                        'TimeTable',
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizedBoxw20,
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return AttendancePage();
                                      },
                                    ));
                                  },
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 0,
                                    height: 30.h,
                                    width: 120.w,
                                    child: Center(
                                      child: Text(
                                        'Attendance',
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                sizedBoxH20,
                                GestureDetector(
                                  onTap: () async {},
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 0,
                                    height: 30.h,
                                    width: 120.w,
                                    child: Center(
                                      child: Text(
                                        'Exam Results',
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizedBoxw20,
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ListOfStudents(
                                            classID: docid,
                                            className: className,
                                            schoolID: Get.find<
                                                    AdminLoginScreenController>()
                                                .schoolID);
                                      },
                                    ));
                                  },
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 0,
                                    height: 30.h,
                                    width: 120.w,
                                    child: Center(
                                      child: Text(
                                        'Teacher',
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                sizedBoxH20,
                                GestureDetector(
                                  onTap: () async {},
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 0,
                                    height: 30.h,
                                    width: 120.w,
                                    child: Center(
                                      child: Text(
                                        'Subject',
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: GoogleMonstserratWidgets(
                  text: 'Ok',
                  fontsize: 15.w,
                  color: cBlue,
                  fontWeight: FontWeight.w500),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  changeClassName(BuildContext context, String docid, String className) async {
    TextEditingController classNameCOntroller = TextEditingController();
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
                    icon: const Icon(
                      Icons.arrow_back,
                    )),
                const Text('Change Class Name'),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (classNameCOntroller.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: classNameCOntroller,
                    decoration: InputDecoration(hintText: className),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: GoogleMonstserratWidgets(text: 'cancel', fontsize: 14.w),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: GoogleMonstserratWidgets(text: 'ok', fontsize: 14.w),
                onPressed: () async {
                  if (updateFormkey.currentState!.validate()) {
                    await firebaseFirestore.doc(docid).update({
                      'className': classNameCOntroller.text.trim()
                    }).then((value) {
                      showToast(msg: "Class Name Changed");
                      Navigator.pop(context);
                      Navigator.pop(context);
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

  deleteBatchClasses(BuildContext context, String docid) async {
    if (schoolListValue!['docid'] == FirebaseAuth.instance.currentUser!.uid) {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: GoogleMonstserratWidgets(text: 'Alert', fontsize: 14.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GoogleMonstserratWidgets(
                    text:
                        'Once you delete a class all data will be lost \n Are you sure ?',
                    fontsize: 14.w,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: GoogleMonstserratWidgets(text: 'Cancel', fontsize: 14.w),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: GoogleMonstserratWidgets(text: 'Ok', fontsize: 14.w),
                onPressed: () async {
                  firebaseFirestore.doc(docid).delete().then((value) {
                    showToast(msg: "Removed Class");
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
                children: <Widget>[
                  GoogleMonstserratWidgets(
                    text: 'Sorry you have no access to delete',
                    fontsize: 14.w,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: GoogleMonstserratWidgets(text: 'Ok', fontsize: 14.w),
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
}
