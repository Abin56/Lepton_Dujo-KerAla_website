import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/teacher/teacher_model.dart';
import '../../view/constant/constant.dart';
import '../../view/web/login/admin/admin_DashBoard/classes/details_ofClasses.dart';
import '../../view/web/widgets/button_container_widget.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class AllTeachersController extends GetxController {
  final firebaseFirestore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection("Teachers");

  List<TeacherModel> searchTeachers = [];
  Future<void> fetchStudents() async {
    searchTeachers.clear();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection("Teachers")
              .get();
      searchTeachers =
          snapshot.docs.map((e) => TeacherModel.fromMap(e.data())).toList();
    } catch (e) {
      showToast(msg: "Teacher Data Error");
    }
  }

  @override
  void onInit() async {
    await fetchStudents();
    super.onInit();
  }

  getTeacherDetails(
    BuildContext context,
    String? teacherImage,
    String? teacherName,
    String? teacherEmail,
    String? phoneNumber,
    String? employeeID,
    String? houseName,
    String? houseNumber,
    String? place,
    String? district,
    String? gender,
    String? alphone,
    String docid,
  ) async {
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
              const Text('Teacher Details'),
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
                        backgroundImage: NetworkImage(teacherImage ?? ""),
                      ),
                      sizedBoxH30,
                      Row(
                        children: [
                          Text(
                            'Name : $teacherName',
                            style: tea_style,
                          ),
                          IconButton(
                              onPressed: () async {
                                editTeacherName(
                                    context, teacherName ?? '', docid);
                              },
                              icon: const Icon(Icons.edit,color: Colors.green,))
                        ],
                      ),
                      Text(
                        'Gender : $gender',
                        style: tea_style,
                      ),
                      Text(
                        'E mail : $teacherEmail',
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
                                    context, phoneNumber??"", docid);
                              },
                              icon: const Icon(Icons.edit,color: Colors.green))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Employe ID : $employeeID',
                            style: tea_style,
                          ),
                          IconButton(
                              onPressed: () async {
                                editEmployeID(context, docid, employeeID!);
                              },
                              icon: const Icon(Icons.edit,color: Colors.green))
                        ],
                      ),
                      sizedBoxH10,
                      const Divider(),
                      sizedBoxH10,
                      const Text("More Details........"),
                      sizedBoxH10,
                      Text(
                        'Al.No : $phoneNumber',
                        style: tea_style,
                      ),
                      sizedBoxH10,
                      Text(
                        'House No : $houseNumber',
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
                      Center(
                        child:          GestureDetector(
                            onTap: () async {
                              removeTeacher(context, docid);
                            },
                            child: ButtonContainerWidget(
                              curving: 10,
                              colorindex: 6,
                              height: 40,
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

  editEmployeID(
      BuildContext context, String teacherID, String employeeID) async {
    TextEditingController employeController = TextEditingController();
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
                const Text('Change EmployeID'),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (employeController.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: employeController,
                    decoration: InputDecoration(hintText: employeeID),
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
                    await firebaseFirestore.doc(teacherID).update({
                      'employeeID': employeController.text.trim()
                    }).then((value) {
                      showToast(msg: "EmployeID Changed");
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

  editTeacherName(
      BuildContext context, String teacherName, String teacherid) async {
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
                    decoration: InputDecoration(hintText: teacherName),
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
                    await firebaseFirestore.doc(teacherid).update({
                      'teacherName': nameController.text.trim()
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

  editPhoneNumber(
      BuildContext context, String phoneNumber, String teacherId) async {
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
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ok'),
                onPressed: () async {
                  if (updateFormkey.currentState!.validate()) {
                    await firebaseFirestore.doc(teacherId).update({
                      'teacherPhNo': phoneNumnberCOntroller.text.trim()
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

  removeTeacher(BuildContext context, String teacherID) async {
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
                    'Once delete a teacher all data will be lost \n Are you shure to delete ?')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                firebaseFirestore.doc(teacherID).delete().then((value) {
                  showToast(msg: "Removed");
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
    }else{
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
