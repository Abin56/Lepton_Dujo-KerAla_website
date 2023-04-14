import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SchoolLevelNotifications extends StatefulWidget {
  SchoolLevelNotifications({super.key, required this.schoolID});

  String schoolID;

  @override
  State<SchoolLevelNotifications> createState() =>
      _SchoolLevelNotificationsState();
}

class _SchoolLevelNotificationsState extends State<SchoolLevelNotifications> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController chaptersToCover = TextEditingController();

  addExamNotifications() {
    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('SchoolLevelExamNotifications')
        .doc()
        .set({
      'examName': name.text,
      'examDate': date.text,
      'examDescription': description.text,
      'syllabusToCover': chaptersToCover.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exam Notifications',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: Text('Add New Exam'),
                      content: Container(
                        width: 400,
                        height: 500,
                        child: Column(
                          children: [
                            TextField(
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name of Examination',  
                                labelStyle: GoogleFonts.poppins()
                              ),
                              style: GoogleFonts.poppins(),
                            ), SizedBox(height: 20,),
                            TextField(
                              controller: date,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date of Examination',
                                labelStyle: GoogleFonts.poppins()
                              ),
                              style: GoogleFonts.poppins()
                            ),SizedBox(height: 20,),
                            TextField(
                              controller: description,
                              maxLines: 10,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Description',
                                labelStyle: GoogleFonts.poppins()
                              ),
                              style: GoogleFonts.poppins(),
                            ),SizedBox(height: 20,),
                            TextField(
                              controller: chaptersToCover,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Syllabus to cover', 
                                labelStyle: GoogleFonts.poppins()
                              ),
                              style: GoogleFonts.poppins(), 
                             
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: MaterialButton(
                            color: Colors.green,
                            onPressed: () {
                              if (name.text.isNotEmpty &&
                                  date.text.isNotEmpty &&
                                  description.text.isNotEmpty &&
                                  chaptersToCover.text.isNotEmpty) {
                                addExamNotifications();
                              } else {
                                print('empty fields are not allowed!');
                              }
                            },
                            child: Text('Add', style: GoogleFonts.poppins(color: Colors.white),),
                          ),
                        )
                      ],
                    );
                  }));
            },
            title: Text(
              'Add new Notification',
              style: GoogleFonts.poppins(),
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('SchoolListCollection')
                  .doc(widget.schoolID)
                  .collection('SchoolLevelExamNotifications')
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  separatorBuilder: (context, index){
                    return SizedBox(height: 10,);
                  },
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.green,
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => SchoolExamMainPage(sn: snapshot.data!.docs[index]))));
                      },
                      title: Text(
                        snapshot.data!.docs[index]['examName'],
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Date of examination: ' +
                            snapshot.data!.docs[index]['examDate'],
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    );
                  },
                );
              }))
        ],
      ),
    );
  }
}
