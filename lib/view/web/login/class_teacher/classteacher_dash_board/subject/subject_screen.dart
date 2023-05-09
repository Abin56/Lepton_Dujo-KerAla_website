// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_subject/subject_controller.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../colors/colors.dart';
import '../../../../widgets/Iconbackbutton.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';

class SubmitSubjectClassTeacher extends StatelessWidget {
  final getxcontroller = Get.find<GetFireBaseData>();
  final GlobalKey<FormState> addFormkey = GlobalKey<FormState>();
  SubjectController subjectControllerr = Get.put(SubjectController());
  SubmitSubjectClassTeacher({
    super.key,
    required this.schoolID,
    required this.teacherClassId,
  });
  TextEditingController subjecController = TextEditingController();
  final String schoolID;
  final String teacherClassId;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: addFormkey,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Row(children: [
            Container(
              color: const Color.fromARGB(255, 12, 34, 133),
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButtonBackWidget(color: cWhite),
                      SizedBox(
                        width: 50.w,
                      ),
                      GoogleMonstserratWidgets(
                          text: '${Get.find<GetFireBaseData>().bYear.value} '+'  Subject List',
                          fontsize: 18.w,
                          color: cWhite),
                    ],
                  ),
                  Expanded(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(schoolListValue!['docid'])
                              .collection(
                                  Get.find<GetFireBaseData>().bYear.value)
                              .doc(Get.find<GetFireBaseData>().bYear.value)
                              .collection('classes')
                              .doc(Get.find<GetFireBaseData>()
                                  .getTeacherClassRole
                                  .value)
                              .collection('subjects')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                                return Container(
                                  margin: EdgeInsets.all(10.w),
                                  color: cWhite,
                                  child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:  EdgeInsets.only(top: 5.w),
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
                                                                    
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                child: Container(
                                                  alignment: Alignment.centerLeft,
                                                  width: screenSize.width * 0.28,
                                                  child: Center(
                                                      child: GoogleMonstserratWidgets(
                                                    text: snapshot.data?.docs[index]
                                                        ['subjectName'],
                                                    fontsize: 15.w,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                      
                                                      ),
                                                ),
                                              ),
                                                                    
                                             IconButton(
                                              onPressed: () {
                                               
                                             }, 
                                             icon: Icon(Icons.delete,color: cred,size: 18.w,))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                 
                                  itemCount: snapshot.data!.docs.length),
                                );
                              
                            }else{
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          
                          })),
                ],
              ),
            ),
            Container(
              
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    color: Colors.white,
                  height: screenSize.height,
                  width: screenSize.width * 1 / 2,
                    //height: screenSize.width/30,
                    child: Column(
                      children: [
                        GoogleMonstserratWidgets(
                      text: Get.find<GetFireBaseData>().bYear.value +
                          ' -Add Subject', ////changed normal text to original batch year
                      //'2023 -2024 batch',
                      fontsize: 17.w,
                      color: cBlack,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10.w,),

                        Padding(
                          padding:  EdgeInsets.all(15.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: const Border()),
                            child: TextFormField(
                              validator: (value) {
                                if (subjecController.text.isEmpty) {
                                  return 'Invalid';
                                } else {
                                  return null;
                                }
                              },
                              controller: subjecController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                      255, 255, 255, 255),
                                  hintText: 'Enter Name of Subject',
                                  prefixIcon: const Icon(
                                      Icons.subject_rounded,
                                      color:
                                          Color.fromARGB(255, 14, 11, 168)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(),
                                  )),
                              style:  TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.w,
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: 10.w,), 
                         SizedBox(height: 10.w,),
                        Container(
                          height: 50.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.w))),
                          child: TextButton.icon(
                              onPressed: () async {
                                if (addFormkey.currentState!.validate()) {
                                  subjectControllerr
                                      .addSubjectInClassWise(
                                          subjecController);
                                }
                              },
                              icon: const Icon(Icons.add),
                              label: GoogleMonstserratWidgets(
                                text: 'Add',
                                fontsize: 15.w,
                                color: cWhite,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                       
                  
                        Container(
                         
                          height: 500.w,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('SchoolListCollection')
                                  .doc(schoolListValue!['docid'])
                                  .collection("classes")
                                  .doc(Get.find<GetFireBaseData>()
                                      .getTeacherClassRole
                                      .value)
                                  .collection("subjects")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return GridView.builder(
                                     itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                             
                            ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            log(snapshot.data!.docs[index]
                                                ['docid']);
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.all(20.w),
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
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    height: 10.w,
                                                  ),
                                                  GoogleMonstserratWidgets(
                                                      text: snapshot.data!
                                                              .docs[index]
                                                          ['subjectName'],
                                                      fontsize: 13.w,
                                                      color: cBlack,fontWeight: FontWeight.w600),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        subjectControllerr.addSubjectToNewBatch(
                                                            snapshot.data!
                                                                        .docs[
                                                                    index]
                                                                ['docid'],
                                                            snapshot.data!
                                                                        .docs[
                                                                    index][
                                                                'subjectName']);
                                                      },
                                                      child: 
                                                       Container (
                                                            width: 105.w,
                                                         height: 29.w,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .blue
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                       Radius.circular(
                                                                          4.w))),
                                                          child: Center(
                                                            child:
                                                                GoogleMonstserratWidgets(
                                                              text:
                                                                  "Add subject",
                                                              fontsize:
                                                                  13.w,
                                                              color: cBlack,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                           )
                                                      )
                                                      ),
                                                 
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                    children: [


                                                      IconButton(onPressed: () async {
                                                            log(Get.find<
                                                                    GetFireBaseData>()
                                                                .getTeacherClassRole
                                                                .value);
                                                            await subjectControllerr.editClassName(
                                                                context,
                                                                snapshot.data!
                                                                        .docs[index]
                                                                    [
                                                                    'subjectName'],
                                                                Get.find<
                                                                        GetFireBaseData>()
                                                                    .getTeacherClassRole
                                                                    .value,
                                                                snapshot.data!
                                                                        .docs[index]
                                                                    [
                                                                    'docid']);
                                                          },

                                                       icon: Icon(Icons.edit, color: cgreen,size: 18.w,)),


                                                       IconButton(onPressed: () async {
                                                            subjectControllerr
                                                                .deleteClass(
                                                                    snapshot
                                                                        .data!
                                                                        .docs[index]['docid'],
                                                                    context);
                                                          },
                                                       icon: Icon(Icons.delete,color: cred,size: 18.w,)),
                                                   
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
                              }),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ]),
        ])),
      ),
    );
  }
}
