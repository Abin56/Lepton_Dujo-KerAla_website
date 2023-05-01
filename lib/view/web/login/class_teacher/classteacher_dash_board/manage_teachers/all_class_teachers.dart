import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../model/create_classModel/create_classModel.dart';
import '../../../../../../model/teacher/add_student.dart';
import '../../../../../../model/teacher/add_teacher_model.dart';
import '../../../../../colors/colors.dart';
import 'class_subjects.dart';

class AllClassesListViewForTeacher extends StatefulWidget {
  var schoolID;
  var classID;
  var teacherID;
  AllClassesListViewForTeacher(
      {required this.schoolID,
      required this.classID,
      required this.teacherID,
      super.key});

  @override
  State<AllClassesListViewForTeacher> createState() =>
      _AllClassesListViewForTeacherState();
}

class _AllClassesListViewForTeacherState
    extends State<AllClassesListViewForTeacher> {
  @override
  Widget build(BuildContext context) {
    log(widget.classID);
    return Scaffold(
      appBar: AppBar(
          title: Text("Add teachers for the subject"),
          backgroundColor: adminePrimayColor),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(widget.schoolID)
              .collection("Teachers")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = AddTeachersModel.fromJson(
                              snapshot.data!.docs[index].data());

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClassWiseSubject(
                                        schoolID: widget.schoolID,
                                        classID: widget.classID,
                                        teacherID: data.id)),
                              );
                            },
                            child: Container(
                              height: 60.w,
                              width: 300.w,   

                              
                              color: Colors.amber,
                              child: Center(
                                child: Text(data.teacherName),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
