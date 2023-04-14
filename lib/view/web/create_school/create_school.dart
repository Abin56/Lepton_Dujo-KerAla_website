import 'dart:math';
import 'package:country_state_city_picker/country_state_city_picker.dart';
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
                      height: 500,
                      width: 1000,
                      child: LottieBuilder.asset(
                          "assets/images/22462-campus-library-school-building-maison-mocca-animation.json")),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: size.height * 1 / 1,
              width: size.width * 1 / 2,
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width / 20,
                    right: size.width / 50,
                    top: size.width / 50),
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  //height: size.width * 1 / 2.5,
                  //  width: size.width * 1 / 4,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: TextField(
                        controller: schoolNameController,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'School Name',
                            icon: const Icon(Icons.school_sharp,
                                color: Color.fromARGB(255, 9, 11, 161)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: TextField(
                        controller: placeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Place',
                          icon: const Icon(Icons.place_outlined,
                              color: Color.fromARGB(255, 9, 11, 161)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: TextField(
                        controller: adminUserNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Admin Username',
                          icon: const Icon(Icons.admin_panel_settings_outlined,
                              color: Color.fromARGB(255, 9, 11, 161)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: TextField(
                        controller: adminPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Password',
                          icon: const Icon(Icons.lock_outline_sharp,
                              color: Color.fromARGB(255, 9, 11, 161)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Email',
                          icon: const Icon(Icons.mail_outline,
                              color: Color.fromARGB(255, 9, 11, 161)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Phone Number',
                          icon: const Icon(Icons.phone,
                              color: Color.fromARGB(255, 9, 11, 161)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, top: 15, bottom: 15),
                      child: TextField(
                        controller: designationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Designation',
                          icon: const Icon(Icons.person_pin_rounded,
                              color: Color.fromARGB(255, 9, 11, 161)),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: size.width * 1 / 25,
                        width: size.width * 1 / 25,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
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

                            AddRequestedSchoolsToFirebase()
                                .addRequestedSchools(schoolDetails, context);
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
          ],
        ),
      ]),
    );
  }
}
