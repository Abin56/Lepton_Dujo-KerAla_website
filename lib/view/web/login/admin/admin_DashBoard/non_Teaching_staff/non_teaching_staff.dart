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

  
Future<void>addNonTeachingStaffToFirebase()async{ 

  await FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolID).collection('NonTeachingStaffs').doc(modell!.employeeID).set(modell!.toJson());
 
}


  @override
  Widget build(BuildContext context) {
       final Size size = MediaQuery.of(context).size;
    return  Scaffold(
    //  backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: Text('Non Teaching Staffs '),
      backgroundColor: adminePrimayColor,),
      body: ListView(
          children:[
             Row(
               children: [ 
                Container(
                       color:adminePrimayColor,
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
                            SizedBox(height: size.width/20,),
                             Text(
                              'Welcome ',
                              style: ralewayStyle.copyWith(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                        
                            SizedBox(
                              height: size.width/5,
                              width:size.width/2,
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
                         
                      Padding(
                        padding:  EdgeInsets.only(left: size.width/8),
                        child: Container(
                          height: size.height ,
                           width: size.width * 1 / 4,
                          child: Padding(
                            padding:  EdgeInsets.only(top: size.width/22),
                            child: Container(
              color: Colors.white,
             // height: size.height * 1 /0.5 ,
              width: size.width * 1 / 3,
              child: ListView(
                children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(                 
                    controller: staffNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.person_4_sharp,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Name',
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: employeeIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.indeterminate_check_box,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Employee ID',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: designationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.person,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Designation',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                  Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: houseNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.home,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'House Name',
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: houseNoConttroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.home_filled,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'House Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: streetNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.location_city,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Street Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: placeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.place_sharp,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Place',
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: districtController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.place,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'District',
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: stateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.map_outlined,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'State',
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: pincodeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.password,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Pincode',
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.mail,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Email',
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                  
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.phone,color: Color.fromARGB(221, 28, 9, 110),),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),        
                SizedBox(height: 30,),
                Padding(
                  padding:  EdgeInsets.only(left: size.width * 1 / 20,
                  right: size.width * 1 / 20),
                  child: (loadingStatus == false)?  Container(
                        height: size.width * 1 / 30,
                        width: size.width * 1 / 9,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(14)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(9.0),
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () async{

                            if(staffNameController.text != '' && employeeIDController.text != '' && designationController.text != '' && houseNameController.text != ''&&
                            houseNoConttroller.text != '' && streetNameController.text != '' && placeController.text != '' && districtController.text != '' &&
                             stateController.text != '' &&
                            pincodeController.text != '' && emailController.text != '' && phoneNumberController.text != ''){
                           setState(() {
                             loadingStatus = true;
                           });  

                           

                           modell = await NonTeachingStaffModel(staffName: staffNameController.text, 
                            designation: designationController.text, 
                            employeeID: employeeIDController.text, 
                            houseName: houseNameController.text, 
                            houseNumber: houseNoConttroller.text, streetName: streetNameController.text, place: placeController.text, district: districtController.text, state: stateController.text, pincode: pincodeController.text, email: emailController.text, phoneNumber: phoneNumberController.text); 

                            addNonTeachingStaffToFirebase().then((value) => showToast(msg: 'Succesfully added new Non-teaching staff!'));

      

                            setState(() {
                              loadingStatus = false;
                            });}

                            else{
                              showToast(msg: 'Fill all the field details!');
                              print(validateEmail('hdk'));
                            }

                          },
                          child:const Text('Create'),
                        ),
                      ): Center(child: CircularProgressIndicator(),),
                ),
                
              ]),
            ),
                      ),
                   ),
             ),
               ],
             ),
           ]
         ),                
    );
  }
}