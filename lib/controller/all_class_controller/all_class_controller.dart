import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/list_students.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('ClassName : $className'),
                          IconButton(
                              onPressed: () async {
                                await changeClassName(
                                    context, docid, className);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          StreamBuilder(
                              stream: firebaseFirestore
                                  .doc(docid)
                                  .collection('Students')
                                  .snapshots(),
                              builder: (context, snapshotss) {
                                if (snapshotss.hasData) {
                                  return Text(
                                      'Total Students : ${snapshotss.data?.docs.length}');
                                } else {
                                  return Center(
                                    child: circularProgressIndicator,
                                  );
                                }
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Text('ClassIncharge : $classInchargeTeacherName'),
                        ],
                      ),
                      sizedBoxH20,
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ListOfStudents(
                                    classID: docid,
                                    className: className,
                                    schoolID:
                                        Get.find<AdminLoginScreenController>()
                                            .schoolID);
                              },
                            ));
                          },
                          child: ButtonContainerWidget(
                            curving: 10,
                            colorindex: 0,
                            height: 30,
                            width: 120,
                            child: Center(
                              child: Text(
                                'View Students',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 255, 254, 254),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      sizedBoxH20,
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            deleteBatchClasses(context, docid);
                          },
                          child: ButtonContainerWidget(
                            curving: 10,
                            colorindex: 6,
                            height: 30,
                            width: 120,
                            child: Center(
                              child: Text(
                                'Remove Class',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 255, 254, 254),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
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
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ok'),
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
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Once you delete a class all data will be lost \n Are you sure ?')
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
}
