import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/food_model/food_and_beverages_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constant/constant.dart';
import '../../../../widgets/button_container_widget.dart';




class CreateFoodMenu extends StatefulWidget {
   CreateFoodMenu({super.key, required this.schoolID}); 
   

  String schoolID;

  @override
  State<CreateFoodMenu> createState() => _CreateFoodMenuState();
}
final formKey1 = GlobalKey<FormState>();
final formKey2 = GlobalKey<FormState>();
final formKey3 = GlobalKey<FormState>();
final formKey4 = GlobalKey<FormState>();
final formKey5 = GlobalKey<FormState>();
final formKey6 = GlobalKey<FormState>();
class _CreateFoodMenuState extends State<CreateFoodMenu> {
  

  Future<void>addFoodandBeveragesToCollection(String day, FoodModel model)async{
   FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc(day).set(model.toJson()) 
   .then((value) => showDialog(barrierDismissible: false,
    context: context, builder: ((context) {
     return AlertDialog(
      title: Text('Food and Beverages'), 
      content: Text('Food items for ${day} succesfully added!'), 
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: MaterialButton(onPressed: (){
              Navigator.pop(context);
          }, child: Text('OK'),),
        )
      ],
     );
   })));
  }

  TextEditingController mondayBreak = TextEditingController(); 
  TextEditingController tuesdayBreak = TextEditingController(); 
  
  TextEditingController wednesdayBreak = TextEditingController(); 
  TextEditingController thursdayBreak = TextEditingController(); 
  
  TextEditingController fridayBreak = TextEditingController(); 
  TextEditingController saturdayBreak = TextEditingController(); 

   TextEditingController mondayLunch = TextEditingController(); 
  TextEditingController tuesdayLunch = TextEditingController(); 
  
  TextEditingController wednesdayLunch = TextEditingController(); 
  TextEditingController thursdayLunch = TextEditingController(); 
  
  TextEditingController fridayLunch = TextEditingController(); 
  TextEditingController saturdayLunch = TextEditingController(); 

   TextEditingController mondaySnacks = TextEditingController(); 
  TextEditingController tuesdaySnacks = TextEditingController(); 
  
  TextEditingController wednesdaySnacks = TextEditingController(); 
  TextEditingController thursdaySnacks = TextEditingController(); 
  
  TextEditingController fridaySnacks = TextEditingController(); 
  TextEditingController saturdaySnacks = TextEditingController(); 

  
  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: GestureDetector(
        onTap: (){
         // Navigator.push(context, MaterialPageRoute(builder: ((context) => Cf()));
        },
        child: const Text('Create Food Menu')),
        backgroundColor: adminePrimayColor),
      body:SingleChildScrollView(child:
              Column(
                children: [
                  Row(children: [
                    Container(
                      height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                      child: Column(
                        children: [
                          DaysContainer2(screenSize: screenSize, text: 'Days',Color:const Color.fromARGB(255, 255, 102, 222), ),
                          const SizedBox(height: 20,),
                          DaysContainer2(screenSize: screenSize, text: 'BreakFast',Color:const Color.fromARGB(255, 131, 236, 184), ),
                          const SizedBox(height: 20,),
                           DaysContainer2(screenSize: screenSize, text: 'Lunch',Color:const Color.fromARGB(255, 255, 102, 222), ),
                          const SizedBox(height: 20,),
                          DaysContainer2(screenSize: screenSize, text: 'Tea',Color:const Color.fromARGB(255, 131, 236, 184), ),
                        ],
                      ),
                    ),
                     
                          Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Form(
                            key: formKey1,
                             child: Column(
                               children: [
                                 
                                 DaysContainer2(screenSize: screenSize, text: 'Mon',
                                 Color:const Color.fromARGB(255, 131, 236, 184), ),
                                  DaysContainer(screenSize: screenSize, text: 'Items',contr: mondayBreak, formvalidate: checkFieldEmpty,
                             ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: mondayLunch,formvalidate: checkFieldEmpty
                               ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: mondaySnacks,formvalidate: checkFieldEmpty
                               ),
                               FoodButton(onTap: () async{  
                                 bool? result =
                                        formKey1.currentState?.validate();
                                FoodModel modell = await FoodModel(items:  {
                                  'Breakfast' : mondayBreak.text, 
                                  'Lunch' : mondayLunch.text, 
                                  'Snacks': mondaySnacks.text
                                });
                              bool? result1 =
                                            formKey1.currentState?.validate();
                                            if (result1==true) {
                                addFoodandBeveragesToCollection('Monday',modell ).then((value) {
                                  mondayBreak.clear(); 
                                  mondayLunch.clear(); 
                                  mondaySnacks.clear();
                                });
                              } },)
                               ],
                             ),
                           ),
                         ),
                       
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Form(
                            key: formKey2,
                            child: Column(
                              children: [
                                DaysContainer2(screenSize: screenSize, text: 'Tue',
                                Color:const Color.fromARGB(255, 255, 102, 222), ),
                                 DaysContainer(screenSize: screenSize, text: 'Items',contr: tuesdayBreak,formvalidate: checkFieldEmpty
                             ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: tuesdayLunch,formvalidate: checkFieldEmpty
                               ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: tuesdaySnacks,formvalidate: checkFieldEmpty
                               ),
                                FoodButton(onTap: () async{ 
                                 
                                  FoodModel modell = await FoodModel(items:  {
                                  'Breakfast' : tuesdayBreak.text, 
                                  'Lunch' : tuesdayLunch.text, 
                                  'Snacks': tuesdaySnacks.text
                                });
                                bool? result2 =
                                            formKey2.currentState?.validate();
                                            if (result2==true) {
                                addFoodandBeveragesToCollection('Tuesday',modell ).then((value) {
                                  tuesdayBreak.clear(); 
                                  tuesdayLunch.clear(); 
                                  tuesdaySnacks.clear();
                                });
                            }},)
                              ],
                            ),
                          ),
                        ),
                        
                         Container(
                           height: screenSize.width/1.5,
                           width:screenSize.width/7.5 ,
                           child: Form(
                            key: formKey3,
                             child: Column(
                               children: [
                                 
                                 DaysContainer2(screenSize: screenSize, text: 'Wed',
                                 Color:const Color.fromARGB(255, 131, 236, 184), ),
                                  DaysContainer(screenSize: screenSize, text: 'Items', contr: wednesdayBreak,formvalidate: checkFieldEmpty
                             ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items', contr: wednesdayLunch,formvalidate: checkFieldEmpty
                               ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: wednesdaySnacks,formvalidate: checkFieldEmpty
                               ),
                                FoodButton(onTap: ()async { 
                                  
                                 FoodModel modell = await FoodModel(items:  {
                                  'Breakfast' : wednesdayBreak.text, 
                                  'Lunch' : wednesdayLunch.text, 
                                  'Snacks': wednesdaySnacks.text
                                });
                                bool? result3 =
                                            formKey3.currentState?.validate();
                                            if (result3==true) {
                                addFoodandBeveragesToCollection('Wednesday',modell ).then((value) {
                                  wednesdayBreak.clear(); 
                                  wednesdayLunch.clear(); 
                                  wednesdaySnacks.clear();
                                });;
                             }},)
                               ],
                             ),
                           ),
                         ),
                          
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Form(
                            key: formKey4,
                            child: Column(
                              children: [
                                DaysContainer2(screenSize: screenSize, text: 'Thurs',
                                Color:const Color.fromARGB(255, 255, 102, 222), ),
                                 DaysContainer(screenSize: screenSize, text: 'Items',contr: thursdayBreak,formvalidate: checkFieldEmpty
                             ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items', contr: thursdayLunch,formvalidate: checkFieldEmpty
                               ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: thursdaySnacks,formvalidate: checkFieldEmpty
                               ),
                                FoodButton(onTap: () async { 
                                   
                                  FoodModel modell = await FoodModel(items:  {
                                  'Breakfast' : thursdayBreak.text, 
                                  'Lunch' : thursdayLunch.text, 
                                  'Snacks': thursdaySnacks.text
                                });
                                bool? result4 =
                                            formKey4.currentState?.validate();
                                            if (result4==true) {
                                addFoodandBeveragesToCollection('Thursday',modell ).then((value) {
                                  thursdayBreak.clear(); 
                                  thursdayLunch.clear(); 
                                  thursdaySnacks.clear();
                                });
                                } },)
                              ],
                            ),
                          ),
                        ),
                         
                         Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Form(
                            key: formKey5,
                             child: Column(
                               children: [
                                 DaysContainer2(screenSize: screenSize, text: 'Fri',
                                 Color:const Color.fromARGB(255, 131, 236, 184), ),
                                  DaysContainer(screenSize: screenSize, text: 'Items',contr: fridayBreak,formvalidate: checkFieldEmpty
                             ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: fridayLunch,formvalidate: checkFieldEmpty
                               ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: fridaySnacks,formvalidate: checkFieldEmpty
                               ),
                                FoodButton(onTap: () async{
                                
                                  FoodModel modell = await FoodModel(items:  {
                                  'Breakfast' : fridayBreak.text, 
                                  'Lunch' : fridayLunch.text, 
                                  'Snacks': fridaySnacks.text
                                });bool? result5 =
                                          formKey5.currentState?.validate();
                                          if (result5==true) {
                                addFoodandBeveragesToCollection('Friday',modell ).then((value) {
                                  fridayBreak.clear(); 
                                  fridayLunch.clear(); 
                                  fridaySnacks.clear();
                                });;
                                  }},)
                               ],
                             ),
                           ),
                         ),
                        
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Form(
                            key: formKey6,
                            child: Column(
                              children: [
                                DaysContainer2(screenSize: screenSize, text: 'Sat',
                                Color:const Color.fromARGB(255, 255, 102, 222), ),
                                 DaysContainer(screenSize: screenSize, text: 'Items', contr: saturdayBreak,formvalidate: checkFieldEmpty
                             ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items', contr: saturdayLunch,formvalidate: checkFieldEmpty
                               ),
                                const SizedBox(height: 20,),
                               DaysContainer(screenSize: screenSize, text: 'Items', contr: saturdaySnacks,formvalidate: checkFieldEmpty
                               ),
                                FoodButton(onTap: () async{  
                              
                                FoodModel modell = await FoodModel(items:  {
                                  'Breakfast' : saturdayBreak.text, 
                                  'Lunch' : saturdayLunch.text, 
                                  'Snacks': saturdaySnacks.text
                                });
                                 bool? result6 =
                                        formKey6.currentState?.validate();
                                        if (result6==true) {
                                addFoodandBeveragesToCollection('Saturday',modell ).then((value) {
                                  thursdayBreak.clear(); 
                                  thursdayLunch.clear(); 
                                  thursdaySnacks.clear();
                                });
                             } },)
                              ],
                            ),
                          ),
                        ),
                  ],)
    
                ])
                )
    );
  }
}

