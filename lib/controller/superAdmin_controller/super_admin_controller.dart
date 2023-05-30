import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../view/constant/constant.dart';

class SuperAdminController extends GetxController {
  final firebase =
      FirebaseFirestore.instance.collection("SchoolListCollection");

  Future<void> deactivateSchool(String schoolID) async {
    firebase.doc(schoolID).set({'deactive': true}, SetOptions(merge: true)).then((value) {
return showToast(msg: 'Deactivated');

    });
  }

    Future<void> activateSchool(String schoolID) async {
    firebase.doc(schoolID).set({'deactive': false}, SetOptions(merge: true)).then((value) {
return showToast(msg: 'Activated');

    });
  }

  
}
