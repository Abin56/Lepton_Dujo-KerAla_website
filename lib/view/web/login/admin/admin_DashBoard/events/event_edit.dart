import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/events/list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
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
              .collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('AdminEvents')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.docs.isEmpty) {
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
                                      title: const Text('Delete Event'),
                                      content: const Text(
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
                                                      .collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value)
                                                      .collection('AdminEvents')
                                                      .doc(snapshot.data!
                                                          .docs[index]['id'])
                                                      .delete()
                                                      .then((value) =>
                                                          Navigator.pop(
                                                              context));
                                                },
                                                color: Colors.red,
                                                child: const Text('Yes'),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                color: Colors.blue,
                                                child: const Text('No'),
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
                                      title: const Text('Edit Event'),
                                      content: SizedBox(
                                        width: 400,
                                        height: 500,
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: headingController,
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText:
                                                    'Event Name: ${snapshot.data!.docs[index]['eventName']}',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: descriptionController,
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText:
                                                    'Description: ${snapshot.data!.docs[index]['eventDescription']}',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: dateController,
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText:
                                                    'Date: ${snapshot.data!.docs[index]['eventDate']}',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: venueController,
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText:
                                                    'Venue: ${snapshot.data!.docs[index]['venue']}',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            TextField(
                                              controller: signedByController,
                                              decoration: InputDecoration(
                                                  border: const OutlineInputBorder(),
                                                  labelText:
                                                      'Signed by: ${snapshot.data!.docs[index]['signedBy']}'),
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
                                                  .collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value)
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
