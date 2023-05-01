import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../model/admin_models/scholarship_model/scholarship_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_container.dart';

class AdminScholarships extends StatefulWidget {
  AdminScholarships({super.key, required this.schoolID});

  String schoolID;

  @override
  State<AdminScholarships> createState() => _AdminScholarshipsState();
}

class _AdminScholarshipsState extends State<AdminScholarships> {
  var classListValue;
  var studentListValue;
  Uint8List? file;
  Uint8List? _file;
  bool loadingStatus = false;
  FilePickerResult? result;
  PlatformFile? pickedFile;
  File? finalFile;

  TextEditingController dateController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();
  TextEditingController scholarshipNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
              "files/scholarshipimages/${studentListValue['studentName']}/images/$uid")
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
          studentName: studentListValue['studentName'],
          admissionNumber: admissionNumberController.text,
          scholarshipName: scholarshipNameController.text,
          date: dateController.text,
          description: descriptionController.text,
          document: '');

      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(widget.schoolID)
          .collection('Scholarships')
          .doc()
          .set(modell.toJson());

      setState(() {
        loadingStatus = false;
      });

      return {
        "imageUrl": downloadUrl,
        'documentUrl': '',
        "imageUid": uid,
      };
    } catch (e) {
      log(e.toString());
      return {};
    }
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
          backgroundColor: Color.fromARGB(255, 241, 247, 246),
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
                        Text(
                          'Hi ! Admin ',
                          style: ralewayStyle.copyWith(
                            fontSize: 42.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
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
                              'https://assets3.lottiefiles.com/packages/lf20_cqnuh0al.json'),
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
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10),
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
                                  padding: EdgeInsets.all(10.0),
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
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: (classListValue == null)
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
                                        .where(
                                            (element) => element["id"] == val)
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
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width / 30),
                      child: (_file == null)
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                              backgroundColor:
                                  Color.fromARGB(241, 54, 225, 248),
                            )
                          : CircleAvatar(
                              radius: 80, backgroundImage: MemoryImage(_file!)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width * 1 / 12,
                        top: screenSize.width * 1 / 9.5,
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 82, 196, 173),
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
                sizedBoxH20,
                Text(
                  'Upload Photo',
                  style: TextStyle(color: adminePrimayColor),
                ),
                sizedBoxH20,
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: admissionNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      icon: Icon(Icons.format_list_numbered,
                          color: AppColors.blueDarkColor),
                      labelText: 'ADMISSION NUMBER',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: scholarshipNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      icon: Icon(Icons.card_membership_sharp,
                          color: AppColors.blueDarkColor),
                      labelText: 'SCHOLARSHIP NAME',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      icon: Icon(Icons.note_alt_outlined,
                          color: AppColors.blueDarkColor),
                      labelText: 'DESCRIPTION',
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width / 38,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: (InkWell(
                    onTap: () async {
                      result = await FilePicker.platform.pickFiles(
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
                      );

                      setState(() {
                        pickedFile = result!.files.first;
                      });

                      finalFile = File(pickedFile!.path!);
                    },
                    child: Container(
                        height: screenSize.width * 1 / 20,
                        width: screenSize.width * 1 / 4,
                        //color: Colors.red,
                        child: CustomContainer2(
                          text: 'Upload Document',
                          onTap: () {},
                        )),
                  )),
                ),
                SizedBox(
                  height: screenSize.width / 38,
                ),
                (pickedFile == null)
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          pickedFile!.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: (InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate())
                        //this
                        uploadToStorage().then((value) => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('Scholarship succesfully added!'),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  )
                                ],
                              );
                            }));
                    },
                    child: (loadingStatus == false)
                        ? Container(
                            height: screenSize.width * 1 / 20,
                            width: screenSize.width * 1 / 4,
                            //color: Colors.red,
                            child: CustomContainer1(
                              text: 'CREATE',
                              onTap: () {},
                            ))
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  )),
                ),
              ]),
            )
          ]))),
    );
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
        padding: EdgeInsets.all(8.0),
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
                    fontSize: 25, color: Color.fromARGB(255, 251, 250, 250)),
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
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
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
                    fontSize: 25, color: Color.fromARGB(255, 251, 250, 250)),
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
