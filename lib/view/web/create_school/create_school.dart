import 'dart:math';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../model/schools_to_be_verified/schools_to_be_verified_create_list.dart';
import '../../colors/colors.dart';
import '../../fonts/fonts.dart';

class SchoolProfile extends StatefulWidget {
  SchoolProfile({super.key});

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  TextEditingController schoolNameController = TextEditingController();

  TextEditingController schoolIDController = TextEditingController();

  TextEditingController placeController = TextEditingController();

  TextEditingController adminUserNameController = TextEditingController();

  TextEditingController adminPasswordController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController designationController = TextEditingController();

  String countryValue = '';
  String stateValue = '';
  String cityValue = '';
  String schoolID = '';
  creatSchoollID() async {
    var random = Random();
    String roomName = (random.nextInt(10000) + 10000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    schoolID = roomName;
  }

  @override
  void initState() {
    creatSchoollID();
  }

    final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(
        title: const Text('School Profile'),
        backgroundColor: adminePrimayColor,
      ),

      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi ! DuJo Welcomes you ',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text(
                    'Create New School',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // SizedBox(
                  //   height: 300,
                  //   width:size.width/2,
                  //   child: LottieBuilder.network(
                  //       'https://lottiefiles.com/22462-campus-library-school-building-maison-mocca-animation'),
                  // ).
                  SizedBox(
                      height: size.width/3,
                      width: 800,
                      child: LottieBuilder.asset(
                          "assets/images/22462-campus-library-school-building-maison-mocca-animation.json")),
                ],
              ),
            ),
             SizedBox(
            width:size.width*1/2 ,
            height: size.height,
              child: SingleChildScrollView(
                  child: Form
                  ( key: formKey,
                    child: Padding(
                    padding:  EdgeInsets.only(left: size.width/10,right:  size.width/10),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SelectState(
                          onCountryChanged: (value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged: (value) {
                            setState(() {
                              stateValue = value;
                            });
                          },
                          onCityChanged: (value) {
                            setState(() {
                              cityValue = value;
                            });
                          },
                        ),
                      ),
                      
                      SchoolTextFormFieldWidget(textEditingController: schoolNameController,
                      function: checkFieldEmpty,
                      labelText: 'School Name',
                       icon: Icons.phone,),
                  
                  
                      
                      SchoolTextFormFieldWidget(textEditingController: placeController,
                      function: checkFieldEmpty,
                      labelText: 'Place',
                       icon: Icons.place_outlined,),
                  
                  
                                  
                      
                      SchoolTextFormFieldWidget(textEditingController: adminUserNameController,
                      function: checkFieldEmpty,
                      labelText: 'Admin Username',
                       icon: Icons.admin_panel_settings_outlined,),
                  
                  
                  
                                  
                      
                      SchoolTextFormFieldWidget(textEditingController: adminPasswordController,
                      function: checkFieldPasswordIsValid,
                      labelText: 'Password',
                       icon: Icons.lock_outline_sharp,),
                  
                  
                  
                      
                  
                      
                      SchoolTextFormFieldWidget(textEditingController: emailController,
                      function: checkFieldEmailIsValid,
                      labelText: 'Email',
                       icon: Icons.mail_outline,),
                  
                  
                  
                                   
                      
                      SchoolTextFormFieldWidget(textEditingController: phoneNumberController,
                      function: checkFieldPhoneNumberIsValid,
                      labelText: 'Phone Number',
                       icon: Icons.phone,),
                  
                  
                  
                  
                  
                      SchoolTextFormFieldWidget(textEditingController: designationController,
                      function: checkFieldEmpty,
                      labelText: 'Designation',
                       icon: Icons.person_4,),
                  
                  
                      const CircleAvatar(
                        radius: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
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
                               bool? result = formKey.currentState?.validate();
                              final schoolDetails = SchoolsToBeVerified(
                                  schoolName: schoolNameController.text,
                                  schoolID:
                                      schoolNameController.text.substring(0, 5) +
                                          cityValue.substring(0, 5) +
                                          schoolID,
                                  id: schoolNameController.text.substring(0, 5) +
                                      cityValue.substring(0, 5) +
                                      schoolID,
                                  district: cityValue.toString(),
                                  place: placeController.text.trim(),
                                  adminUserName:
                                      adminUserNameController.text.trim(),
                                  password: adminPasswordController.text.trim(),
                                  phoneNumber: phoneNumberController.text,
                                  email: emailController.text,
                                  postedDate: DateTime.now().toString(),
                                  verified: false);
                  
                              print(await AddRequestedSchoolsToFirebase()
                                  .checkSchoolIsCreated(schoolNameController.text,
                                      placeController.text)
                                  .toString());
                  
                              if (await AddRequestedSchoolsToFirebase()
                                  .checkSchoolIsCreated(schoolNameController.text,
                                      placeController.text)) {
                                showToast(msg: 'School Is Already Created');
                              } else {
                                if (context.mounted) {}
                                AddRequestedSchoolsToFirebase()
                                    .addRequestedSchools(schoolDetails, context);
                              }
                  
                              // final schoolDetails1 = CreatedSchoolAddModel(
                              //     id: adminUserNameController.text.trim() + schoolID,
                              //     schoolName: schoolNameController.text.trim(),
                              //     schoolID: adminUserNameController.text.trim() + schoolID,
                              //     district: cityValue.toString(),
                              //     place: placeController.text.trim(),
                              //     adminUserName: adminUserNameController.text.trim(),
                              //     password: adminPasswordController.text.trim(),
                              //     postedDate: DateTime.now().toString());
                  
                              // CreateSchoolAddToFireBase()
                              //     .createSchoolController(schoolDetails1, context);
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
    ]  ),
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
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
    IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: function,
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon:  Icon(icon,
            color: Color.fromARGB(221, 28, 9, 110),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
