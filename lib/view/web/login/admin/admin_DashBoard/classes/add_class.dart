// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_new_class/add_new_class.dart';
import 'package:dujo_kerala_website/model/add_class/add_new_class.dart';
import 'package:dujo_kerala_website/ui%20team/abin/alumini_accocation/create_alumni.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';


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
              SizedBox(
                height: screenSize.height,
                width: screenSize.width * 1 / 2,
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButtonBackWidget(color: cWhite),
                        SizedBox(
                          width: 40.w,
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        GoogleMonstserratWidgets(
                          text: '${Get.find<GetFireBaseData>().bYear.value} -Class Teacher Pannel', ////changed normal text to original batch year
                          //'2023 -2024 batch',
                          fontsize: 17.w,
                          color: cWhite,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: SizedBox(
                            width: screenSize.width * 0.062,
                            //  color: Color.fromARGB(255, 63, 181, 102),
                            child: Center(
                              child: GoogleMonstserratWidgets(
                                  text: 'ClassName',
                                  fontsize: 12.w,
                                  color: cWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            // color: cBlue,
                            alignment: Alignment.centerLeft,
                            width: screenSize.width * 0.28,
                            child: Center(
                              child: GoogleMonstserratWidgets(
                                text: 'ClassTeacherName',
                                fontsize: 15.w,
                                color: cWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            // color: Colors.amber,
                            width: screenSize.width * 0.06,
                            child: Center(
                              child: GoogleMonstserratWidgets(
                                  text: 'Add/Edit',
                                  fontsize: 12.w,
                                  color: cWhite,
                                  fontWeight: FontWeight.w600),
                            )),
                        SizedBox(
                          width: screenSize.width * 0.03,
                          child: Center(
                            child: GoogleMonstserratWidgets(
                                text: 'Delete',
                                fontsize: 12.w,
                                color: cWhite,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(schoolListValue!['docid'])
                              .collection(
                                  Get.find<GetFireBaseData>().bYear.value)
                              .doc(Get.find<GetFireBaseData>().bYear.value)
                              .collection('classes')
                              .snapshots(),
                          builder: (context, snapshots) {
                            if (snapshots.hasData) {
                              return Container(
                                margin: EdgeInsets.all(10.w),
                                color: cWhite,
                                child: ListView.builder(
                                  itemCount: snapshots.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    SchoolClassesModel data =
                                        SchoolClassesModel.fromMap(
                                            snapshots.data!.docs[index].data());
                                    return Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 224, 219, 219),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.w),
                                          ),

                                        ),
                                        height: 65.w,
                                        width: 85.w,
                                        child: Container(
                                          height: 75.w ,
                                          width: 90.w,
                                          margin: EdgeInsets.only(top: 15.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10.w),
                                                child: SizedBox(
                                                  width:
                                                      screenSize.width * 0.05,
                                                  //  color: Color.fromARGB(255, 63, 181, 102),
                                                  child: Center(
                                                    child: GoogleMonstserratWidgets(
                                                        text:
                                                            '${snapshots.data!.docs[index]['className']}',
                                                        fontsize: 15.w,
                                                        color: cBlack,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Container(
                                                  // color: cBlue,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  width: screenSize.width * 0.3,
                                                  child: Center(
                                                    child:
                                                        GoogleMonstserratWidgets(
                                                      text: snapshots
                                                              .data!.docs[index]
                                                          ['classTeacherName'],
                                                      fontsize: 16.w,
                                                      color: cBlack,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  data.classTeacherdocid == ''
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            addSchoolClassController
                                                                .setclassIncharge(
                                                                    snapshots
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'docid'],
                                                                    context);
                                                          },
                                                          child: SizedBox(
                                                            // color: Colors.amber,
                                                            width: screenSize
                                                                    .width *
                                                                0.06,
                                                            child: Center(
                                                              child: GoogleMonstserratWidgets(
                                                                  text:
                                                                      '+ Add Class\n teacher',
                                                                  fontsize:
                                                                      12.w,
                                                                  color: cBlue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () async {
                                                            addSchoolClassController
                                                                .setclassIncharge(
                                                                    snapshots
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'docid'],
                                                                    context);
                                                          },
                                                          child: SizedBox(
                                                            width: screenSize
                                                                    .width *
                                                                0.03,
                                                            child: Center(
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    addSchoolClassController.setclassIncharge(
                                                                        snapshots
                                                                            .data!
                                                                            .docs[index]['docid'],
                                                                        context);
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .edit)),
                                                            ),
                                                          )),
                                                  SizedBox(
                                                    width:
                                                        screenSize.width * 0.03,
                                                    child: Center(
                                                      child: IconButton(
                                                          onPressed: () async {
                                                            addSchoolClassController
                                                                .deleteBatchClasses(
                                                                    context,
                                                                    snapshots
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'docid']);
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: cred,
                                                            size: 20.w,
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  color: Colors.white,
                  height: screenSize.height,
                  width: screenSize.width * 1 / 2,
                  child: Container(
                   // height: screenSize.height,
                    child: Column(children: [
                      sizedBoxH30,
                       GoogleMonstserratWidgets(
                          text: '${Get.find<GetFireBaseData>().bYear.value} -Class List', ////changed normal text to original batch year
                          //'2023 -2024 batch',
                          fontsize: 17.w,
                          color: cBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: TextFormField(
                          validator: (value) {
                                if (classNameController.text.isEmpty) {
                                  return 'Invalid';
                                } else {
                                  return null;
                                }
                              },
                            controller: classNameController,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.w,
                        width: 160.w,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.blue.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextButton.icon(
                            onPressed: () async {
                               if (formKey.currentState!.validate()) {
                              addSchoolClassController
                                  .addNewClassFunction(classNameController);
                                  showToast(msg: 'Class added');
                               }
                            },
                            icon: const Icon(Icons.add, color: cWhite),
                            label: GoogleMonstserratWidgets(
                              text: 'Add Class',
                              fontsize: 15.w,
                              color: cWhite,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(
                        height: 500.w,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(schoolListValue!['docid'])
                                .collection('classes')
                                .snapshots(),
                            builder: (context, snapshots) {

                              if(snapshots.hasData){
                                 return GridView.builder(
                                itemCount: snapshots.data!.docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,

                                ),
                                itemBuilder: (context, index) {
                                  
                                    return Padding(
                                      padding: EdgeInsets.all(20.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            // .withOpacity(0.9),
                                            // border: Border.all(),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        211, 122, 117, 117)
                                                    .withOpacity(0.5),
                                                spreadRadius: 10,
                                                blurRadius: 10,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(3.w),
                                            )),
                                        height: 80.w,
                                        width: 160.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            GoogleMonstserratWidgets(
                                                text:
                                                    '${snapshots.data!.docs[index]['className']}',
                                                fontsize: 15.w,
                                                color: cBlack,
                                                fontWeight: FontWeight.w600),
                                            GestureDetector(
                                              onTap: () async {
                                                addSchoolClassController
                                                    .setClassForbatchYear(
                                                        snapshots.data!
                                                                .docs[index]
                                                            ['className'],
                                                        snapshots.data!
                                                                .docs[index]
                                                            ['docid']);
                                                            showToast(msg: 'Added to Panel');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        // color: cWhite
                                                        ),
                                                    color: Colors.blue
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                4.w))),
                                                width: 105.w,
                                                height: 29.w,
                                                child: Center(
                                                  child:
                                                      GoogleMonstserratWidgets(
                                                    text: 'Add to Panel',
                                                    fontsize: 13.w,
                                                    color: cBlack,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),

                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                //SizedBox(height: 20.h,),

                                                IconButton(
                                                    onPressed: () async {
                                                      addSchoolClassController
                                                          .updateClassName(
                                                              snapshots.data!
                                                                          .docs[
                                                                      index]
                                                                  ['docid'],
                                                              context,
                                                              snapshots.data!
                                                                          .docs[
                                                                      index][
                                                                  'className']);
                                                    },
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: cgreen,
                                                      size: 20.w,
                                                    )),

                                                IconButton(
                                                    onPressed: () async {
                                                      addSchoolClassController
                                                          .deleteClass(
                                                              snapshots.data!
                                                                          .docs[
                                                                      index]
                                                                  ['docid'],
                                                              context);
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: cred,
                                                      size: 20.w,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                 
                                },
                              );
                              }
                              return circularProgressIndicator;
                             
                            }),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
