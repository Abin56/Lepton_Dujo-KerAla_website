// ignore_for_file: sort_child_properties_last
import 'package:dujo_kerala_website/controller/_addParent&Guardian/parent_Controller.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../utils/utils.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';
import '../../../../fonts/fonts.dart';
import '../../../../fonts/google_monstre.dart';
import '../../../widgets/Iconbackbutton.dart';
import '../../../widgets/drop_DownList/get_students.dart';

class AddParent extends StatelessWidget {
  ParentController parentController = Get.put(ParentController());
  String teacherIDE;
  AddParent({super.key, required this.schoolID, required this.teacherIDE});
  String schoolID;

  String studentID = '';

  Map<String, dynamic>? classListDropDown;

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
                        Text('ADD New Parent',
                            style: GoogleFont.headTextStyleBold),
                        sizedBoxH20,
                        SizedBox(
                          height: 300,
                          width: size.width / 2,
                          child: LottieBuilder.network(
                              'https://assets10.lottiefiles.com/packages/lf20_SPA6bgo7nO.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              color: const Color.fromARGB(255, 6, 71, 157),
            ),
            SizedBox(
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
                          GetStudentsListDropDownButton(
                              classID: Get.find<GetFireBaseData>()
                                  .getTeacherClassRole
                                  .value),
                          sizedBoxH30,
                          sizedBoxH30,
                          AddParentWidget(
                              function: checkFieldPhoneNumberIsValid,
                              labelText: 'Parent Phone Number',
                              textEditingController:
                                  parentPhoneNumberController),
                          sizedBoxH30,
                          AddParentWidget(
                              function: checkFieldEmpty,
                              labelText: 'Parent Name',
                              textEditingController: parentNameController),
                          sizedBoxH30,
                          SizedBox(
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
                                  parentController.addParent(
                                      parentNameController,
                                      parentPhoneNumberController,
                                      schoolStudentListValue!['docid'],
                                      Get.find<GetFireBaseData>()
                                          .getTeacherClassRole
                                          .value);
                                }
                              },
                              child: const Text("Add Parent"),
                            ),
                          ),
                          sizedBoxH20,
                          Column(
                            children: [
                              SizedBox(
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
                                        parentNameController.text =
                                            firstRow?[0]?.value.toString() ?? "";
                                        parentPhoneNumberController.text =
                                            firstRow?[1]?.value.toString() ?? "";
                                      }
                                    }
                                  },
                                  child: const Text("Upload Data From Excel"),
                                ),
                              ),
                                 GoogleMonstserratWidgets(text: "Please use .xlsx format", 
                                                    fontsize: 12,fontWeight: FontWeight.w400,color: cred,)
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
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
