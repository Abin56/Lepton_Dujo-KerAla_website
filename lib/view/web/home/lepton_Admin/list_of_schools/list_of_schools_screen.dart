import 'package:dujo_kerala_website/view/web/home/lepton_Admin/list_of_schools/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../widgets/button_container_widget.dart';

class SchoolsListScreen extends StatefulWidget {
  const SchoolsListScreen({super.key});

  @override
  State<SchoolsListScreen> createState() => _SchoolsListScreenState();
}

class _SchoolsListScreenState extends State<SchoolsListScreen> {
  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('SchoolListCollection').snapshots(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  } 

                  return ListView.separated(itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${index + 1}'),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['schoolName'],
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data!.docs[index]['place'],
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailsSchoolsScreen(schoolSnap : snapshot.data!.docs[index]);
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(Icons.info_outline)),
                                Text("Expiry : 20-10-2030"),
                            ButtonContainerWidget(
                              curving: 10,
                              colorindex: 3,
                              height: 40,
                              width: 130,
                              child: Center(
                                child: Text(
                                  "Active",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: snapshot.data!.docs.length);
                }),

            )
          ],
        ),
  
));
  }
}