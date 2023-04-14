// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../../../../../../model/admin_models/achievements_model/achievements_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../widgets/custom_container.dart';

// ignore: must_be_immutable
class AddAchievements extends StatefulWidget {
  AddAchievements({super.key, required this.schoolID});

  String schoolID;

  @override
  State<AddAchievements> createState() => _AddAchievementsState();
}

class _AddAchievementsState extends State<AddAchievements> {
  var classListValue;
  var studentListValue;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Uint8List? _file;
  Uint8List? file;
  bool loadingStatus = false;

  TextEditingController achievementController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();

  Future<Map<String, String>> uploadImageToStorage(file) async {
    try {
      // FilePickerResult? result =
      //     await FilePicker.platform.pickFiles(type: FileType.image);
      // if (result != null) {
      //   Uint8List? file = result.files.first.bytes;
      setState(() {
        loadingStatus = true;
      });
      String uid = const Uuid().v1();
      //isImageUpload.value = true;
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("files/achievements/$uid")
          .putData(file!);

      final TaskSnapshot snap = await uploadTask;
      final String downloadUrl = await snap.ref.getDownloadURL();

      AchievementModel modell = AchievementModel(
          photoUrl: downloadUrl,
          studentName: studentListValue['studentName'],
          dateofAchievement: dateController.text,
          description: descriptionController.text,
          achievement: achievementController.text,
          admissionNumber: admissionNumberController.text);

      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(widget.schoolID)
          .collection('Achievements')
          .doc()
          .set(modell.toJson());

      setState(() {
        loadingStatus = false;
      });

      return {
        "downloadUrl": downloadUrl,
        "imageUid": uid,
      };
      //}
      //  else {
      //   return {};
      // }
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(
        title: Text('Add Achievements'),
        backgroundColor: adminePrimayColor,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height * 1.4,
              width: size.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi Admin ',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text(
                    'Add Achievements',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    width: size.width / 2,
                    child: LottieBuilder.network(
                        'https://assets10.lottiefiles.com/packages/lf20_akRaH1h1KF.json'),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: size.height * 1.4,
              width: size.width * 1 / 2,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('SchoolListCollection')
                          .doc(widget.schoolID)
                          .collection('Classes')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container(
                          height: screenSize.width * 1 / 30,
                          width: screenSize.width * 0.30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color.fromARGB(255, 238, 238, 238)),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: DropdownButton(
                              hint: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: (classListValue == null)
                                      ? Text(
                                          "Select Class",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 18),
                                        )
                                      : Text(classListValue['id'])),
                              underline: const SizedBox(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              icon: const Padding(
                                padding: EdgeInsets.all(
                                  13,
                                ),
                                child: Icon(Icons.arrow_drop_down,
                                    size: 18, color: Colors.grey),
                              ),
                              isExpanded: true,
                              items: snapshot.data!.docs.map(
                                (val) {
                                  return DropdownMenuItem(
                                    value: val["classID"],
                                    child: Text(val["classID"]),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                var categoryIDObject = snapshot.data!.docs
                                    .where(
                                        (element) => element["classID"] == val)
                                    .toList()
                                    .first;
                                print(categoryIDObject['classID']);

                                setState(
                                  () {
                                    classListValue = categoryIDObject;
                                  },
                                );
                              }),
                        );
                      }),
                ),

                SizedBox(
                  height: 10,
                ),
                (classListValue == null)
                    ? SizedBox()
                    : StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('SchoolListCollection')
                            .doc(widget.schoolID)
                            .collection('Classes')
                            .doc(classListValue['classID'])
                            .collection('Students')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Container(
                            height: screenSize.width * 1 / 30,
                            width: screenSize.width * 0.30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 238, 238, 238)),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: DropdownButton(
                                hint: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: (studentListValue == null)
                                        ? Text(
                                            "Select Students",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 18),
                                          )
                                        : Text(studentListValue['id'])),
                                underline: const SizedBox(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                icon: const Padding(
                                  padding: EdgeInsets.all(
                                    13,
                                  ),
                                  child: Icon(Icons.arrow_drop_down,
                                      size: 18, color: Colors.grey),
                                ),
                                isExpanded: true,
                                items: snapshot.data!.docs.map(
                                  (val) {
                                    return DropdownMenuItem(
                                      value: val["id"],
                                      child: Text(val["id"]),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  var categoryIDObject = snapshot.data!.docs
                                      .where((element) => element["id"] == val)
                                      .toList()
                                      .first;

                                  setState(
                                    () {
                                      studentListValue = categoryIDObject;
                                    },
                                  );
                                }),
                          );
                        }),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.width / 30),
                      child:(_file == null)? CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Color.fromARGB(241, 54, 225, 248),
                      ): CircleAvatar(
                        radius: 100,
                        backgroundImage: MemoryImage(_file!)
                            
                      ) ,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 1 / 12,
                        top: size.width * 1 / 9.5,
                      ),
                      child: InkWell(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(type: FileType.image);
                          if (result != null) {
                            file = result.files.first.bytes;
                            setState(() {
                              _file = file;
                            });
                          }
                        },
                        child: Container(
                          height: size.width / 40,
                          width: size.width / 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Color.fromARGB(255, 156, 20, 20),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(Icons.calendar_today, color: Colors.blue),
                        labelText: "Enter Date"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);

                        setState(() {
                          dateController.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextField(
                    controller: admissionNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      icon:
                          Icon(Icons.format_list_numbered, color: Colors.blue),
                      labelText: 'ADMISSION NUMBER',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextField(
                    controller: achievementController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      icon:
                          Icon(Icons.card_membership_sharp, color: Colors.blue),
                      labelText: 'ACHIEVEMENT HEAD',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      icon: Icon(Icons.note_alt_outlined, color: Colors.blue),
                      labelText: 'DESCRIPTION',
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width / 38,
                ),
                //  Padding(
                // padding: const EdgeInsets.all(10),
                // child: (
                //   InkWell(
                //   onTap: () {},
                //  child:
                // Container(
                //         height: size.width * 1 /20,
                //         width: size.width * 1 / 4,
                //         //color: Colors.red,
                //         child: CustomContainer(
                //           text: 'Upload Document',
                //           onTap: () {},
                //         )
                //         ),
                //  )),
                //),
                SizedBox(
                  height: size.width / 38,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: (InkWell(
                    onTap: () {
                      uploadImageToStorage(file).then((value) => showToast(msg: 'New Achievement Added!'));
                    },
                    child: Container(
                        height: size.width * 1 / 17,
                        width: size.width * 1 / 6.5,
                        //color: Colors.red,
                        child: CustomContainer(
                          text: 'CREATE',
                          onTap: () {},
                        )),
                  )),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
