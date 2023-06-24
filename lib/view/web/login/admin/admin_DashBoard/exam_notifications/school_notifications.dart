import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/controller/_add_exam/add_exam_controller.dart';
import 'package:dujo_kerala_website/model/add_exam_model/add_exam_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../constant/constant.dart';

class SchoolLevelNotifications extends StatefulWidget {
  AddExamController addExamController = Get.put(AddExamController());
  SchoolLevelNotifications({super.key, required this.schoolID});

  String schoolID;

  @override
  State<SchoolLevelNotifications> createState() =>
      _SchoolLevelNotificationsState();
}

final formKey = GlobalKey<FormState>();

class _SchoolLevelNotificationsState extends State<SchoolLevelNotifications> {
  DateTime? _selectedDateForApplyDate;
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;
  final TextEditingController _applyleaveDateController =
      TextEditingController();
  final TextEditingController _applyFromDateController =
      TextEditingController();
  final TextEditingController _applyTODateController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController chaptersToCover = TextEditingController();

  String radioButton = "";
  String? gender;
  addExamNotifications() {
    FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('SchoolLevelExamNotifications')
        .doc()
        .set({
      'examName': name.text,
      'examDate': date.text,
      'examDescription': description.text,
      'syllabusToCover': chaptersToCover.text
    });
  }

  final int _stackIndex = 1;

