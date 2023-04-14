import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/admin_models/general_instructions/general_instructions_model.dart';
import '../../../../view/constant/constant.dart';

class GeneralInstructionsController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString schoolName = 'School Name'.obs;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  RxList<GeneralInstructionModel> listOfGeneralIModel =
      RxList<GeneralInstructionModel>([]);
  RxList<String> instructionList = <String>[].obs;

  Future<void> addListOfInstructions(String schoolId) async {
    isLoading.value = true;
    if (instructionList.isNotEmpty) {
      for (int i = 0; i < instructionList.length; i++) {
        addGeneralInstructions(
          instructionList[i],
          schoolId,
        );
      }
    }

    isLoading.value = false;
    showToast(msg: 'Successfully Added');
  }

  Future<void> addGeneralInstructions(
      String genInstruction, String schoolId) async {
    try {
      //isLoading.value = true;
      final GeneralInstructionModel generalInstructionModelData =
          GeneralInstructionModel(
        instruction: genInstruction,
        instructionId: '',
        time: DateTime.now().toString(),
      );
      //add new instruction
      final DocumentReference<Map<String, dynamic>> response = await firebase
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('general_instructions')
          .add(generalInstructionModelData.toJson());
      //update instrcution id
      await firebase
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('general_instructions')
          .doc(response.id)
          .update({"instructionId": response.id});
      // isLoading.value = false;
      //showToast(msg: 'Instruction Created Successfully');
      instructionList.clear();
    } catch (e) {
      showToast(msg: 'Instruction Not Created');
      // isLoading.value = false;
    }
  }

  Future<void> removeInstruction(String instructionId, String schoolId) async {
    try {
      isLoading.value = true;
      firebase
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('general_instructions')
          .doc(instructionId)
          .delete();
      await getInstruction(schoolId);
      isLoading.value = false;
      showToast(msg: 'Deleted Successfully');
    } catch (e) {
      showToast(msg: 'Failed');
      isLoading.value = false;
    }
  }

  Future<void> updateInstructions(
      String instructionId, String schoolId, String instructions) async {
    try {
      isLoading.value = true;
      firebase
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection("general_instructions")
          .doc(instructionId)
          .update(
        {
          "instruction": instructions,
          "time": DateTime.now().toString(),
        },
      );
      isLoading.value = false;
      textEditingController.clear();
      getInstruction(schoolId);
      showToast(msg: 'Updated Succesfully');
    } catch (e) {
      showToast(msg: 'Updation Failed');
      isLoading.value = false;
    }
  }

  Future<void> getInstruction(String schoolId) async {
    try {
      isLoading.value = true;
      await getSchoolName(schoolId);
      QuerySnapshot<Map<String, dynamic>> result = await firebase
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection("general_instructions")
          .orderBy('time')
          .get();
      listOfGeneralIModel.value = result.docs
          .map(
            (e) => GeneralInstructionModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      isLoading.value = false;
    } catch (e) {
      showToast(msg: 'Failed to load data ${e.toString()}');
      isLoading.value = false;
    }
  }

  Future<void> getSchoolName(String schoolId) async {
    try {
      final schoolData =
          await firebase.collection('SchoolListCollection').doc(schoolId).get();
      schoolName.value = schoolData.data()!['schoolName'];
    } catch (e) {
      showToast(msg: 'School Name error');
    }
  }
}
