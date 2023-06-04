// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Create_buttonWidget.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../model/admin_models/achievements_model/achievements_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

// ignore: must_be_immutable
class AddAchievements extends StatefulWidget {
  AddAchievements({super.key, required this.schoolID});

  String schoolID;

  @override
  State<AddAchievements> createState() => _AddAchievementsState();
}

class _AddAchievementsState extends State<AddAchievements> {

  String uid = const Uuid().v1();

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    File image;

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  QueryDocumentSnapshot<Map<String, dynamic>>? classListValue;
  QueryDocumentSnapshot<Map<String, dynamic>>? studentListValue;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Uint8List? _file;
  Uint8List? file;
  bool loadingStatus = false;
  String studentID = '';



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
          studentName: studentListValue?['studentName'],
          dateofAchievement: dateController.text,
          description: descriptionController.text,
          achievement: achievementController.text,
          admissionNumber: admissionNumberController.text, 
          uid: uid,
          studentID: studentID);

      FirebaseFirestore.instance //d4srOy0ovzUPBmZs3CBFRoOImIU2
          .collection('SchoolListCollection')
          .doc(widget.schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('Achievements')
          .doc(modell.uid)
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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 27, 95, 88),
      
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height * 1.4,
              width: size.width * 1 / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(color: cWhite),
                  Column(
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
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: size.height * 1.4,
              width: size.width * 1 / 2,
              child:
               Form(key: formKey,
                 child: Column(children: [
                   Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.width / 30),
                        child:(_file == null)? CircleAvatar(
                          radius: 80.w,
                          backgroundImage:
                              const NetworkImage('https://via.placeholder.com/150'),
                          backgroundColor: const Color.fromARGB(241, 54, 225, 248),
                        ): CircleAvatar(
                          radius: 80.w,
                          backgroundImage: MemoryImage(_file!)
                              
                        ) ,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 120.w,
                          top: 170.w,
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            alignment: Alignment.center,
                            child:  Icon(
                              Icons.camera_alt_outlined,size: 22.w,
                              color: const Color.fromARGB(255, 156, 20, 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBoxH20,
                    Text('+ Upload photo',style: TextStyle(color: adminePrimayColor,fontSize: 13.w),),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('SchoolListCollection')
                            .doc(Get.find<AdminLoginScreenController>().schoolID)
                            .collection('classes')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } 
               
                      //
                      //    if(snapshot.hasData){
                           // return Text(snapshot.data!.docs[0]['className']);
                         // }
                          return Container(
                            height: screenSize.width * 1 / 30,
                            width: screenSize.width * 0.30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 238, 238, 238)),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: DropdownButton(
                                hint: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: (classListValue == null)
                                        ? const Text(
                                            "Select Class",
                                            style: TextStyle(
                                                color:
                                                    Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 18),
                                          )
                                        : Text(classListValue?['className'])),
                                underline: const SizedBox(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                icon:  Padding(
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
                                   QueryDocumentSnapshot<Map<String, dynamic>>? categoryIDObject = snapshot.data?.docs
                                      .where(
                                          (element) => element["docid"] == val.toString())
                                      .toList()
                                      .first;
                                 log(categoryIDObject?['docid']);
                          
                                  setState(
                                    () {
                          
                                       classListValue = categoryIDObject; 
                                       
                                    }, 
               
                             
                                    
                                  ); 
                                  log(classListValue?['docid']);
                                }),
                          );
                        }),
                  ),
               
                  const SizedBox(
                    height: 10,
                  ),
                  (classListValue == null)
                      ? const SizedBox()
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(widget.schoolID)
                              .collection(Get.find<GetFireBaseData>().bYear.value)
                              .doc(Get.find<GetFireBaseData>().bYear.value)
                              .collection('classes')
                              .doc(classListValue?['docid'])
                              .collection('Students')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            return Container(
                              height: screenSize.width * 1 / 30,
                              width: screenSize.width * 0.30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromARGB(255, 238, 238, 238)),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: DropdownButton(
                                  hint: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: (studentListValue == null)
                                          ?  Text(
                                              "Select Students",
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 18.w),
                                            )
                                          : Text(studentListValue?['studentName'])),
                                  underline: const SizedBox(),
                                  style:  TextStyle(
                                    fontSize: 18.w,
                                    color: Colors.black,
                                  ),
                                  icon:  Padding(
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
                                    var categoryIDObject = snapshot.data?.docs
                                        .where((element) => element["docid"] == val.toString())
                                        .toList()
                                        .first;
               
                                    setState(
                                      () {
                                        studentListValue = categoryIDObject; 
                                        studentID = studentListValue?['docid'];
                                      },
                                    ); 
                                    log(studentListValue?['docid']);
                                  }),
                            );
                          }),
                 
                
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                    child: TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
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
                    padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                    child: TextFormField(
                      validator: checkFieldEmpty,
                      controller: admissionNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        icon:
                            Icon(Icons.format_list_numbered, color: Colors.blue),
                        labelText: 'ADMISSION NUMBER',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                    child: TextFormField(
                      validator: checkFieldEmpty,
                      controller: achievementController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        icon:
                            Icon(Icons.card_membership_sharp, color: Colors.blue),
                        labelText: 'ACHIEVEMENT HEAD',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                    child: TextFormField(
                      validator: checkFieldEmpty,
                      controller: descriptionController,
                      decoration: const InputDecoration(
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
                  Padding(
                    padding:  EdgeInsets.all(10.w),
                    child: (InkWell(
                      onTap: () async{
                        
                        if (formKey.currentState!.validate()){
                   // formKey.currentState!.validate();
                        
                       await uploadImageToStorage(file).then((value) => showToast(msg: 'New Achievement Added!'));
                        achievementController.clear();
                        dateController.clear();
                        descriptionController.clear();
                        admissionNumberController.clear();
                        }
                      },
                      child: CreateContainerWidget(text: 'Create',fontSize: 20.w,),
                    )),
                  ),
                             ]),
               ),
            )
          ],
        ),
      ),
    );
  }
}




