import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/create_classModel/add_student_model.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class SearchStudentController extends GetxController {
  List<AddStudentModel> searchStudent = [];
  Future<void> fetchStudents() async {
    searchStudent.clear();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection("AllStudents")
              .get();
      searchStudent =
          snapshot.docs.map((e) => AddStudentModel.fromMap(e.data())).toList();
    } catch (e) {
      showToast(msg: "Student Data Error");
    }
  }
  @override
  void onInit()async {
 await  fetchStudents();
    super.onInit();
  }
}
