// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../model/admin_models/scholarship_model/scholarship_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class AdminScholarships extends StatefulWidget {
  AdminScholarships({super.key, required this.schoolID});

  String schoolID;

  @override
  State<AdminScholarships> createState() => _AdminScholarshipsState();
}

class _AdminScholarshipsState extends State<AdminScholarships> {
  QueryDocumentSnapshot<Map<String, dynamic>>? classListValue;
  QueryDocumentSnapshot<Map<String, dynamic>>? studentListValue;
  Uint8List? file;
  Uint8List? sFile;
  Uint8List? _file;
  bool loadingStatus = false;
  FilePickerResult? result;
  PlatformFile? pickedFile;
  File? finalFile;
  bool docLoading = false;

  TextEditingController dateController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();
  TextEditingController scholarshipNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String studentID = '';
  String downloadUrl2 = '';

  //hwg

   Future<void> uploadToFirebase(
      String admissionNumber, String date, String description, String scholarshipName, Uint8List documentFile) async {
    try {
      // Upload the document file to Firebase Storage
      String documentFileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageReference =
         FirebaseStorage.instance.ref().child('files/scholarshipdocuments/${studentListValue?['studentName']}/documents/$documentFileName');
      UploadTask uploadTask = storageReference.putData(documentFile);
      final TaskSnapshot storageSnapshot = await uploadTask;

      // Get the download URL of the uploaded document file
      String documentUrl = await storageSnapshot.ref.getDownloadURL();

      
      ScholarshipModel modell = ScholarshipModel(
          photoUrl: documentUrl,
          studentName: studentListValue?['studentName'],
          admissionNumber: admissionNumber,
          scholarshipName: scholarshipName,
          date: date,
          description: description,
          document: downloadUrl2,
          studentID: studentID);

      // Create a new document in the Firebase Firestore collection
      await  FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(widget.schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('Scholarships').doc().set(modell.toJson());

      print('Upload successful');
    } catch (e) {
      print('Upload failed: $e');
    }
  }

  //hwg

  Future<Map<String, String>> uploadToStorage() async {
    try {
      setState(() {
        loadingStatus = true;
      });
      String uid = const Uuid().v1();
      //  String uid2 = const Uuid().v1();
      //isImageUpload.value = true;
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child(
              "files/scholarshipimages/${studentListValue?['studentName']}/images/$uid")
          .putData(file!);

      print('check 1');

      // UploadTask uploadTask2 =  FirebaseStorage.instance.ref()
      // .child("files/scholarshipdocuments/${studentListValue['studentName']}/images/documents/$uid2")
      // .putFile(finalFile!);

      print('check 2');

      // final path =   'teachernotes/${pickedFile!.name}';
      //          final file =  pickedFile!.bytes;
      //          print('this is path: '+ path);
      //          final ref = FirebaseStorage.instance.ref().child(path);
      //          ref.putData(file!);
      //          print('completed ${ref.fullPath}');

      final TaskSnapshot snap = await uploadTask;
      final String downloadUrl = await snap.ref.getDownloadURL();

      // final TaskSnapshot snap2 = await uploadTask2;
      // final String downloadUrl2 = await snap2.ref.getDownloadURL();

      print('hey');
      // print('DownlodURL2: $downloadUrl2');

      ScholarshipModel modell = ScholarshipModel(
          photoUrl: downloadUrl,
          studentName: studentListValue?['studentName'],
          admissionNumber: admissionNumberController.text,
          scholarshipName: scholarshipNameController.text,
          date: dateController.text,
          description: descriptionController.text,
          document: downloadUrl2,
          studentID: studentID);

      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(widget.schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('Scholarships')
          .doc()
          .set(modell.toJson());

      setState(() {
        loadingStatus = false;
      });

      return {
        "imageUrl": downloadUrl,
        "imageUid": uid,
      };
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  Future<String> uploadDoc() async {
    String uid2 = const Uuid().v1();
    UploadTask uploadTask2 = FirebaseStorage.instance
        .ref()
        .child(
            "files/scholarshipdocuments/${studentListValue?['studentName']}/documents/$uid2")
        .putData(sFile!);

    return '';
  }

  uploadTwo() async {
    setState(() {
      bool docLoading = true;
    });
    try {
      // log('gggggg${studentListValue?['studentName']}');
      String uid2 = const Uuid().v1();
      //isImageUpload.value = true;

      UploadTask uploadTask2 = FirebaseStorage.instance
          .ref()
          .child(
              "files/scholarshipdocuments/${studentListValue?['studentName']}/documents/$uid2")
          .putData(sFile!);

      // final path =   'teachernotes/${pickedFile!.name}';
      //          final file =  pickedFile!.bytes;
      //          log('this is path: $path');
      //          final ref = FirebaseStorage.instance.ref().child(path);
      //          ref.putData(file!);
      //          log('completed ${ref.fullPath}');

      final TaskSnapshot snap2 = await uploadTask2;
      downloadUrl2 = await snap2.ref.getDownloadURL(); 
      log('downloadUrl2$downloadUrl2');

      setState(() {
        bool docLoading = false;
      });

      return downloadUrl2;
    } catch (e) {
      log(e.toString());
    }

    return '';
  }

  @override
  void initState() {
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 247, 246),
          body: SingleChildScrollView(
              child: Row(children: [
            Container(
              height: screenSize.height * 1.4,
              width: screenSize.width * 1 / 2,
              color: adminePrimayColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(
                    color: cWhite,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            log(classListValue?['docid']);
                          },
                          child: Text(
                            'Hi ! Admin ',
                            style: ralewayStyle.copyWith(
                              fontSize: 42.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        sizedBoxH20,
                        Text(
                          'Create Scholarship',
                          style: ralewayStyle.copyWith(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.width / 2.5,
                          width: screenSize.width / 2,
                          child: LottieBuilder.network(
                              'https://assets1.lottiefiles.com/packages/lf20_gay13id1.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: screenSize.height * 1.4,
              width: screenSize.width * 1 / 2,
              child: Column(children: [
                SizedBox(
                  // height: 200,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.width / 30),
                        child: (_file == null)
                            ? CircleAvatar(
                                radius: 80.w,
                                backgroundImage: const NetworkImage(
                                    'https://via.placeholder.com/150'),
                                backgroundColor:
                                    const Color.fromARGB(241, 54, 225, 248),
                              )
                            : CircleAvatar(
                                radius: 80.w,
                                backgroundImage: MemoryImage(_file!)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 120.w,
                          top: 160.w,
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
                            height: screenSize.width / 40,
                            width: screenSize.width / 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 82, 196, 173),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Color.fromARGB(255, 156, 20, 20),
                              size: 22.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxH20,
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10),
                  child: (Get.find<AdminLoginScreenController>().schoolID ==
                          null)
                      ? const SizedBox()
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(Get.find<AdminLoginScreenController>()
                                  .schoolID)
                              .collection(
                                  Get.find<GetFireBaseData>().bYear.value)
                              .doc(Get.find<GetFireBaseData>().bYear.value)
                              .collection('classes')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (snapshot.hasData) {
                              return GestureDetector(
                                onTap: () {
                                  log(widget.schoolID);
                                },
                                child: Container(
                                  height: screenSize.width * 1 / 30,
                                  width: screenSize.width * 0.30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(13.w),
                                  ),
                                  child: DropdownButton(
                                      hint: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: (classListValue == null)
                                              ? Text(
                                                  "Select Class",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 18.w),
                                                )
                                              : Text(classListValue?[
                                                  'className'])),
                                      underline: SizedBox(),
                                      style: TextStyle(
                                        fontSize: 18.w,
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
                                        QueryDocumentSnapshot<
                                                Map<String, dynamic>>?
                                            categoryIDObject = snapshot
                                                .data?.docs
                                                .where((element) =>
                                                    element["docid"] ==
                                                    val.toString())
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
                                ),
                              );
                            }
                            return const Text('Something went wrong!');
                          }),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: (classListValue == null)
                      ? const SizedBox()
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(widget.schoolID)
                              .collection(
                                  Get.find<GetFireBaseData>().bYear.value)
                              .doc(Get.find<GetFireBaseData>().bYear.value)
                              .collection('classes')
                              .doc(classListValue?['docid'])
                              .collection('Students')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData) {
                              return Container(
                                height: screenSize.width * 1 / 30,
                                width: screenSize.width * 0.30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
                                  //color: const Color.fromARGB(255, 238, 238, 238)),
                                  borderRadius: BorderRadius.circular(13.w),
                                ),
                                child: DropdownButton(
                                    hint: Padding(
                                        padding: EdgeInsets.all(10.0.w),
                                        child: (studentListValue == null)
                                            ? Text(
                                                "Select Students",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 18.w),
                                              )
                                            : Text(studentListValue?[
                                                'studentName'])),
                                    underline: SizedBox(),
                                    style: TextStyle(
                                      fontSize: 18.w,
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
                                      var categoryIDObject = snapshot.data?.docs
                                          .where((element) =>
                                              element["docid"] ==
                                              val.toString())
                                          .toList()
                                          .first;

                                      setState(
                                        () {
                                          studentListValue = categoryIDObject;
                                          studentID =
                                              studentListValue?['docid'];
                                        },
                                      );
                                      log(studentListValue?['docid']);
                                    }),
                              );
                            }
                            return const Text('Something went wrong');
                          }),
                ),
                sizedBoxH20,
                Padding(
                  padding: EdgeInsets.only(left: 80.w, right: 80.w, top: 10.h),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.w))),
                        icon: Icon(Icons.calendar_today,
                            color: AppColors.blueDarkColor),
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
                  padding: EdgeInsets.only(left: 80.w, right: 80.w, top: 10),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: admissionNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.w))),
                      icon: Icon(Icons.format_list_numbered,
                          color: AppColors.blueDarkColor),
                      labelText: 'Admission Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.w, right: 80.w, top: 10),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: scholarshipNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.w))),
                      icon: Icon(Icons.card_membership_sharp,
                          color: AppColors.blueDarkColor),
                      labelText: 'ScholarShip Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.w, right: 80.w, top: 10),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.w))),
                      icon: Icon(Icons.note_alt_outlined,
                          color: AppColors.blueDarkColor),
                      labelText: 'Description',
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width / 75,
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: (InkWell(
                    onTap: () async {
                      try {
                        await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: [
                            'jpg',
                            'pdf',
                            'doc',
                            'docx',
                            'xls',
                            'xlsx',
                            'txt'
                          ],
                        ).then((value) async {
                          log('hey $value');
                          setState(() {
                            pickedFile = value?.files.first;
                            sFile = value?.files.first.bytes;
                          });

                          //finalFile = File(sFile);
                          await uploadTwo();
                          return null;
                        });
                      } catch (e) {
                        log('gggggg${e.toString()}');
                      }
                    },
                    child: (docLoading == true)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: screenSize.width * 1 / 20,
                            width: screenSize.width * 1 / 5,
                            //color: Colors.red,
                            child: (docLoading == true)
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomContainer2(
                                    text: 'Upload Document',
                                    onTap: () async {},
                                  )),
                  )),
                ),
                SizedBox(
                  height: screenSize.width / 50,
                ),
                (pickedFile == null)
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          pickedFile!.name,
                          style: TextStyle(
                              fontSize: 20.w, fontWeight: FontWeight.bold),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: (InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                       // uploadToStorage()
                        uploadToFirebase(admissionNumberController.text, dateController.text, descriptionController.text, scholarshipNameController.text, file!)
                        .then((value) => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                    'Scholarship succesfully added!'),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ok'),
                                  )
                                ],
                              );
                            }));
                      }
                      clearField();
                    },
                    child: (loadingStatus == false)
                        ? SizedBox(
                            height: screenSize.width * 1 / 20,
                            width: screenSize.width * 1 / 4,
                            //color: Colors.red,
                            child: CustomContainer1(
                              text: 'CREATE',
                              onTap: () {},
                            ))
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  )),
                ),
              ]),
            )
          ]))),
    );
  }

  void clearField() {
    dateController.clear();
    admissionNumberController.clear();
    descriptionController.clear();
    scholarshipNameController.clear();
  }
}

class CustomContainer1 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomContainer1({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(width: 1),
              gradient: LinearGradient(
                  colors: containerColor[8],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 25.w, color: Color.fromARGB(255, 251, 250, 250)),
              ),
            ),
          ),
        ));
  }
}

const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color.fromARGB(255, 212, 150, 145), Color.fromARGB(255, 212, 150, 145)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 205, 216, 228)],
  [adminePrimayColor, adminePrimayColor]
];

class CustomContainer2 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomContainer2({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(8.0.w),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.w),
              //border: Border.all(width: 1),
              gradient: LinearGradient(
                  colors: containerColor1[9],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 25.w, color: Color.fromARGB(255, 251, 250, 250)),
              ),
            ),
          ),
        ));
  }
}

const containerColor1 = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color.fromARGB(255, 212, 150, 145), Color.fromARGB(255, 212, 150, 145)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 205, 216, 228)],
  [adminePrimayColor, adminePrimayColor],
  [cBlue, cBlue],
];