  final String _singleValue = "Text alignment right";
  @override
  Widget build(BuildContext context) {
    String selectedLeaveType = '';
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        HeadingContainer(screenSize: screenSize),
        Container(
          color: cWhite,
          child: Row(
            children: [
              Container(
                height: screenSize.height * 0.85,
                width: screenSize.width / 2,
                color: adminePrimayColor,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 300.h, left: 200.w),
                      child: SizedBox(
                        height: 100.h,
                        width: 500.w,
                        child: ListTile(
                          leading: const Icon(Icons.add,color: cWhite,),
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: ((context) {
                                  return Center(
                                    child: AlertDialog(
                                      title: const Text(
                                          'Add New Exam Notification'),
                                      content: SizedBox(
                                        width: 400.w,
                                        height: 600.h,
                                        child: Form(
                                          key: formKey,
                                          child: ListView(
                                            children: [
                                              Column(
                                                children: [
                                                  const Divider(),
                                                  sizedBoxH20,
                                                  DropdownSearch<String>(
                                                    selectedItem:
                                                        'Select Exam Level',
                                                    validator: (v) => v == null
                                                        ? "required field"
                                                        : null,
                                                    items: const [
                                                      "School Level",
                                                      "Public Level",
                                                    ],
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLeaveType =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                validator: checkFieldEmpty,
                                                controller: name,
                                                decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(),
                                                    labelText:
                                                        'Name of Examination',
                                                    labelStyle:
                                                        GoogleFonts.poppins()),
                                                style: GoogleFonts.poppins(),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                validator: checkFieldEmpty,
                                                controller:
                                                    _applyFromDateController,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectFromDate(context),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'From',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              sizedBoxH10,
                                              TextFormField(
                                                validator: checkFieldEmpty,
                                                controller:
                                                    _applyTODateController,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectToDate(context),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'To',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        MaterialButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(20.h),
                                          child: MaterialButton(
                                            color: Colors.green,
                                            onPressed: () async {
                                              if(formKey.currentState!.validate()){

                                                  await widget.addExamController
                                                  .addExamtoSever(
                                                      context,
                                                      '',
                                                      name.text.trim(),
                                                      selectedLeaveType,
                                                      _applyFromDateController
                                                          .text
                                                          .trim(),
                                                      _applyTODateController
                                                          .text
                                                          .trim(),
                                                      DateTime.now()
                                                          .toString());

                                                          clearnotFunction();
                                              }

                                              
                                            
                                            },
                                            child: Text(
                                              'Add',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }));
                          },
                          title: Text(
                            'Add new Notification',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20.h),
                          ),
                        ),
                      ),
                    ),

                    //),
                  ],
                ),
              ),
              Row(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 8.w, bottom: 10.h),
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width / 4.2,
                        color: Colors.white,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(widget.schoolID)
                                .collection(
                                    Get.find<GetFireBaseData>().bYear.value)
                                .doc(Get.find<GetFireBaseData>().bYear.value)
                                .collection('School Level')
                                .snapshots(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final data = AddExamModel.fromMap(
                                      snapshot.data!.docs[index].data());

                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: Container(
                                      color: Colors.blueGrey,
                                      child: ListTile(
                                        leading:
                                            const Icon(Icons.notification_add),
                                        tileColor: Colors.white,
                                        onTap: () async {
                                          showDialog(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Alert'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: const <Widget>[
                                                      Text(
                                                          'Do you want to remove ?')
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text('Ok'),
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              'SchoolListCollection')
                                                          .doc(widget.schoolID)
                                                          .collection(
                                                              Get.find<
                                                                      GetFireBaseData>()
                                                                  .bYear
                                                                  .value)
                                                          .doc(Get.find<
                                                                  GetFireBaseData>()
                                                              .bYear
                                                              .value)
                                                          .collection(
                                                              'School Level')
                                                          .doc(data.docid)
                                                          .delete()
                                                          .then((value) {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        title: Text(
                                          data.examName,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 17.h),
                                        ),
                                        subtitle: Text(
                                          data.startingDate,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13.h),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            })),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 8.w, bottom: 10.h),
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width / 4.2,
                        color: cWhite,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(widget.schoolID)
                                .collection(
                                    Get.find<GetFireBaseData>().bYear.value)
                                .doc(Get.find<GetFireBaseData>().bYear.value)
                                .collection('Public Level')
                                .snapshots(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final data = AddExamModel.fromMap(
                                      snapshot.data!.docs[index].data());
                                  return Container(
                                    color: Colors.blueGrey,
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.notification_add),
                                      tileColor: Colors.white,
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Alert'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        'Do you want to remove ?')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[

                                                 TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                TextButton(
                                                  child: const Text('Ok'),
                                                  onPressed: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'SchoolListCollection')
                                                        .doc(widget.schoolID)
                                                        .collection(
                                                            Get.find<
                                                                    GetFireBaseData>()
                                                                .bYear
                                                                .value)
                                                        .doc(Get.find<
                                                                GetFireBaseData>()
                                                            .bYear
                                                            .value)
                                                        .collection(
                                                            'Public Level')
                                                        .doc(data.docid)
                                                        .delete()
                                                        .then((value) {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      title: Text(
                                        data.examName,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 17.h),
                                      ),
                                      subtitle: Text(
                                        data.startingDate,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 13.h),
                                      ),
                                    ),
                                  );
                                },
                              );
                            })),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }

  void clearnotFunction(){
    // _applyFromDateController.clear();
    // _applyTODateController.clear();
    name.clear();
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateForApplyDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDateForApplyDate) {
      setState(() {
        _selectedDateForApplyDate = picked;
        DateTime parseDate =
            DateTime.parse(_selectedDateForApplyDate.toString());
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        String formatted = formatter.format(parseDate);

        _applyleaveDateController.text = formatted.toString();
      });
    }
  }

  _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedFromDate) {
      setState(() {
        _selectedFromDate = picked;
        DateTime parseDate = DateTime.parse(_selectedFromDate.toString());
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        String formatted = formatter.format(parseDate);

        _applyFromDateController.text = formatted.toString();
      });
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedToDate) {
      setState(() {
        _selectedToDate = picked;
        DateTime parseDate = DateTime.parse(_selectedToDate.toString());
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        String formatted = formatter.format(parseDate);

        _applyTODateController.text = formatted.toString();
      });
    }
  }
}

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: adminePrimayColor,
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: screenSize.width / 2,
              child: Row(
                children: [
                  IconButtonBackWidget(color: cWhite),
                  SizedBox(width: 250.w),
                  Text(
                    "Exam Notification",
                    style: TextStyle(fontSize: 20.h, color: cWhite),
                  )
                ],
              )),
          Container(
            color: cWhite,
            height: 60.h,
            width: screenSize.width / 4,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 18.h, bottom: 10.h),
              child: Text(

                "School level Exams",
                style: TextStyle(color: Colors.black, fontSize: 25.h),
              ),
            ),
          ),
          Container(
            color: cWhite,
            height: 60.h,
            width: screenSize.width / 4,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 18.h, bottom: 10.h),
              child: Text(
                "Public Level Exams",
                 style: TextStyle(fontSize: 25.h),
              ),
            ),
          )
        ],
      ),
    );
  }
}
