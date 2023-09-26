import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaveRequestProvider with ChangeNotifier {
  bool _status = false;

  bool get status => _status;

  void approveLeaveRequest(docID) {
    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc('0OdOkV1YzEab2BuGRtv4q9qcyfU2')
        .collection('Hostel')
        .doc('Hostel')
        .collection('LeaveRequests')
        .doc(docID)
        .update({'wardenStatus': 'Approved'}).then((value) {
      _status = true;
    });

    notifyListeners();
  }
}
