import 'package:dujo_kerala_website/controller/teacher_controller/teacher_controller.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class AddTeacherSectionScreen extends StatelessWidget {
  final String schoolID;
  final TeacherController teacherController = Get.put(TeacherController());

  AddTeacherSectionScreen({super.key, required this.schoolID});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: screenSize.height,
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
                          'Hi ! Admin \n   Create Teacher  Profile',
                          style: ralewayStyle.copyWith(
                            fontSize: 40.0,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: screenSize.width / 2,
                          child: LottieBuilder.network(
                              'https://assets5.lottiefiles.com/packages/lf20_ikvz7qhc.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Column(children: [
                CreateTeacherTextInputFieldWidget(
                  labelText: "Name",
                  textEditingController: teacherController.nameController,
                  validator: checkFieldEmpty,
                ),
                CreateTeacherTextInputFieldWidget(
                  labelText: "Email",
                  textEditingController: teacherController.emailIDController,
                  validator: checkFieldEmailIsValid,
                ),
                CreateTeacherTextInputFieldWidget(
                  labelText: "Phone Number",
                  textEditingController: teacherController.phoneNumber,
                  validator: checkFieldPhoneNumberIsValid,
                ),
                CreateTeacherTextInputFieldWidget(
                  labelText: "Employee ID",
                  textEditingController: teacherController.employeeID,
                  validator: checkFieldEmpty,
                ),
                Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF26A69A),
                              Color.fromARGB(255, 9, 49, 45),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            final teacher = TeacherModel(
                                docid: "",
                                teacherName:
                                    teacherController.nameController.text,
                                employeeID:
                                    teacherController.emailIDController.text,
                                createdAt: DateTime.now().toString(),
                                teacherPhNo: teacherController.phoneNumber.text,
                                teacherEmail:
                                    teacherController.emailIDController.text,
                                altPhoneNo: '',
                                district: '',
                                gender: '',
                                houseName: '',
                                houseNumber: '',
                                place: '',
                                userRole: '',
                                imageId: '',
                                imageUrl: '');
                            teacherController.createNewTeacher(teacher);
                          }
                        },
                        child: const Text('Add Teacher'),
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTeacherTextInputFieldWidget extends StatelessWidget {
  const CreateTeacherTextInputFieldWidget({
    super.key,
    required this.labelText,
    required this.textEditingController,
    this.validator,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 80, bottom: 10, left: 100, right: 100),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
