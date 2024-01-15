import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ApprovedRequest extends StatelessWidget {
  ApprovedRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: adminePrimayColor,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc('0OdOkV1YzEab2BuGRtv4q9qcyfU2')
                .collection('Hostel')
                .doc('Hostel')
                .collection('LeaveRequests')
                .where('status', isEqualTo: 'Approved')
                .snapshots(),
            builder: (context, snapshot) {
              return DataTable(
                  columns: [
                    DataColumn(
                        label: GoogleMonstserratWidgets(
                      text: 'Name',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                    DataColumn(
                        label: GoogleMonstserratWidgets(
                      text: 'Applied Date',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                    DataColumn(
                        label: GoogleMonstserratWidgets(
                      text: 'Leave Days Requested',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                    DataColumn(
                        label: GoogleMonstserratWidgets(
                      text: 'Status',
                      fontWeight: FontWeight.bold,
                      fontsize: 18,
                    )),
                  ],
                  rows: List.generate(snapshot.data!.docs.length, (index) {
                    final leaveRequest = snapshot.data!.docs[index];

                    return DataRow(cells: [
                      DataCell(GoogleMonstserratWidgets(
                        text: leaveRequest['studentName'] ?? '',
                        fontsize: 17,
                      )),
                      DataCell(GoogleMonstserratWidgets(
                          text: leaveRequest['applyDate'] ?? '', fontsize: 17)),
                      DataCell(GoogleMonstserratWidgets(
                          text: leaveRequest['toDate']?.toString() ?? '',
                          fontsize: 17)),
                      DataCell(MaterialButton(
                        onPressed: () {},
                        color: adminScreencolor,
                        child: Text(
                          'Pending',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]);
                  }));
            }));
  }
}
