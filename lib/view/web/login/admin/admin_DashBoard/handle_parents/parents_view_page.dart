import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/handle_parents/assigning_page.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';

class ParentsViewPage extends StatelessWidget {
  String parentClassID;
  ParentsViewPage(
      {super.key, required this.classSnap, required this.parentClassID});

  DocumentSnapshot classSnap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Parent'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(schoolListValue!['docid'])
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('classes')
              .doc(classSnap['docid'])
              .collection('ParentCollection')
              .snapshots(),
          builder: (context, snap) {
            return ListView.builder(
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AssigningPage(
                                    parentSnap: snap.data!.docs[index],
                                    classID: classSnap['docid'],
                                    parentClassID: parentClassID,
                                    parentDocID: snap.data?.docs[index]
                                        ['docid'],
                                  )));
                    },
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation:
                            5, // Adjust the elevation for the shadow effect
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snap.data!.docs[index]['profileImageURL']),
                          ),
                          title: Text(
                            snap.data!.docs[index]['parentName'],
                            style: const TextStyle(fontSize: 20),
                          ),
                        )),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
