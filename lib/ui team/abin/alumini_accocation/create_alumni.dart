import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../view/colors/colors.dart';



class CreateAlumni extends StatelessWidget {
  const CreateAlumni({super.key});

  Stream<QuerySnapshot<Map<String, dynamic>>> getData(){
    return FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection('BatchYear').doc(Get.find<GetFireBaseData>().bYear.value).collection('AlumniAssociations').snapshots();
  } 

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
  //       appBar: AppBar(title: Text('Alumni Creation'),
  //        leading: IconButton(
  //   icon: Icon(Icons.arrow_back, color: cWhite),
  //   onPressed: () => Navigator.of(context).pop(),
  // ), 
  //       backgroundColor: adminePrimayColor,),
         body:  ListView(
            children:[
               Row(
                 children: [ 
                  Container(
                         color:adminePrimayColor,
                         height: size.height,
                        width: size.width * 1 / 2,
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButtonBackWidget(color: cWhite,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hi Admin ',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 48.0,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: size.width/20,),
                                   Text(
                                    'Welcome  ',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 25.0,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                              
                                  SizedBox(
                                    height: size.width/5,
                                    width:size.width/2,
                                    child: LottieBuilder.network(
                                        'https://assets10.lottiefiles.com/packages/lf20_xmkgn4jj.json'),
                                  )
                        //       SizedBox(
                        // height: 400,
                        // width: 600,
                        // child: LottieBuilder.asset(
                        //     "assets/images/")),
                                ],
                              ),
                            ],
                          ),
                  ),
                          
                              
                        Padding(
                          padding:  EdgeInsets.only(left: size.width/8),
                          child: Container(
                            height: size.height * 1 /1 ,
                             width: size.width * 1 / 4,
                            child: Padding(
                              padding:  EdgeInsets.only(top: size.width/22),
                              child: Container(
                                          color: Colors.white,
                                         // height: size.width * 1 / 2,
                                          width: size.width * 1 / 4,
                child: Form
                (key: formKey,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: 
                      CreateAlumniTextFormWidget(
                        labelText: 'Name', function: checkFieldEmpty
                       ),
                     
                    ),
                    
                    Padding(
                      padding: EdgeInsets.all(15),
                      child:CreateAlumniTextFormWidget(
                        function:checkFieldEmpty ,
                        labelText: 'Designaiton',)
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: CreateAlumniTextFormWidget(
                        function:checkFieldEmpty ,
                        labelText: 'Place',)
                     
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child:
                      CreateAlumniTextFormWidget(
                        function:checkFieldEmpty ,
                        labelText: 'Alumni ID',)
                      
                    ),
                   
                    SizedBox(height: 30,),
                  Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 1 / 20,
                                right: size.width * 1 / 20),
                            child: Container(
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
                                  bool? result =
                                      formKey.currentState?.validate();
                                      if (result == true) {
                                    // check if form validation passed
                                    showToast(msg: 'Alumni successfully created ');
                                  }
                
                                },
                                child: const Text('Create'),
                              ),
                            )),
                    
                  ]),
                ),
              ),
                            
                           
                     ),
                   ),
                        )
                 ],
               ),
             ]
           ),                
      ),
    );
  }
}

final formKey = GlobalKey<FormState>();

class CreateAlumniTextFormWidget extends StatelessWidget {
  CreateAlumniTextFormWidget({
    super.key,
    required this.labelText,
    // required this.textEditingController,
    required this.function,
    
  });
// final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: function,
        // controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        
          labelText: labelText,
        ),
      ),
    );
  }
}
