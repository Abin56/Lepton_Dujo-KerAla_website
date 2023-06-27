import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/controller/_addParent&Guardian/guardian_Controller.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class AddGuardian extends StatelessWidget {
  GuardianController guardianController = Get.put(GuardianController());
  String teacherIDE;
  AddGuardian({super.key, required this.schoolId, required this.teacherIDE});
  String schoolId;

  String studentID = '';

  final formKey = GlobalKey<FormState>();

  TextEditingController guardianNameController = TextEditingController();

  TextEditingController guardianEmailController = TextEditingController();

  TextEditingController guardianPhoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
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
                        'Hi ! Class teacher ',
                        style: ralewayStyle.copyWith(
                          fontSize: 42.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      sizedBoxH20,
                      Text(
                        'Add New Guardians',
                        style: ralewayStyle.copyWith(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.width / 3,
                        width: screenSize.width / 2,
                        child: LottieBuilder.network(
                            'https://assets7.lottiefiles.com/packages/lf20_uwh9uhdt.json'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //right section

          Obx(
            () => guardianController.isLoading.value
                ? circularProgressIndicator
                : SizedBox(
                    width: size.width / 2,
                    height: size.height * 1.4,
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
                                  guardianController.getAllStudent(
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
                                    labelText: "Select Student"),
                              ),
                            ),
                            sizedBoxH30,
                            AddGuardianWidget(
                              function: checkFieldEmpty,
                              labelText: 'Guardian name',
                              textEditingController: guardianNameController,
                            ),
                            sizedBoxH30,
                            AddGuardianWidget(
                              function: checkFieldPhoneNumberIsValid,
                              labelText: 'Guardian phone number',
                              textEditingController: guardianPhoneNoController,
                            ),
                            sizedBoxH30,
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 50.w, bottom: 10.w, top: 30.w),
                              child: SizedBox(
                                width: 250.w,
                                height: 60.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: adminePrimayColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      guardianController.addGuardian(
                                          guardianNameController,
                                          guardianPhoneNoController,
                                          studentID,
                                          Get.find<GetFireBaseData>()
                                              .getTeacherClassRole
                                              .value);
                                    }
                                  },
                                  child: const Text("Add Guardian"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class AddGuardianWidget extends StatelessWidget {
  const AddGuardianWidget({
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
