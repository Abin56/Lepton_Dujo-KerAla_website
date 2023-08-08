import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AssigningPage extends StatefulWidget {
  AssigningPage({super.key, required this.parentSnap, required this.classID});

  DocumentSnapshot parentSnap;
  String classID;

  @override
  State<AssigningPage> createState() => _AssigningPageState();
}

class _AssigningPageState extends State<AssigningPage> {
  QueryDocumentSnapshot<Map<String, dynamic>>? classListValue;

  QueryDocumentSnapshot<Map<String, dynamic>>? studentListValue;

  Future<void> assignParentFunction(String childID, String classID) async {
    log(classID);

    log('function starts');
    //code done..uncomment it after taking backup

    DocumentReference parentDocRef = widget.parentSnap.reference;
    List<String> childrenList = [];
    childrenList.add(widget.parentSnap['studentID']);
    childrenList.add(childID);
    parentDocRef
        .update({'multipleChildren': true, 'childrenIDList': childrenList});

        log('parentid: ${widget.parentSnap['district']}');

    log('function at middle');
    //adding parent to parentcollection of the new student assigned

    // log(widget.parentSnap['createdate']);
    // log(widget.parentSnap['deviceToken']);
    // log(widget.parentSnap['district']);
    // log(widget.parentSnap['docid']);
    // log(widget.parentSnap['gender']);

    // log(widget.parentSnap['houseName']);
    // log(widget.parentSnap['parentEmail']);
    // log(widget.parentSnap['parentName']);
    // log(widget.parentSnap['parentPhoneNumber']);
    // log(widget.parentSnap['pincode']);
    // log(widget.parentSnap['place']);
    // log(widget.parentSnap['profileImageID']);
    // log(widget.parentSnap['profileImageURL']);
    // log(widget.parentSnap['state']);
    // log(widget.parentSnap['studentID']);
    // log(widget.parentSnap['userRole']);

    

    log('classsid: $classID');

    //log("parentSnap data: ${widget.parentSnap['deviceToken']}");
log("schoolListValue: $schoolListValue");
log("classID: $classID");

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(schoolListValue!['docid'])
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(classID)
        .collection('ParentCollection')
        .doc(widget.parentSnap['docid']);



     await docRef.set({
        'createdate' : widget.parentSnap['createdate'],
       // 'deviceToken' : widget.parentSnap['deviceToken'],
        'district' : widget.parentSnap['district'],
        'docid' : widget.parentSnap['docid'],
        'gender' : widget.parentSnap['gender'],
        'houseName' : widget.parentSnap['houseName'],
        'parentEmail' : widget.parentSnap['parentEmail'],
        'parentName' : widget.parentSnap['parentName'],
        'parentPhoneNumber' : widget.parentSnap['parentPhoneNumber'],
        'pincode' : widget.parentSnap['pincode'],
        'place' : widget.parentSnap['place'] ,
        'profileImageID' : widget.parentSnap['profileImageID'],
        'profileImageURL' : widget.parentSnap['profileImageURL'],
        'state' : widget.parentSnap['state'],
        'studentID' : widget.parentSnap['studentID'],
        'userRole' : widget.parentSnap['userRole'],
        'multipleChildren': true,
        'childrenIDList': childrenList
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.parentSnap['profileImageURL']),
          ),
          sizedBoxH20,
          Text(widget.parentSnap['parentName']),
          sizedBoxH20,
          const Text('Add Student from class: '),
          sizedBoxH20,
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('SchoolListCollection')
                  .doc(schoolListValue!['docid'])
                  .collection(Get.find<GetFireBaseData>().bYear.value)
                  .doc(Get.find<GetFireBaseData>().bYear.value)
                  .collection('classes')
                  .snapshots(),
              builder: ((context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(right: 100, left: 100),
                  child: DropdownButton(
                      hint: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: (classListValue == null)
                            ? const Text('Select Class')
                            : Text(classListValue!['className']),
                      ),
                      underline: const SizedBox(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      icon: Padding(
                        padding: EdgeInsets.all(
                          13.w,
                        ),
                        child: Icon(Icons.arrow_drop_down,
                            size: 18.w, color: Colors.grey),
                      ),
                      isExpanded: true,
                      items: snapshot.data?.docs.map(
                        (val) {
                          return DropdownMenuItem(
                            value: val["docid"],
                            child: Text(val["className"]),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        QueryDocumentSnapshot<Map<String, dynamic>>?
                            categoryIDObject = snapshot.data?.docs
                                .where((element) =>
                                    element["docid"] == val.toString())
                                .toList()
                                .first;
                        log(categoryIDObject?['docid']);
                        setState(() {
                          classListValue = categoryIDObject;
                        });
                      }),
                );
              })),
          sizedBoxH20,
          Visibility(
            visible: (classListValue != null) ? true : false,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('SchoolListCollection')
                    .doc(schoolListValue!['docid'])
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection('classes')
                    .doc(classListValue?['docid'])
                    .collection('Students')
                    .snapshots(),
                builder: ((context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: (studentListValue == null)
                              ? const Text('Select Student')
                              : Text(studentListValue!['studentName']),
                        ),
                        underline: const SizedBox(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        icon: Padding(
                          padding: EdgeInsets.all(
                            13.w,
                          ),
                          child: Icon(Icons.arrow_drop_down,
                              size: 18.w, color: Colors.grey),
                        ),
                        isExpanded: true,
                        items: snapshot.data?.docs.map(
                          (val) {
                            return DropdownMenuItem(
                              value: val["docid"],
                              child: Text(val["studentName"]),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          QueryDocumentSnapshot<Map<String, dynamic>>?
                              categoryIDObject = snapshot.data?.docs
                                  .where((element) =>
                                      element["docid"] == val.toString())
                                  .toList()
                                  .first;
                          log(categoryIDObject?['docid']);
                          setState(() {
                            studentListValue = categoryIDObject;
                          });
                        }),
                  );
                })),
          ),
          sizedBoxH20,
          Visibility(
            visible: (classListValue == null || studentListValue == null)
                ? false
                : true,
            child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmation'),
                        content: Text(
                            'Are you sure you want to assign ${widget.parentSnap['parentName']} as the parent of ${studentListValue!['studentName']} from class ${classListValue!['className']}'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              await assignParentFunction(
                                      studentListValue!['docid'],
                                      classListValue!['docid'])
                                  .then((value) => Navigator.pop(context));
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    });
              },
              color: Colors.blue,
              child: const Text('Assign'),
            ),
          )
        ],
      ),
    ));
  }
}
