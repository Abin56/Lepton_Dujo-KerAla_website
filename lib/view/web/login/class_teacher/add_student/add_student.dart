import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("teacherEmail ID??????${widget.teacherIDE}");
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('ADD STUDENT')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 2.5,
              width: screenSize.width * 1 / 4,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: studentNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: GetClassesListDropDownButton(
                      schoolID: Get.find<AdminLoginScreenController>().schoolID,
                      teacherID: widget.teacherIDE,
                    )),
                Padding(
                    padding: const EdgeInsets.all(15),
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
                              child: const Text("Add New Batch Year"))
                        ],
                      ),
                    )),
            
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: parentPhNoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Parent Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: addmissionNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'AdmissionNumber',
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
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
                          addmissionNumberController.text.trim(),
                        )
                            .then((value) async {
                          studentNameController.clear();

                          parentPhNoController.clear();

                          parentNameController.clear();

                          addmissionNumberController.clear();

                          applynewBatchYearContoller.clear();
                          selectedToDaterContoller.clear();
                        });
                      },
                      child: const Text("Add Student"),
                    ),
                  ),
                ),
              ]),
            ),
          ),
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
