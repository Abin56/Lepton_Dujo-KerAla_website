import 'package:flutter/material.dart';

class HandleParentsWithMultipleChildren extends StatelessWidget {
  const HandleParentsWithMultipleChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('SchoolListCollection')
      //   .doc(schoolListValue!['docid'])
      //               .collection(Get.find<GetFireBaseData>().bYear.value)
      //               .doc(Get.find<GetFireBaseData>().bYear.value)
      //               .collection('classes')
      //               .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
      //               .collection('ParentCollection')
      //               .snapshots(),
      //   builder: (context, snap){
      //     if(snap.connectionState == ConnectionState.waiting){
      //       return const CircularProgressIndicator();
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