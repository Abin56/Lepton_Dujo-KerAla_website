import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../../../../../constant/responsive_app.dart';
import '../admin_notice_show_new.dart';
import 'notice_card_widget.dart';

class NoticeGridViewWidget extends StatelessWidget {
  const NoticeGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveApp.width * 0.6,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection('adminNotice')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                AdminNoticeModel data =
                    AdminNoticeModel.fromMap(snapshot.data!.docs[index].data());

                String date = data.dateofoccation!.isEmpty
                    ? "custom note"
                    : data.dateofoccation!;
                String heading = data.customContent!.isEmpty
                    ? "custom note"
                    : data.customContent!;
                String uploadedDate = data.publishedDate!.isEmpty
                    ? "custom note"
                    : data.publishedDate!;
                String venue =
                    data.venue!.isEmpty ? data.venue! : "custom note";

                return GestureDetector(
                  onTap: () {
                    adminNoticeController.adminNoticeModelData.value = data;
                  },
                  child: NoticeCardWidget(
                    date: date,
                    heading: heading,
                    uploadedDate: uploadedDate,
                    venue: venue,
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No Data Found'));
          }
        },
      ),
    );
  }
}
