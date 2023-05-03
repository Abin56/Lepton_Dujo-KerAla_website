import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../colors/colors.dart';
import 'class_subjects.dart';

class AllClassesListViewForTeacher extends StatefulWidget {
  String schoolID;
  String classID;
  String teacherID;
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
          title: const Text("Add teachers for the subject"),
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
                  SizedBox(
                    width: double.maxFinite,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = TeacherModel.fromJson(
                              snapshot.data!.docs[index].data());

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClassWiseSubject(
                                        schoolID: widget.schoolID,
                                        classID: widget.classID,
                                        teacherID: data.docid)),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
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
