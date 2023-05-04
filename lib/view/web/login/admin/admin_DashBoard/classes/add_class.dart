import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_new_class/add_new_class.dart';
import 'package:dujo_kerala_website/model/add_class/add_new_class.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/create_classModel/create_classModel.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';
import '../teacher_section/class_listing_drop_down.dart';

class AddClassesSectionScreen extends StatelessWidget {
  AddSchoolClassController addSchoolClassController =
      Get.put(AddSchoolClassController());
  String schoolID;
  TextEditingController classNameController = TextEditingController();
  TextEditingController classIDController = TextEditingController();
  TextEditingController classInChargeController = TextEditingController();
  AddClassesSectionScreen({super.key, required this.schoolID});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    log(schoolID);
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 71, 157),
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButtonBackWidget(color: cWhite),
                    Expanded(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('SchoolListCollection')
                            .doc(schoolListValue!['docid'])
                            .collection(Get.find<GetFireBaseData>().bYear.value)
                            .doc(Get.find<GetFireBaseData>().bYear.value)
                            .collection('classes')
                            .snapshots(),
                        builder: (context, snapshots) {
                          if (snapshots.hasData) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  SchoolClassesModel data =
                                      SchoolClassesModel.fromMap(
                                          snapshots.data!.docs[index].data());
                                  return Container(
                                    height: 60,
                                    color: const Color.fromARGB(
                                        255, 129, 175, 236),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                '${snapshots.data!.docs[index]['className']}'),
                                            IconButton(
                                                onPressed: () async {
                                                  addSchoolClassController
                                                      .deleteBatchClasses(
                                                          context,
                                                          snapshots.data!
                                                                  .docs[index]
                                                              ['docid']);
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
                                        data.classTeacherdocid == ''
                                            ? GestureDetector(
                                                onTap: () {
                                                  addSchoolClassController
                                                      .setclassIncharge(
                                                          snapshots.data!
                                                                  .docs[index]
                                                              ['docid'],
                                                          context);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 100,
                                                  color: Colors.green,
                                                ),
                                              )
                                            : Row(
                                                children: [
                                                  Text(snapshots
                                                          .data!.docs[index]
                                                      ['classTeacherName']),
                                                  IconButton(
                                                      onPressed: () async {
                                                        addSchoolClassController
                                                            .setclassIncharge(
                                                                snapshots.data!
                                                                            .docs[
                                                                        index]
                                                                    ['docid'],
                                                                context);
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.green,
                                                      ))
                                                ],
                                              )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: snapshots.data!.docs.length);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                child: Column(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        validator: checkFieldEmpty,
                        controller: classNameController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Class Name',
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                      onPressed: () async {
                        addSchoolClassController
                            .addNewClassFunction(classNameController);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Class')),
                  SizedBox(
                    height: 600,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('SchoolListCollection')
                            .doc(schoolListValue!['docid'])
                            .collection('classes')
                            .snapshots(),
                        builder: (context, snapshots) {
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                if (snapshots.hasData) {
                                  return Container(
                                    height: 80,
                                    color:
                                        const Color.fromARGB(255, 94, 146, 214),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            '${snapshots.data!.docs[index]['className']}'),
                                        IconButton(
                                            onPressed: () async {
                                              addSchoolClassController
                                                  .updateClassName(
                                                      snapshots.data!
                                                          .docs[index]['docid'],
                                                      context,
                                                      snapshots
                                                              .data!.docs[index]
                                                          ['className']);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              addSchoolClassController
                                                  .deleteClass(
                                                      snapshots.data!
                                                          .docs[index]['docid'],
                                                      context);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                        GestureDetector(
                                          onTap: () async {
                                            addSchoolClassController
                                                .setClassForbatchYear(
                                                    snapshots.data!.docs[index]
                                                        ['className'],
                                                    snapshots.data!.docs[index]
                                                        ['docid']);
                                          },
                                          child: const SizedBox(
                                            width: 100,
                                            child: Text('Add'),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: snapshots.data!.docs.length);
                        }),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