class FoodButton extends StatelessWidget {
   FoodButton({
    super.key,
    required this.onTap
  });
  VoidCallback  onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        width: 120,
        decoration: BoxDecoration(gradient: LinearGradient
        (colors: containerColor[8],),
       borderRadius: BorderRadius.circular(15),),
       child: const Center(child: Text('Add',style: TextStyle(fontSize: 20,color: Colors.white),)),
      ));
  }
}

class DaysContainer extends StatelessWidget {
   DaysContainer({
    super.key,
    // ignore: non_constant_identifier_names
    required this.screenSize, required this.text, required this.contr,required this.formvalidate,
  });

  final Size screenSize;
  final String text;
  TextEditingController contr;
  final String? Function(String? fieldContent) formvalidate;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top: screenSize.width/32),
          height: screenSize.width/30,
          width: screenSize.width/12,
          child: TextFormField(
            controller: contr,
            validator: formvalidate,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: text,
                      ),
                            ),
        ),
      ),);
  }
}

class DaysContainer2 extends StatelessWidget {
  const DaysContainer2({
    super.key,
    required this.screenSize, required this.text, this.Color,
  });

  final Size screenSize;
  final String text;
  final Color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
    height: screenSize.width/15,
     width: screenSize.width/8,
     decoration: BoxDecoration(color: Color,
        borderRadius: BorderRadius.circular(15)),
    child: Center(child: Text(text,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize:20,
                              fontWeight: FontWeight.bold),
                        ),),
                        );
  }
}

