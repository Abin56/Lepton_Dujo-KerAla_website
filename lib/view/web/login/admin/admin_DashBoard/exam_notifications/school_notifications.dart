import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant/constant.dart';

// ignore: must_be_immutable
class SchoolLevelNotifications extends StatefulWidget {
  SchoolLevelNotifications({super.key, required this.schoolID});

  String schoolID;

  @override
  State<SchoolLevelNotifications> createState() =>
      _SchoolLevelNotificationsState();
}
final formKey = GlobalKey<FormState>();
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
        backgroundColor: adminePrimayColor,
      ),
      body: ListView(
        children: [
          ListTile(
          leading: Icon(Icons.add),
            onTap: () {
              showDialog(
                   barrierDismissible: false,
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: Text('Add New Exam Notification'),
                      content: Container(
                        width: 400,
                        height: 600,
                        child: Form(
                          key: formKey,
                          child: ListView(
                            children: [
                              TextFormField(
                                    validator: checkFieldEmpty,
                                controller: name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name of Examination',  
                                  labelStyle: GoogleFonts.poppins()
                                ),
                                style: GoogleFonts.poppins(),
                              ), SizedBox(height: 20,),
                              TextFormField(
                                      validator: checkFieldEmpty,
                                controller: date,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Date of Examination',
                                  labelStyle: GoogleFonts.poppins()
                                ),
                                style: GoogleFonts.poppins()
                              ),SizedBox(height: 20,),
                              TextFormField(
                                      validator: checkFieldEmpty,
                                controller: description,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Description',  alignLabelWithHint: true, // Align the label with the hint text
    contentPadding: EdgeInsets.only(top: 16, left: 10),
                                  
                                  labelStyle: GoogleFonts.poppins()
                                ),
                                style: GoogleFonts.poppins(),
                                 
                              ),SizedBox(height: 20,),
                              TextFormField(
                                      validator: checkFieldEmpty,
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
                      ),
                      actions: [
                        MaterialButton(
                            color: Colors.red,
                          onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.white),),
                                                        ),
                       
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: MaterialButton(
                            color: Colors.green,
                            onPressed: () async{
                                bool? result =
                                    formKey.currentState?.validate();
                              if (name.text.isNotEmpty &&
                                  date.text.isNotEmpty &&
                                  description.text.isNotEmpty &&
                                  chaptersToCover.text.isNotEmpty) {
                                addExamNotifications();
                               
                              } else {
                                print('empty fields are not allowed!');
                              }

                                if (result == true) {
                                  // check if form validation passed
                                  showToast(msg: 'Exam Notification successfully added ');
                                }
                                clearFields();
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
                      leading: Icon(Icons.notification_add),
                      tileColor: Colors.blue[100],
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: ((context) => SchoolExamMainPage(sn: snapshot.data!.docs[index]))));
                      },
                      title: Text(
                        snapshot.data!.docs[index]['examName'],
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 17.h),
                      ),
                      subtitle: Text(
                        'Date of examination: ' +
                            snapshot.data!.docs[index]['examDate'],
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 13.h),
                      ),
                    );
                  },
                );
              }))
        ],
      ),
    );
  }
  void clearFields() {
    name.clear();
    date.clear();
    description.clear();
    chaptersToCover.clear();

  }
}
