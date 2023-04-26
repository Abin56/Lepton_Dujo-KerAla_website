import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../model/guardian/guardian_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';


class AddGuardian extends StatelessWidget {
  AddGuardian({super.key, required this.schoolId});
  String schoolId;
 final formKey = GlobalKey<FormState>();
  TextEditingController guardianNameController = TextEditingController();

  TextEditingController guardianEmailController = TextEditingController();

  TextEditingController guardianPhoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor: cWhite,iconTheme: IconThemeData(color: cBlack)),
      body: Row(
        children: <Widget>[
          //left section

          SizedBox(
            width: size.width / 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ADD NEW GUARDIAN',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH30,
                
                
                        AddGuardianWidget(function: checkFieldEmpty,
                        labelText: 'Guardian Name',
                        textEditingController: guardianNameController ,),
                        sizedBoxH30,
                
                        AddGuardianWidget(function:checkFieldPhoneNumberIsValid ,
                        labelText: 'Guardian PhoneNumber',
                        textEditingController: guardianPhoneNoController,),
                        sizedBoxH30,
                
                        AddGuardianWidget(function: checkFieldEmailIsValid,
                        labelText: 'Guardian email',
                        textEditingController:guardianEmailController ,),
                        sizedBoxH30,
                
                        SizedBox(
                          width: 350.w,
                          height: 70.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  adminePrimayColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              bool? result =
                                          formKey.currentState?.validate();
                              final guardianDetails = GuardianModel(
                                joinDate: DateTime.now().toString(),
                                guardianEmail:
                                    guardianEmailController.text.trim(),
                                guardianPhoneNumber:
                                    guardianPhoneNoController.text.trim(),
                                id: guardianEmailController.text,
                                guardianName: guardianNameController.text.trim(),
                              );
                              if (context.mounted) {
                                CreateGuardiansAddToFireBase()
                                    .createSchoolController(guardianDetails,
                                        context, schoolId);
                              }
                            },
                            child: const Text("Add Guardian"),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 2,
            height: size.height,
            child: Image.asset(
              'assets/images/guardian.jpg',
              width: size.width / 2,
              fit: BoxFit.fill,
            ),
          ),
          //right section
        ],
      ),
    );
  }
}

class AddGuardianWidget extends StatelessWidget {
   AddGuardianWidget({
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
            borderRadius:
                BorderRadius.all(Radius.circular(15))),
       labelText: labelText,
      ),
    );
  }
}