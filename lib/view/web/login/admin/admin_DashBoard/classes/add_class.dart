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
                          text: '2023 -2024 batch',
                          fontsize: 18.w,
                          color: cWhite,
                        )
                      ],
                    ),
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
                            return GridView.builder(
                              itemCount: snapshots.data!.docs.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 35.0,
                                mainAxisSpacing: 25.0,
                              ),
                              itemBuilder: (context, index) {
                                SchoolClassesModel data =
                                    SchoolClassesModel.fromMap(
                                        snapshots.data!.docs[index].data());
                                return Padding(
                                  padding: const EdgeInsets.all(26),
                                  child: Container(
                                  
                                       
                                    decoration: BoxDecoration(
                                        color:  cWhite,
                                        
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.w),
                                        ),
                                        border: Border.all(color: cBlack)),
                                    height: 105.h,
                                    width: 85.w,
                                    child: Container(
                                        height: 100.h,
                                    width: 90.w,
                                      margin:  EdgeInsets.only( top: 15.h),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GoogleMonstserratWidgets(
                                              text:
                                                  '${snapshots.data!.docs[index]['className']}',
                                              fontsize: 17.w,
                                              color: cBlack,
                                              fontWeight: FontWeight.bold),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          GoogleMonstserratWidgets(
                                            text: snapshots.data!.docs[index]
                                                ['classTeacherName'],
                                            fontsize: 14.w,
                                            color: cBlack,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [

                                                Padding(
                                                  padding:  EdgeInsets.all(10.w),
                                                  child: GestureDetector(
                                                    onTap:() async {
                                                    addSchoolClassController
                                                        .deleteBatchClasses(
                                                            context,
                                                            snapshots.data!
                                                                        .docs[
                                                                    index]
                                                                ['docid']);
                                                  },
                                                    child: Container(
                                                      height: 25.h,
                                                      width: 60.w,
                                                      decoration: BoxDecoration(
                                                        color: cred,
                                                        borderRadius: BorderRadius.all(Radius.circular(2))),
                                                        child: Center(
                                                          child: GoogleMonstserratWidgets(
                                                            text: "Delete", fontsize: 10,color: cWhite)),
                                                        ),
                                                  ),
                                                ),

                                              data.classTeacherdocid == ''
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        addSchoolClassController
                                                            .setclassIncharge(
                                                                snapshots.data!
                                                                            .docs[
                                                                        index]
                                                                    ['docid'],
                                                                context);
                                                      },
                                                      child: Container(
                                                        height: 40.h,
                                                        width: 95.w,
                                                        // color: Colors.green,
                                                        child: GoogleMonstserratWidgets(
                                                          text: 'Assign \nClassteacher', fontsize: 12,
                                                        color: cBlue,fontWeight: FontWeight.w500),
                                                      ),
                                                    )
                                                  :  Padding(
                                                 padding:  EdgeInsets.all(10.w),
                                                 child: GestureDetector(
                                                  onTap: () async {
                                                        addSchoolClassController
                                                            .setclassIncharge(
                                                                snapshots.data!
                                                                            .docs[
                                                                        index]
                                                                    ['docid'],
                                                                context);
                                                      },
                                                   child: Container(
                                                    height: 25.h,
                                                        width: 60.w,
                                                        decoration: BoxDecoration(
                                                          color: cgreen,
                                                          borderRadius: BorderRadius.all(Radius.circular(2))),
                                                          child: Center(
                                                            child: GoogleMonstserratWidgets(
                                                              text: "Edit", fontsize: 10,color: cWhite)),
                                                   ),
                                                 ),
                                               ),
                                                  
                                                  
                                                  
                                             
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
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
              Form(
                key: formKey,
                child: Container(
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

                  Container(
                    height: 50.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: adminePrimayColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                
                   child: TextButton.icon(
                        onPressed: () async {
                          addSchoolClassController
                              .addNewClassFunction(classNameController);
                        },
                        icon: const Icon(Icons.add,color: cWhite),
                        label: GoogleMonstserratWidgets(text: 'Add Class', 
                        fontsize: 15,color: cWhite,fontWeight: FontWeight.w600,)
                         ),  ),
                    SizedBox(
                      height: 600.h,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(schoolListValue!['docid'])
                              .collection('classes')
                              .snapshots(),
                          builder: (context, snapshots) {
                            return GridView.builder( itemCount: snapshots.data!.docs.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 30.0,
                                mainAxisSpacing: 20.0,
                              ),
                                itemBuilder: (context, index) {
                                  if (snapshots.hasData) {
                                    return Padding(
                                      padding:  EdgeInsets.all(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                           color:
                                            const Color.fromARGB(255, 6, 71, 157),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.w),)),
                                        height: 80.h,
                                        width: 160.w,
                                       
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(height: 10.h,),
                                            GoogleMonstserratWidgets(
                                              text:  '${snapshots.data!.docs[index]['className']}', 
                                              fontsize: 15.w,color: cWhite,fontWeight: FontWeight.w600),

                                               GestureDetector(
                                              onTap: () async {
                                                addSchoolClassController
                                                    .setClassForbatchYear(
                                                        snapshots.data!.docs[index]
                                                            ['className'],
                                                        snapshots.data!.docs[index]
                                                            ['docid']);
                                              },
                                              child: SizedBox(
                                                width: 100.w,
                                                child: Center(
                                                  child: GoogleMonstserratWidgets(text: 'Add', 
                                                  fontsize: 15,color:cWhite,fontWeight: FontWeight.w500, ),
                                                ),
                                                //Text(''),
                                              ),
                                            ),
                                            
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                 //SizedBox(height: 20.h,),

                                                Padding(
                                                  padding:  EdgeInsets.all(15.w),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                    addSchoolClassController
                                                        .deleteClass(
                                                            snapshots.data!
                                                                .docs[index]['docid'],
                                                            context);
                                                  }, 
                                                    child: Container(
                                                      height: 25.h,
                                                      width: 60.w,
                                                      decoration: BoxDecoration(
                                                        color: cred,
                                                        borderRadius: BorderRadius.all(Radius.circular(2))),
                                                        child: Center(
                                                          child: GoogleMonstserratWidgets(
                                                            text: "Delete", fontsize: 10,color: cWhite)),
                                                        ),
                                                  ),
                                                ),
                                               


                                               Padding(
                                                 padding:  EdgeInsets.all(15.w),
                                                 child: GestureDetector(
                                                  onTap: () async {
                                                        addSchoolClassController
                                                            .updateClassName(
                                                                snapshots.data!
                                                                    .docs[index]['docid'],
                                                                context,
                                                                snapshots
                                                                        .data!.docs[index]
                                                                    ['className']);
                                                      },
                                                   child: Container(
                                                    height: 25.h,
                                                        width: 60.w,
                                                        decoration: BoxDecoration(
                                                          color: cgreen,
                                                          borderRadius: BorderRadius.all(Radius.circular(2))),
                                                          child: Center(
                                                            child: GoogleMonstserratWidgets(
                                                              text: "Edit", fontsize: 10,color: cWhite)),
                                                   ),
                                                 ),
                                               ),
                                             ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              );
                          }),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
