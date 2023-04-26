import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../model/create_classModel/addStudent_model.dart';
import '../../../widgets/drop_DownList/get_batchYear.dart';
import '../../../widgets/drop_DownList/get_classes.dart';

class AddStudentFromClassTeacher extends StatefulWidget {
  var schoolID;
  var teacherIDE;

  AddStudentFromClassTeacher(
      {this.schoolID, required this.teacherIDE, super.key});

  @override
  State<AddStudentFromClassTeacher> createState() =>
      _AddStudentFromClassTeacherState();
}

DateTime? _selectedDateForApplyDate;
DateTime? _selectedToDate;

class _AddStudentFromClassTeacherState
    extends State<AddStudentFromClassTeacher> {
  TextEditingController studentNameController = TextEditingController();

  TextEditingController parentPhNoController = TextEditingController();

  TextEditingController parentNameController = TextEditingController();

  TextEditingController addmissionNumberController = TextEditingController();

  TextEditingController studentemailController = TextEditingController();
  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
 final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    log("teacherEmail ID??????${widget.teacherIDE}");
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
     // backgroundColor: Color.fromARGB(255, 27, 95, 88),
      
       body: ListView(children: [
        Row(
          children: [
           
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                        Text(
                          'Hi Admin ',
                          style: ralewayStyle.copyWith(
                            fontSize: 48.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: size.width / 20,
                        ),
                        Text(
                          'Add Your Student',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                  
                        SizedBox(
                          height: size.width / 5,
                          width: size.width / 2,
                          child: LottieBuilder.network(
                              'https://assets8.lottiefiles.com/packages/lf20_ehs7xawx.json'),
                        )
                        //       SizedBox(
                        // height: 400,
                        // width: 600,
                        // child: LottieBuilder.asset(
                        //     "assets/images/")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(

                width: size.width * 1 / 2,
                height: size.height,
                child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            color: Colors.white,
            height: size.width * 1 / 2.5,
            width: size.width * 1 / 4,
            child: Form(
                 key: formKey,
              child: ListView(children: [
               
                Padding(
                    padding: EdgeInsets.all(15),
                    child: GetClassesListDropDownButton(
                      schoolID: Get.find<AdminLoginScreenController>().schoolID,
                      teacherID: widget.teacherIDE,
                    )),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GetBatchYearListDropDownButton(
                            schoolID: widget.schoolID,
                          ),
                          TextButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Add BatchYear'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    applynewBatchYearContoller,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectDate(context),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'DD-MM-YYYY',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const Icon(
                                                Icons.arrow_downward_outlined),
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    selectedToDaterContoller,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectToDate(context),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'To',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('create'),
                                          onPressed: () async {
                                             bool? result =
                                      formKey.currentState?.validate();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('create'),
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection(
                                                    "SchoolListCollection")
                                                .doc(widget.schoolID)
                                                .collection("BatchYear")
                                                .doc(
                                                    '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                                                .set({
                                              'id':
                                                  '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                                            }).then((value) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Add New Batch Year"))
                        ],
                      ),
                    )),

                     Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: studentNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: checkFieldEmailIsValid,
                    controller: studentemailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Student email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: checkFieldPhoneNumberIsValid,
                    controller: parentPhNoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Guardian Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: checkFieldEmpty,
                    controller: addmissionNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'AdmissionNumber',
                    ),
                  ),
                ),
                
                Expanded(
                  child: 
                  Padding(
                    padding:  EdgeInsets.only(left:30.w,right: 30.w ),
                    child: Container(
                      height: 60 .h,
                      width: 300.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 3, 39, 68),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                           bool? result =
                                        formKey.currentState?.validate();
                          final studentDetails = AddStudentModel(
                    
                        
                              studentName: studentNameController.text.trim(),
                              whichClass: classesListValue!["id"],
                              admissionNumber:
                                  addmissionNumberController.text.trim(),
                        
                              parentPhoneNumber: parentPhNoController.text.trim(),
                              createDate: DateTime.now().toString());
                              
                          await AddStudentsToFireBase()
                              .addStudentsController(
                                  studentDetails,
                                  context,
                                  widget.schoolID,
                                  classesListValue!["id"],
                             
                                  schoolBatchYearListValue['id'])
                              .then((value) async {
                            studentNameController.clear();
                              
                            parentPhNoController.clear();
                              
                            parentNameController.clear();
                              
                            addmissionNumberController.clear();
                              
                            studentemailController.clear();
                            applynewBatchYearContoller.clear();
                            selectedToDaterContoller.clear();
                          });
                        },
                        child: Text("Add Student"),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),)
          ],
        ),
      ]),

      
      
      
      
      
      
      
      
      
      
      








    );
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
        final DateFormat formatter = DateFormat('yyyy-MMMM');
        String formatted = formatter.format(parseDate);

        applynewBatchYearContoller.text = formatted.toString();
        log(formatted.toString());
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
        final DateFormat formatter = DateFormat('yyyy-MMMM');
        String formatted = formatter.format(parseDate);

        selectedToDaterContoller.text = formatted.toString();
        log(formatted.toString());
      });
    }
  }
}
