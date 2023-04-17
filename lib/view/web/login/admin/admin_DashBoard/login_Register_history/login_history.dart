import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/loginHistory_model/login_history_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class AdminLoginDetailsScreen extends StatelessWidget {
  String schoolID;
  String dateId;
  AdminLoginDetailsScreen(
      {required this.schoolID, required this.dateId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Login Register"),
        backgroundColor: adminePrimayColor,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection("LoginHistory")
              .doc(dateId)
              .collection(dateId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    AdminLoginDetailHistoryModel data =
                        AdminLoginDetailHistoryModel.fromMap(
                            snapshot.data!.docs[index].data());
                    return Container(
                      color: const Color.fromARGB(255, 58, 179, 220),
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('${index + 1}'),
                            sizedBoxw80,
                            Text('ID ${data.adminuser}'),
                            sizedBoxw120,
                            Text('LoginTime ${data.loginTime}'),
                            sizedBoxw120,
                            Text(
                                // ignore: prefer_if_null_operators
                                'LogOutTime ${data.logOutTime == null ? 'Not found' : data.logOutTime}'),
                            sizedBoxw80,
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data!.docs.length);
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
