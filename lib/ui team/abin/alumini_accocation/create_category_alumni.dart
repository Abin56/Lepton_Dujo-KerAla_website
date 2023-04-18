import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/alumni_association_model/alumni_category_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/pTA_section/dropDownListofPTA_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../model/pTA_section/add_PTAMemberModel.dart';
import '../../../view/fonts/fonts.dart';



// ignore: must_be_immutable
class CreatecategoryAlumni extends StatelessWidget {
  var id;

  CreatecategoryAlumni({this.id, super.key});

  TextEditingController categoryNameController = TextEditingController();

  TextEditingController categoryIDController = TextEditingController(); 

  addCategoryToFirebase(AlumniCategory model, BuildContext context){
    FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection('BatchYear').doc(Get.find<GetFireBaseData>().bYear.value).collection('AlumniAssociations').doc(model.categoryID).set(model.toJson()).then((value) {
      return showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Alumni Category'), 
          content: Text('Category succesfully added!'), 
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(onPressed: (){
                Navigator.pop(context);
              }, color: Colors.blue, child: Text('OK'),),
            )
          ],
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(title: const Text('Create Alumni Category'),
      backgroundColor: adminePrimayColor,),
      body:
       ListView(
          children:[
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
                              'Hi Admin ',
                              style: ralewayStyle.copyWith(
                                fontSize: 48.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: size.width/20,),
                             Text(
                              'Welcome To ',
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
                                  'https://assets1.lottiefiles.com/packages/lf20_vvtkfqbo.json'),
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
                          height: size.height * 1 /1 ,
                           width: size.width * 1 / 4,
                          child: Padding(
                            padding:  EdgeInsets.only(top: size.width/22),
                            child: Container(
                                        color: Colors.white,
                                       // height: size.width * 1 / 2,
                                        width: size.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: categoryNameController,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      icon: const Icon(Icons.person_3,color: Color.fromARGB(255, 13, 5, 122)),
                      labelText: 'Category Name ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                   controller: categoryIDController,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20) 
                      ),
                       icon: const Icon(Icons.people_outline_sharp,color: Color.fromARGB(255, 13, 5, 122)),
                      labelText: 'Category ID',
                    ),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: size.width * 1 / 25,
                    width: size.width * 1 / 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        AlumniCategory modell = await AlumniCategory(categoryName: categoryNameController.text, categoryID: categoryIDController.text); 
                        addCategoryToFirebase(modell, context);
                      },
                      child: const Text("Add Category"),
                    ),
                  ),
                )
               ]),
            ),
                   ),
                 ),
                       )
               ],
             ),
           ]
         ),                
    );
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
   