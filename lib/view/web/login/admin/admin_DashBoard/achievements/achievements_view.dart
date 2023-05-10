import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../colors/colors.dart';

// ignore: must_be_immutable
class AchievementsViewAndEdit extends StatelessWidget {
  AchievementsViewAndEdit({super.key, required this.schoolID});

  String schoolID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: adminePrimayColor,
          title: Text('Achievements List', style: GoogleFonts.poppins(color: Colors.white),),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('Achievements')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return 

             ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card( 
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             CircleAvatar(radius: 80, backgroundImage: NetworkImage(snapshot.data!.docs[index]['photoUrl']),), const SizedBox(height: 20,),
                            //  Row(
                            //   children: [
                            //     MaterialButton(onPressed: (){
                                   
                            //     }, color: Colors.blue, child:  Text('Edit', style: GoogleFonts.poppins(color: Colors.white),),), const SizedBox(width: 20,),
                            //     MaterialButton(onPressed: (){}, color: Colors.red, child:  Text('Delete', style: GoogleFonts.poppins(color: Colors.white),), )
                            //   ],
                            //  )
                           ],
                         ), 
                         const SizedBox(width: 50,),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround, 
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Student Name: ' + snapshot.data!.docs[index]['studentName'], style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),), 
                    Text('Admission Number: ' + snapshot.data!.docs[index]['admissionNumber'], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),), 
                    Text('Achievement: ' + snapshot.data!.docs[index]['achievement'], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)) ,
                    Text('Date Of Achievement: ' + snapshot.data!.docs[index]['dateofAchievement'], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),),
                    
                          ],
                         )
                      ],
                    ),
                  ),
                ),
              );
            },);
          },
        ));
  }
}
