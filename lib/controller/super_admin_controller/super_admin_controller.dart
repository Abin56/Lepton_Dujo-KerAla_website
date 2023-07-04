import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui team/abin/responsive mob/_/new_home_01_06.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';

class MainSuperAdminController extends GetxController {
  Future<void> checkinActivation(BuildContext context) async {
    final firebase = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(schoolListValue!['docid'])
        .get();
    if (firebase.data()!['deactive'] == true) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[Text('The school is Deactivated')],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return  HomePageImages();
                    },
                  ), (route) => false);
                },
              ),
            ],
          );
        },
      );
    } else {
      return;
    }
  }
}
