import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/leave_request_provider.dart';
import 'package:dujo_kerala_website/pending.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class LeaveRequests extends StatelessWidget {
  const LeaveRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final leaveRequestProvider = Provider.of<LeaveRequestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GoogleMonstserratWidgets(
          text: 'Leave Requests',
          fontsize: 18,
          color: adminScreencolor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc('0OdOkV1YzEab2BuGRtv4q9qcyfU2')
              .collection('Hostel')
              .doc('Hostel')
              .collection('LeaveRequests')
              .where('parentStatus', isEqualTo: 'Approved')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator while fetching data.
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            //else if (!snapshot.hasData ) {
            //   return Text(
            //       'No leave requests available.'); // Display a message if no data is found.
            // }
            else {
              return Column(children: [
                sizedBoxH20,
                Row(
                  children: [
                    sizedBoxW20,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PendingRequest()));
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.blue,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GoogleMonstserratWidgets(
                              text: 'Pending Requests',
                              color: Colors.white,
                              fontsize: 18,
                            ),
                            sizedBoxH10,
                            GoogleMonstserratWidgets(
                              text: '2',
                              color: Colors.white,
                              fontsize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )),
                      ),
                    ),
                    sizedBoxW20,
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GoogleMonstserratWidgets(
                            text: 'Approved Requests',
                            color: Colors.white,
                            fontsize: 18,
                          ),
                          sizedBoxH10,
                          GoogleMonstserratWidgets(
                            text: '2',
                            color: Colors.white,
                            fontsize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                sizedBoxH100,
                DataTable(
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
                            text: leaveRequest['applyDate'] ?? '',
                            fontsize: 17)),
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
                    }))
              ]);
            }
            // return GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 5, // Number of columns
            //       crossAxisSpacing: 10.0, // Spacing between columns
            //       mainAxisSpacing: 10.0, // Spacing between rows
            //     ),
            //     itemCount: snapshot.data!.docs.length,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => LeaveRequestMain(
            //                         snap: snapshot.data!.docs[index],
            //                       )));
            //         },
            //         child: Container(
            //           width: 200, // Adjust the width as needed
            //           height: 200, // Adjust the height as needed
            //           color: Colors.green,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: <Widget>[
            //               GoogleMonstserratWidgets(
            //                 text: snapshot.data!.docs[index]['studentName'],
            //                 fontsize: 18,
            //                 color: Colors.white,
            //               ),
            //               GoogleMonstserratWidgets(
            //                 text: snapshot.data!.docs[index]['applyDate'],
            //                 fontsize: 18,
            //                 color: Colors.white,
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     });
          }),
    );
  }
}
