import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TarifController extends GetxController {
  Future<void> checkTarif(String schoolID) async {
    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(schoolID)
        .collection('payments');
  }
}
