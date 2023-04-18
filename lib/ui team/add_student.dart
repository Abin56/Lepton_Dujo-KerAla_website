import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/create_classModel/addStudent_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/get_batchYear.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/get_classes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class AddStudentTea extends StatefulWidget {
  var schoolID;
  var teacherIDE;

  AddStudentTea({this.schoolID, required this.teacherIDE, super.key});

  @override
  State<AddStudentTea> createState() => _AddStudentTeaState();
}

DateTime? _selectedDateForApplyDate;
DateTime? _selectedToDate;

class _AddStudentTeaState extends State<AddStudentTea> {
  TextEditingController studentNameController = TextEditingController();

  TextEditingController parentPhNoController = TextEditingController();

  TextEditingController parentNameController = TextEditingController();

  TextEditingController addmissionNumberController = TextEditingController();

  TextEditingController studentemailController = TextEditingController();
  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("teacherEmail ID??????${widget.teacherIDE}");
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('ADD STUDENT'),
       leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               icon:Icon(Icons.arrow_back_ios), 
               //replace with our own icon data.
            ),
      backgroundColor: adminePrimayColor),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
                height: screenSize.height * 1.1,
                width: screenSize.width * 1 / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi ! Admin ',
                      style: ralewayStyle.copyWith(
                        fontSize: 48.0,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: screenSize.height/15,),
                     Text(
                      ' ADD STUDENTS',
                      style: ralewayStyle.copyWith(
                        fontSize: 25.0,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: screenSize.height /10,),
                    SizedBox(
                      height: screenSize.height / 2,
                      width: screenSize.width / 3,
                      child: LottieBuilder.network(
                          'https://assets10.lottiefiles.com/packages/lf20_uqsv3ztj.json'),
                    )
                  ],
                ),
                color: adminePrimayColor),
            Container(
              color: Colors.white,
              height: screenSize.height * 1.1,
              width: screenSize.width * 1 / 2,
              child: ListView(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top:screenSize.height/10, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/20),
                    child: GetClassesListDropDownButton(
                      schoolID: widget.schoolID,
                      teacherID: widget.teacherIDE,
                    )),

                    Padding(
                    padding: EdgeInsets.only(
                        top:screenSize.height/40, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
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
                                      title: const Text('Add Batch Year'),
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
                                                .collection("Batch Year")
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
                  padding:
                      EdgeInsets.only(top: screenSize.height/40, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
                  child: TextField(                  
                    controller: studentNameController,
                    decoration: InputDecoration(                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),                    
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                      // icon: new Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: screenSize.height/40,left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
                  child: TextField(
                    controller: studentemailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      labelText: 'Student email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: screenSize.height/40, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
                  child: TextField(
                    controller: parentPhNoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      labelText: 'Guardian Phone Number',
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: screenSize.height/40, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
                  child: TextField(
                    controller: addmissionNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      labelText: 'AdmissionNumber',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top:screenSize.height/40, left: screenSize.width/6, right: screenSize.width/6,bottom: 30),
                  child: Container(
                    height:screenSize.height/15,
                   // width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 71, 157),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        final studentDetails = AddStudentsModel(
                            studentemailController:
                                studentemailController.text.trim(),
                            id: studentemailController.text.trim(),
                            studentName: studentNameController.text.trim(),
                            wclass: classesListValue!["id"],
                            admissionNumber:
                                addmissionNumberController.text.trim(),
                            parentName: '',
                            parentPhNo: parentPhNoController.text.trim(),
                            joinDate: DateTime.now().toString());
                
                        await AddStudentsToFireBase().addStudentsController(
                            studentDetails,
                            context,
                            widget.schoolID,
                            classesListValue!["id"],
                            addmissionNumberController.text.trim(),
                            schoolBatchYearListValue['id']);
                      },
                      child: Text("Add Student",),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
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
