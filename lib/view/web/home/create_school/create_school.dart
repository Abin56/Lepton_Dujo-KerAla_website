// ignore_for_file: prefer_const_constructors

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/tarif/lepton_tarif_screen.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/add_Newschool/add_new_schhol.dart';
import '../../../colors/colors.dart';
import '../../../fonts/fonts.dart';

class SchoolProfile extends StatefulWidget {
  const SchoolProfile({super.key});
  static const String route = '/createSchool';

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  AddNewSchoolController addNewSchoolController =
      Get.put(AddNewSchoolController());

  final _formKey = GlobalKey<FormState>();

  late int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0; // Set initial selected radio button
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 27, 95, 88),

      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: 730.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButtonBackWidget(
                      color: cWhite,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ! DuJo  ',
                        style: ralewayStyle.copyWith(
                          fontSize: 48.0.w,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        ' Welcomes you ',
                        style: ralewayStyle.copyWith(
                          fontSize: 35.0.w,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text(
                    'Create New School',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0.w,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                        height: size.width / 3,
                        width: 700.w,
                        child: LeptonTarifScreen()),// leopton tarif page >>>>>>>>>>>>>>>>>>
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 800.w,
              height: size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width / 10, right: size.width / 10),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SelectState(
                          onCountryChanged: (value) {
                            addNewSchoolController.countryValue.value = value;
                          },
                          onStateChanged: (value) {
                            addNewSchoolController.stateValue.value = value;
                          },
                          onCityChanged: (value) {
                            addNewSchoolController.cityValue.value = value;
                          },
                        ),
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.schoolNameController,
                        function: checkFieldEmpty,
                        labelText: 'School Name',
                        icon: Icons.school,
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.schoolCodeController,
                        function: checkFieldEmpty,
                        labelText: 'School Code',
                        icon: Icons.school_outlined,
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.placeController,
                        function: checkFieldEmpty,
                        labelText: 'Place',
                        icon: Icons.place_outlined,
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.adminUserNameController,
                        function: checkFieldEmpty,
                        labelText: 'Admin Username',
                        icon: Icons.admin_panel_settings_outlined,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          obscureText: true,
                          validator: checkFieldPasswordIsValid,
                          controller:
                              addNewSchoolController.adminPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            icon: Icon(
                              Icons.lock_outline_sharp,
                              color: const Color.fromARGB(221, 28, 9, 110),
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          obscureText: true,
                          validator: (d) {
                            if (addNewSchoolController
                                    .adminPasswordController.text ==
                                addNewSchoolController
                                    .conformpassController.text) {
                              return null;
                            } else {
                              return 'Check Password';
                            }
                          },
                          controller:
                              addNewSchoolController.conformpassController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            icon: Icon(
                              Icons.lock_outline_sharp,
                              color: const Color.fromARGB(221, 28, 9, 110),
                            ),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.emailController,
                        function: checkFieldEmailIsValid,
                        labelText: 'Email',
                        icon: Icons.mail_outline,
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.phoneNumberController,
                        function: checkFieldPhoneNumberIsValid,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                      ),
                      SchoolTextFormFieldWidget(
                        textEditingController:
                            addNewSchoolController.designationController,
                        function: checkFieldEmpty,
                        labelText: 'Designation',
                        icon: Icons.person_4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: size.width * 1 / 25,
                          width: size.width * 1 / 6,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 3, 39, 68),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await addNewSchoolController
                                    .addNewSchool(context);
                              }
                            },
                            child: const Text("Create"),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class SchoolTextFormFieldWidget extends StatelessWidget {
  SchoolTextFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.function,
    required this.icon,
    this.obscureText,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
  IconData icon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        // obscureText: obscureText,
        validator: function,
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon: Icon(
            icon,
            color: const Color.fromARGB(221, 28, 9, 110),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}

String? checkFieldNumIsValid(String? fieldContent) {
  if (fieldContent == null || fieldContent.isEmpty) {
    return 'Field is mandatory';
  }
  if (RegExp(r'[^0-9]').hasMatch(fieldContent)) {
    return null;
  }
  return null;
}