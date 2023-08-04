import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/handle_parents/parents_view_page.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandleParentsWithMultipleChildren extends StatelessWidget {
  const HandleParentsWithMultipleChildren({super.key});

  @override
  Widget build(BuildContext context) {
    log(Get.find<GetFireBaseData>().getTeacherClassRole.value);
    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('SchoolListCollection')
        .doc(schoolListValue!['docid'])
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection('classes')
                    // .doc(Get.find<GetFireBaseData>().classIDD.value)
                    // .collection('ParentCollection')
                    .snapshots(),
        builder: (context, snap){
          log(snap.data!.docs[0]['className']);
          if(snap.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          if(snap.data == null){
            return const Text('No Data');
          }

          return ListView.builder(

            itemCount: snap.data!.docs.length,
            itemBuilder: (context, index){
              return SizedBox(
          width: 150,
          height: 150,
          child: GestureDetector(
            onTap: (){
              log(snap.data!.docs[index]['className']);
             Navigator.push(context, MaterialPageRoute(builder: (context)=>  ParentsViewPage(classSnap: snap.data!.docs[index],)));
            },
            child: Card(
              elevation: 5, // Adjust the elevation for the shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  snap.data!.docs[index]['className'],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ));
             
            });
        })
    );
  }
}