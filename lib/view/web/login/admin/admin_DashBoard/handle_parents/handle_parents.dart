import 'dart:developer';

import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandleParentsWithMultipleChildren extends StatelessWidget {
  const HandleParentsWithMultipleChildren({super.key});

  @override
  Widget build(BuildContext context) {
    log(Get.find<GetFireBaseData>().getTeacherClassRole.value);
    return const Scaffold(
      
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('SchoolListCollection')
      //   .doc(schoolListValue!['docid'])
      //               .collection(Get.find<GetFireBaseData>().bYear.value)
      //               .doc(Get.find<GetFireBaseData>().bYear.value)
      //               .collection('classes')
      //               .doc(Get.find<GetFireBaseData>().classIDD.value)
      //               .collection('ParentCollection')
      //               .snapshots(),
      //   builder: (context, snap){
      //     if(snap.connectionState == ConnectionState.waiting){
      //       return const CircularProgressIndicator();
      //     }
      //     if(snap.data == null){
      //       return const Text('No Data');
      //     }

      //     return ListView.builder(
      //       itemCount: snap.data!.docs.length,
      //       itemBuilder: (context, index){
      //         return Text(snap.data!.docs[index]['parentName']);
      //       });
      //   })
    );
  }
}