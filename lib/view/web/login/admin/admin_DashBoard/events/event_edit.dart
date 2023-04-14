import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/events/list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class EventsEditREmove extends StatefulWidget {
  EventsEditREmove({super.key, required this.schoolID});

  String schoolID;

  @override
  State<EventsEditREmove> createState() => _EventsEditREmoveState();
}

class _EventsEditREmoveState extends State<EventsEditREmove> {
  TextEditingController headingController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController signedByController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: adminePrimayColor,
          title: Text('Events List'.tr,
              style: GoogleFonts.poppins(color: Colors.white))),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(widget.schoolID)
              .collection('AdminEvents')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.docs.length == 0) {
              return Center(
                  child: Text(
                'No Events',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ));
            }

            // return ListView.builder(
            //     itemCount: snapshot.data!.docs.length,
            //     itemBuilder: (context, index) {
            //       // return ListTile(
            //       //   onTap: () {
            //       //     showDialog(
            //       //         context: context,
            //       //         builder: (context) {
            //       //           return AlertDialog(
            //       //             title: Text('EDIT'),
            //       //             content: Column(
            //       //               children: [
            //       //                 TextField(
            //       //                   controller: headingController,
            //       //                   decoration: InputDecoration(
            //       //                       hintText: snapshot.data!.docs[index]
            //       //                           ['eventName']),
            //       //                 ),
            //       //                 TextField(
            //       //                   controller: descriptionController,
            //       //                   decoration: InputDecoration(
            //       //                       hintText: snapshot.data!.docs[index]
            //       //                           ['eventDescription']),
            //       //                 ),
            //       //                 TextField(
            //       //                   controller: dateController,
            //       //                   decoration: InputDecoration(
            //       //                       hintText: snapshot.data!.docs[index]
            //       //                           ['eventDate']),
            //       //                 ),
            //       //                 TextField(
            //       //                   controller: signedByController,
            //       //                   decoration: InputDecoration(
            //       //                       hintText: snapshot.data!.docs[index]
            //       //                           ['signedBy']),
            //       //                 ),
            //       //                 TextField(
            //       //                   controller: venueController,
            //       //                   decoration: InputDecoration(
            //       //                       hintText: snapshot.data!.docs[index]
            //       //                           ['venue']),
            //       //                 ),
            //       //               ],
            //       //             ),
            //       //             actions: [
            //       //               MaterialButton(
            //       //                 onPressed: () {
            //       //                   FirebaseFirestore.instance
            //       //                       .collection('SchoolListCollectiion')
            //       //                       .doc(widget.schoolID)
            //       //                       .collection('AdminEvents')
            //       //                       .doc(headingController.text
            //       //                               .substring(0, 5)
            //       //                               .trim() +
            //       //                           dateController.text
            //       //                               .substring(0, 5)
            //       //                               .trim())
            //       //                       .update({
            //       //                     'eventName': headingController.text,
            //       //                     'eventDate': dateController.text,
            //       //                     'eventDescription':
            //       //                         descriptionController.text,
            //       //                     'venue': venueController.text,
            //       //                     'signedBy': signedByController.text
            //       //                   });
            //       //                 },
            //       //                 child: Text('Save Changes'),
            //       //               )
            //       //             ],
            //       //           );
            //       //         });
            //       //   },
            //       //   title: Text(
            //       //     snapshot.data!.docs[index]['eventName'],
            //       //     style: TextStyle(color: Colors.white),
            //       //   ),
            //       // );

            //       return ListItemCard();
            //     });
            return AnimationLimiter(
              child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(snapshot.data!.docs.length, (index) {
                    return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => ListItemCard())));
                        },
                        child: ListItemCard(
                            title: snapshot.data!.docs[index]['eventName'],
                            content: snapshot.data!.docs[index]
                                ['eventDescription'],
                            tapFun2: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Delete Event'),
                                      content: Text(
                                          'Are you sure you want to delete event?'),
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  String k = snapshot.data!
                                                      .docs[index]['eventName'];
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'SchoolListCollection')
                                                      .doc(widget.schoolID)
                                                      .collection('AdminEvents')
                                                      .doc(snapshot.data!
                                                          .docs[index]['id'])
                                                      .delete()
                                                      .then((value) =>
                                                          Navigator.pop(
                                                              context));
                                                },
                                                child: Text('Yes'),
                                                color: Colors.red,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No'),
                                                color: Colors.blue,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            tapFun: () {
                              setState(() {
                                headingController.text =
                                    snapshot.data!.docs[index]['eventName'];
                                dateController.text =
                                    snapshot.data!.docs[index]['eventDate'];
                                venueController.text =
                                    snapshot.data!.docs[index]['venue'];
                                signedByController.text =
                                    snapshot.data!.docs[index]['signedBy'];
                                descriptionController.text = snapshot
                                    .data!.docs[index]['eventDescription'];
                              });

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Event'),
                                      content: Container(
                                        width: 400,
                                        height: 500,
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: headingController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Event Name: ${snapshot.data!.docs[index]['eventName']}',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: descriptionController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Description: ${snapshot.data!.docs[index]['eventDescription']}',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: dateController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Date: ${snapshot.data!.docs[index]['eventDate']}',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: venueController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Venue: ${snapshot.data!.docs[index]['venue']}',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: signedByController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      'Signed By: ${snapshot.data!.docs[index]['signedBy']}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MaterialButton(
                                            onPressed: () {
                                              String l = snapshot.data!
                                                  .docs[index]['eventName'];

                                              FirebaseFirestore.instance
                                                  .collection(
                                                      'SchoolListCollection')
                                                  .doc(widget.schoolID)
                                                  .collection('AdminEvents')
                                                  .doc(snapshot
                                                      .data!.docs[index]['id'])
                                                  .update({
                                                    'eventDate':
                                                        dateController.text,
                                                    'eventName':
                                                        headingController.text,
                                                    'eventDescription':
                                                        descriptionController
                                                            .text,
                                                    'venue':
                                                        venueController.text,
                                                    'signedBy':
                                                        signedByController.text,
                                                  })
                                                  .then((value) =>
                                                      Navigator.pop(context))
                                                  .then((value) => showToast(
                                                      msg: 'Event Updated!'));
                                            },
                                            color: Colors.blue,
                                            child: Text(
                                              'Update',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            }));
                  })),
            );
          }),
    );
  }
}
