import 'package:dujo_kerala_website/controller/_addParent&Guardian/guardian_Controller.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../widgets/drop_DownList/get_students.dart';

class AddGuardian extends StatelessWidget {
  GuardianController guardianController = Get.put(GuardianController());
  String teacherIDE;
  AddGuardian({super.key, required this.schoolId, required this.teacherIDE});
  String schoolId;

  String studentID = '';

  Map<String, dynamic>? classListDropDown;

  final formKey = GlobalKey<FormState>();

  TextEditingController guardianNameController = TextEditingController();

  TextEditingController guardianEmailController = TextEditingController();

  TextEditingController guardianPhoneNoController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
                        'Hi ! Admin ',
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

          SizedBox(
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
                      GetStudentsListDropDownButton(
                          classID: Get.find<GetFireBaseData>()
                              .getTeacherClassRole
                              .value),
                      sizedBoxH30,
                      AddGuardianWidget(
                        function: checkFieldEmpty,
                        labelText: 'Guardian Name',
                        textEditingController: guardianNameController,
                      ),
                      sizedBoxH30,
                      AddGuardianWidget(
                        function: checkFieldPhoneNumberIsValid,
                        labelText: 'Guardian PhoneNumber',
                        textEditingController: guardianPhoneNoController,
                      ),
                      sizedBoxH30,
                      Padding(
                        padding: EdgeInsets.only(left: 50.w),
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
                                    schoolStudentListValue!['docid'],
                                    Get.find<GetFireBaseData>()
                                        .getTeacherClassRole
                                        .value);
                              }
                            },
                            child: const Text("Add Guardian"),
                          ),
                        ),
                      ),
                      sizedBoxH10,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 50.w,
                        ),
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
                              final result = await extractDataFromExcel();
                              if (result != null) {
                                if (result.tables.isNotEmpty) {
                                  Sheet? table =
                                      result.tables[result.tables.keys.first];

                                  List<Data?>? firstRow = table?.rows[1];
                                  guardianNameController.text =
                                      firstRow?[0]?.value.toString() ?? "";
                                  guardianPhoneNoController.text =
                                      firstRow?[1]?.value.toString() ?? "";
                                }
                              }
                            },
                            child: const Text("Upload From Excel"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 80.w),
                        child: SizedBox(
                            height: 60.h,
                            width: 250.w,
                            child: const Text(
                              '(You can only use ".xlxs files")',
                              style: TextStyle(fontSize: 12),
                            )),
                      ),
                    ]),
              ),
            ),
          ),
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
