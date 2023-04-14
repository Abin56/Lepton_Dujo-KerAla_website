// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SchoolsToBeVerified {

  String schoolName;
  String schoolID;
  String id;
  String district;
  String place;
  String adminUserName;
  String password;
  String phoneNumber; 
  String email;
  String postedDate;
  bool verified;

  SchoolsToBeVerified({
    required this.schoolName,
    required this.schoolID,
    required this.id,
    required this.district,
    required this.place,
    required this.adminUserName,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.postedDate,
    required this.verified
  }); 

  
  factory SchoolsToBeVerified.fromJson(Map<String, dynamic> json) =>
      SchoolsToBeVerified(
        id: json["id"] ?? '',
        schoolName: json["schoolName"] ?? '',
        schoolID: json["schoolID"] ?? '',
        place: json["place"] ?? '',
        district: json["district"] ?? '',
        adminUserName: json["adminUserName"] ?? '',
        password: json["password"] ?? '',
        postedDate: json["postedDate"] ?? '', 
        email: json["email"] ?? '',
        phoneNumber: json["phoneNumber"]?? '',  
        verified: json["verified"]?? ''
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolName": schoolName,
        "schoolID": schoolID,
        "district": district,
        "place": place,
        "adminUserName": adminUserName,
        "password": password,
        "postedDate": postedDate, 
        "email": email, 
        "phoneNumber": phoneNumber, 
        "verified": verified
      };
}
  

class AddRequestedSchoolsToFirebase{ 
 

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addRequestedSchools(SchoolsToBeVerified schoolModel,context){
    try{
      _firestore.collection('RequestedSchools').doc(schoolModel.schoolID)
          .set(schoolModel.toJson()).then((value) {
            return showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Message'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Thank you for applying for an account. Your account is currently pending approval by the site administrator.In the meantime, a welcome message with further instructions has been sent to your e-mail address.'),
                     
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
            );
          });

    } on FirebaseException catch(e){
      print('Error ${e.message.toString()}');
    }
   
  }

}