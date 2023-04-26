import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/parent/parent_model.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';


class AddParent extends StatelessWidget {
  AddParent({super.key, required this.schoolID});
  String schoolID;

  TextEditingController parentNameController = TextEditingController();

  TextEditingController parentemailController = TextEditingController();

  TextEditingController parentPhoneNumberController = TextEditingController();
 final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold( appBar: AppBar(backgroundColor: cWhite,iconTheme: IconThemeData(color: cBlack)),
      body: Row(
        children: <Widget>[
          //left section

          SizedBox(
            width: size.width / 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form( key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ADD NEW PARENT',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH30,
                        AddParentWidget(
                          function: checkFieldEmpty ,
                        labelText:'Parent Name' ,
                         textEditingController: parentNameController),
                        sizedBoxH30,
                
                         AddParentWidget(
                          function: checkFieldPhoneNumberIsValid ,
                        labelText:'Parent Phone Number' ,
                         textEditingController: parentPhoneNumberController),
                        sizedBoxH30,
                
                
                         AddParentWidget(
                          function:  checkFieldEmailIsValid,
                        labelText:'Parent email' ,
                         textEditingController: parentemailController),
                        sizedBoxH30,
                        SizedBox(
                          width: 350.w,
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: adminePrimayColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                               bool? result =
                                        formKey.currentState?.validate();
                              final parentDetails = ParentModel(
                                  parentEmail: parentemailController.text.trim(),
                                  parentPhoneNumber:
                                      parentPhoneNumberController.text.trim(),
                                  parentName: parentNameController.text,
                                  createdate: DateTime.now().toString());
                
                              CreateParentsAddToFireBase().createSchoolController(
                                  parentDetails, context, schoolID);
                            },
                            child: const Text("Add Parent"),
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
              'assets/images/parent.jpg',
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

class AddParentWidget extends StatelessWidget {
   AddParentWidget({
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
