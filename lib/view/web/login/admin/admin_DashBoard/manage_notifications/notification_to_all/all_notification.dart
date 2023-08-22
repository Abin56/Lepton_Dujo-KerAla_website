import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationToAll extends StatelessWidget {
  const NotificationToAll({super.key});

  Future<List<Map<String, dynamic>>> getCollectionDocuments(String collectionName) async {
  List<Map<String, dynamic>> documents = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();
    for (var doc in querySnapshot.docs) {
      QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance.collection(collectionName).doc(doc['docid']).collection('AllStudents').get(); 
    for(var kok in querySnapshot2.docs){
      documents.add(kok.data() as Map<String, dynamic>);
    }
      //documents.add(doc.data() as Map<String, dynamic>);
    }
     for(var d in documents){
    log(d['studentName'].toString());
    
  }log(documents.length.toString());
  } catch (e) {
    log("Error getting documents: $e");
  }

 

  return documents;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialButton(onPressed: (){
        getCollectionDocuments('SchoolListCollection');
      }, child: const Text('Click'),),
    );
  }
}