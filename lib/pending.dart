import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/leave_request_provider.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PendingRequest extends StatelessWidget {
  PendingRequest({
    super.key,
  });

  MaterialButton statusButton = MaterialButton(
    onPressed: () {},
    color: adminScreencolor,
    child: Text(
      'Pending',
      style: TextStyle(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final leaveRequestProvider = Provider.of<LeaveRequestProvider>(context);
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
                .where('parentStatus', isEqualTo: 'Approved')
                .where('wardenStatus', isEqualTo: 'Pending')
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
                      DataCell(leaveRequestProvider.status == false
                          ? MaterialButton(
                              onPressed: () {
                                leaveRequestProvider
                                    .approveLeaveRequest(leaveRequest['docID']);
                              },
                              color: adminScreencolor,
                              child: Text(
                                'Pending',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : MaterialButton(
                              onPressed: () {},
                              color: Colors.green,
                              child: Text(
                                'Approved',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                    ]);
                  }));
            }));
  }
}
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       GoogleMonstserratWidgets(
      //         text: 'Applied by : ' + snap['studentName'],
      //         fontsize: 20,
      //       ),
      //       sizedBoxH10,
      //       GoogleMonstserratWidgets(
      //         text: 'Purpose : ' + snap['purpose'],
      //         fontsize: 20,
      //       ),
      //       sizedBoxH10,
      //       GoogleMonstserratWidgets(
      //         text: 'Date applied on : ' + snap['applyDate'],
      //         fontsize: 20,
      //       ),
      //       sizedBoxH10,
      //       GoogleMonstserratWidgets(
      //         text:
      //             'Leave requested dates on: ${snap['fromDate']} to ${snap['fromDate']}',
      //         fontsize: 20,
      //       ),
      //       sizedBoxH10,
      //       GoogleMonstserratWidgets(
      //         text: 'Destination : ${snap['destination']}',
      //         fontsize: 20,
      //       ),
      //       sizedBoxH10,
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           MaterialButton(
      //             onPressed: () {},
      //             color: adminePrimayColor,
      //             child: Text('Approve'),
      //           ),
      //           sizedBoxW20,
      //           MaterialButton(
      //             onPressed: () {},
      //             color: adminePrimayColor,
      //             child: Text('Decline'),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
