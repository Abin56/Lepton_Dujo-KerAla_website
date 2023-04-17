import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/search_student/search_student.dart';

class SearchStuents extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(Get.find<AdminLoginScreenController>().schoolID)
                .collection("AllStudents")
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          child: Text(snapshots.data!.docs[index]['id']),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            })
        : StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(Get.find<AdminLoginScreenController>().schoolID)
                .collection("AllStudents")
                .where('admissionNumber', isEqualTo: query)
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          child: Text(snapshots.data!.docs[index]['id']),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
  }
}
