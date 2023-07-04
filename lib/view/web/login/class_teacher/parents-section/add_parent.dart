// ignore_for_file: sort_child_properties_last
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/controller/_addParent&Guardian/parent_Controller.dart';
import 'package:dujo_kerala_website/model/create_classModel/add_student_model.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';
import '../../../../fonts/fonts.dart';
import '../../../widgets/Iconbackbutton.dart';

class AddParent extends StatelessWidget {
  ParentController parentController = Get.put(ParentController());
  String teacherIDE;
  AddParent({super.key, required this.schoolID, required this.teacherIDE});
  String schoolID;

  String studentID = "";

  TextEditingController parentNameController = TextEditingController();

  TextEditingController parentemailController = TextEditingController();

  TextEditingController parentPhoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(color: cWhite),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ! Class teacher ',
                          style: ralewayStyle.copyWith(
                            fontSize: 42.0.w,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        sizedBoxH20,
                        GoogleMonstserratWidgets(
                          text: 'Add New Parent',
                          fontsize: 26.0.w,
                          color: cWhite,
                        ),
                        sizedBoxH20,
                        SizedBox(
                          height: 300,
                          width: size.width / 2,
                          child: LottieBuilder.network(
                              'https://assets1.lottiefiles.com/temp/lf20_zi0rIM.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              color: const Color.fromARGB(255, 6, 71, 157),
            ),
            Obx(
              () => parentController.isLoading.value
                  ? circularProgressIndicator
                  : SizedBox(
                      width: size.width / 2,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Form(
                            key: formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  sizedBoxH30,
                                  DropdownSearch<AddStudentModel>(
                                    asyncItems: (String filter) =>
                                        parentController.getAllStudent(
                                      Get.find<GetFireBaseData>()
                                          .getTeacherClassRole
                                          .value,
                                    ),
                                    itemAsString: (AddStudentModel u) =>
                                        u.studentName ?? "",
                                    onChanged: (AddStudentModel? data) =>
                                        studentID = data?.docid ?? "",
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          labelText: "Select Student",border: OutlineInputBorder()),
                                    ),
                                  ),
                                  sizedBoxH30,
                                  sizedBoxH30,
                                  AddParentWidget(
                                      function: checkFieldEmpty,
                                      labelText: 'Parent name',
                                      textEditingController:
                                          parentNameController),
                                  sizedBoxH30,
                                  AddParentWidget(
                                      function: checkFieldPhoneNumberIsValid,
                                      labelText: 'Parent phone number',
                                      textEditingController:
                                          parentPhoneNumberController),
                                  sizedBoxH30,
                                  SizedBox(
                                    width: 250.w,
                                    height: 60.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: adminePrimayColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          await parentController
                                              .addParent(
                                                  parentNameController,
                                                  parentPhoneNumberController,
                                                  studentID,
                                                  Get.find<GetFireBaseData>()
                                                      .getTeacherClassRole
                                                      .value)
                                              .then((value) => studentID = "");
                                        }
                                      },
                                      child: const Text("Add Parent"),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class AddParentWidget extends StatelessWidget {
  const AddParentWidget({
    super.key,
    required this.textEditingController,
    required this.function,
    required this.labelText,
  });

  final TextEditingController textEditingController;
  final String? Function(String? fieldContent) function;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: function,
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelText: labelText,
      ),
    );
  }
}
