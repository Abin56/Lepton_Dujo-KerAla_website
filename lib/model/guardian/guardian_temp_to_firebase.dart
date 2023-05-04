import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/guardian/guardian_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';

class AddTempGuardiansToFirebase {
  Future<void> addGuardiansToTempList(
    GuardianAddModel guardianModel,
    context,
    id,
    
  ) async {
    try {
      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(id)
          .collection('TempGuardiansCollection')
          .doc()
          .set(guardianModel.toMap());
    } catch (e) {
      showToast(msg: e.toString());
    }
  }
}
