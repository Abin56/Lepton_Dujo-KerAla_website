import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../model/admin_models/nonteaching_staffs_model/non_teaching_staff_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';

class NonTeachingLogin extends StatefulWidget {
  NonTeachingLogin({super.key, required this.schoolID});

  String schoolID;

  @override
  State<NonTeachingLogin> createState() => _NonTeachingLoginState();
}

TextEditingController staffNameController = TextEditingController();
TextEditingController employeeIDController = TextEditingController();
TextEditingController designationController = TextEditingController();
TextEditingController houseNameController = TextEditingController();
TextEditingController houseNoConttroller = TextEditingController();
TextEditingController streetNameController = TextEditingController();
TextEditingController placeController = TextEditingController();
TextEditingController districtController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class _NonTeachingLoginState extends State<NonTeachingLogin> {
  NonTeachingStaffModel? modell;
  bool loadingStatus = false;

  Future<void> addNonTeachingStaffToFirebase() async {
    await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('NonTeachingStaffs')
        .doc(modell!.employeeID)
        .set(modell!.toJson());
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(
        title: Text('Non Teaching Staffs '),
        backgroundColor: adminePrimayColor,
      ),
      body: Row(
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
                  'Hi Admin ',
                  style: ralewayStyle.copyWith(
                    fontSize: 48.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: size.width / 20,
                ),
                Text(
                  'Welcome ',
                  style: ralewayStyle.copyWith(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(
                  height: size.width / 5,
                  width: size.width / 2,
                  child: LottieBuilder.network(
                      'https://assets1.lottiefiles.com/packages/lf20_m2aybuxx.json'),
                )
                //       SizedBox(
                // height: 400,
                // width: 600,
                // child: LottieBuilder.asset(
                //     "assets/images/")),
              ],
            ),
          ),
          SizedBox(
            width:size.width*1/2 ,
            height: size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding:  EdgeInsets.only(left: size.width/10,right:  size.width/10),
                    child: Column(children: [
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'Name',
                        textEditingController: staffNameController,
                        icon: Icons.person_3,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'Employee ID',
                        textEditingController: employeeIDController,
                        icon: Icons.numbers,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'Designation',
                        textEditingController: designationController,
                        icon: Icons.person,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'House Name',
                        textEditingController: houseNameController,
                        icon:Icons.house,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'House Number',
                        textEditingController: houseNoConttroller,
                        icon: Icons.house ,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'Street Name',
                        textEditingController: streetNameController,
                        icon: Icons.location_city ,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'Place',
                        textEditingController: placeController,
                        icon: Icons.location_city,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'District',
                        textEditingController: districtController,
                        icon: Icons.maps_home_work,
                      ),
                      
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'State',
                        textEditingController: stateController,
                        icon: Icons.maps_home_work,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmpty,
                        labelText: 'Pincode',
                        textEditingController: pincodeController,
                        icon:  Icons.pin,
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldEmailIsValid,
                        labelText: 'Email',
                        textEditingController: emailController,
                        icon:  Icons.mail
                      ),
                      NonTeachingStaffTextFormFieldWidget(
                        function: checkFieldPhoneNumberIsValid,
                        labelText: 'Phone Number',
                        textEditingController: phoneNumberController,
                        icon: Icons.phone,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 1 / 20, right: size.width * 1 / 20),
                        child: (loadingStatus == false)
                            ? Container(
                                height: size.width * 1 / 30,
                                width: size.width * 1 / 9,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(14)),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    padding: const EdgeInsets.all(9.0),
                                    textStyle: const TextStyle(fontSize: 17),
                                  ),
                                  onPressed: () async {
                                    bool? result = formKey.currentState?.validate();
                                
                                    if (staffNameController.text != '' &&
                                        employeeIDController.text != '' &&
                                        designationController.text != '' &&
                                        houseNameController.text != '' &&
                                        houseNoConttroller.text != '' &&
                                        streetNameController.text != '' &&
                                        placeController.text != '' &&
                                        districtController.text != '' &&
                                        stateController.text != '' &&
                                        pincodeController.text != '' &&
                                        emailController.text != '' &&
                                        phoneNumberController.text != '') {
                                      setState(() {
                                        loadingStatus = true;
                                      });
                                
                                      modell = NonTeachingStaffModel(
                                          staffName: staffNameController.text,
                                          designation: designationController.text,
                                          employeeID: employeeIDController.text,
                                          houseName: houseNameController.text,
                                          houseNumber: houseNoConttroller.text,
                                          streetName: streetNameController.text,
                                          place: placeController.text,
                                          district: districtController.text,
                                          state: stateController.text,
                                          pincode: pincodeController.text,
                                          email: emailController.text,
                                          phoneNumber: phoneNumberController.text);
                                
                                      addNonTeachingStaffToFirebase().then(
                                          (value) => showToast(
                                              msg:
                                                  'Succesfully added new Non-teaching staff!'));
                                
                                      setState(() {
                                        loadingStatus = false;
                                      });
                                    } else {
                                      showToast(msg: 'Fill all the field details!');
                                      print(validateEmail('hdk'));
                                    }
                                  },
                                  child: const Text('Create'),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ]),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class NonTeachingStaffTextFormFieldWidget extends StatelessWidget {
     NonTeachingStaffTextFormFieldWidget({
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
