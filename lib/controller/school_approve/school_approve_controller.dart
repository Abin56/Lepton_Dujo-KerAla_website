import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/schools_to_be_verified/schools_to_be_verified_create_list.dart';

class SchoolApproveController extends GetxController {
  RxBool isLoading = false.obs;
  List<SchoolsToBeVerified> reqschools = [];
  final firebaseFirestore = FirebaseFirestore.instance;
  Future<void> rejectSchoolList(String schoolID) async {
    try {
      isLoading.value = true;
      firebaseFirestore
          .doc(schoolID)
          .delete()
          .then((value) => fetchReqListSchools());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> fetchReqListSchools() async {
    try {
      isLoading.value = true;
      final result =
          await firebaseFirestore.collection('RequestedSchools').get();
      reqschools = result.docs.map((e) {
        return SchoolsToBeVerified.fromMap(e.data());
      }).toList();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future createSchoolController(
      SchoolsToBeVerified productModel, context) async {
    try {
      firebaseFirestore
          .collection("SchoolListCollection")
          .doc(productModel.docid)
          .set(productModel.toMap());
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }

  Future<void> approveFucntion(
      SchoolsToBeVerified approveModel, BuildContext context) async {
    try {
      String uid = '';
      isLoading.value = true;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: approveModel.email, password: approveModel.password)
          .then((value) {
        uid = value.user!.uid;
        firebaseFirestore
            .collection("SchoolListCollection")
            .doc(value.user!.uid)
            .set(approveModel.toMap())
            .then((value) {
          firebaseFirestore
              .collection('RequestedSchools')
              .doc(approveModel.docid)
              .delete()
              .then((value) {
            firebaseFirestore
                .collection("SchoolListCollection")
                .doc(uid)
                .update({'docid': uid}).then((value) => showDialog(
                      context: context,
                      builder: ((context) => const AlertDialog(
                            content: Text('Succesfully Approved!'),
                          )),
                    ));
          });
        });
      });

      await fetchReqListSchools();
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      print('Error ${e.message.toString()}');
    }
  }

  @override
  void onInit() async {
    await fetchReqListSchools();
    super.onInit();
  }
}
