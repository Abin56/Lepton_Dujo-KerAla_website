import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/food_model/food_and_beverages_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/button_container_widget.dart';




class CreateFoodMenu extends StatefulWidget {
   CreateFoodMenu({super.key, required this.schoolID}); 

  String schoolID;

  @override
  State<CreateFoodMenu> createState() => _CreateFoodMenuState();
}

class _CreateFoodMenuState extends State<CreateFoodMenu> {
  

  addFoodandBeveragesToCollection(String day, FoodModel model){
   FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolID).collection('BatchYear').doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc(day).set(model.toJson()) 
   .then((value) => showDialog(context: context, builder: ((context) {
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
        child: const Text('Create Food Menu'))),
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
                           child: Column(
                             children: [
                               
                               DaysContainer2(screenSize: screenSize, text: 'Mon',
                               Color:const Color.fromARGB(255, 131, 236, 184), ),
                                DaysContainer(screenSize: screenSize, text: 'Items',contr: mondayBreak,
                           ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: mondayLunch,
                             ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: mondaySnacks,
                             ),
                             FoodButton(onTap: () async{  
                              FoodModel modell = await FoodModel(items:  {
                                'Breakfast' : mondayBreak.text, 
                                'Lunch' : mondayLunch.text, 
                                'Snacks': mondaySnacks.text
                              });
                              addFoodandBeveragesToCollection('Monday',modell );
                             },)
                             ],
                           ),
                         ),
                       
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Column(
                            children: [
                              DaysContainer2(screenSize: screenSize, text: 'Tue',
                              Color:const Color.fromARGB(255, 255, 102, 222), ),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: tuesdayBreak,
                           ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: tuesdayLunch,
                             ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: tuesdaySnacks
                             ),
                              FoodButton(onTap: () async{ 
                                FoodModel modell = await FoodModel(items:  {
                                'Breakfast' : tuesdayBreak.text, 
                                'Lunch' : tuesdayLunch.text, 
                                'Snacks': tuesdaySnacks.text
                              });
                              addFoodandBeveragesToCollection('Tuesday',modell );
                               },)
                            ],
                          ),
                        ),
                        
                         Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Column(
                             children: [
                               
                               DaysContainer2(screenSize: screenSize, text: 'Wed',
                               Color:const Color.fromARGB(255, 131, 236, 184), ),
                                DaysContainer(screenSize: screenSize, text: 'Items', contr: wednesdayBreak,
                           ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items', contr: wednesdayLunch,
                             ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: wednesdaySnacks,
                             ),
                              FoodButton(onTap: ()async { 
                               FoodModel modell = await FoodModel(items:  {
                                'Breakfast' : wednesdayBreak.text, 
                                'Lunch' : wednesdayLunch.text, 
                                'Snacks': wednesdaySnacks.text
                              });
                              addFoodandBeveragesToCollection('Wednesday',modell );
                               },)
                             ],
                           ),
                         ),
                          
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Column(
                            children: [
                              DaysContainer2(screenSize: screenSize, text: 'Thurs',
                              Color:const Color.fromARGB(255, 255, 102, 222), ),
                               DaysContainer(screenSize: screenSize, text: 'Items',contr: thursdayBreak,
                           ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items', contr: thursdayLunch,
                             ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: thursdaySnacks,
                             ),
                              FoodButton(onTap: () async { 
                                FoodModel modell = await FoodModel(items:  {
                                'Breakfast' : thursdayBreak.text, 
                                'Lunch' : thursdayLunch.text, 
                                'Snacks': thursdaySnacks.text
                              });
                              addFoodandBeveragesToCollection('Thursday',modell );
                               },)
                            ],
                          ),
                        ),
                         
                         Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Column(
                             children: [
                               DaysContainer2(screenSize: screenSize, text: 'Fri',
                               Color:const Color.fromARGB(255, 131, 236, 184), ),
                                DaysContainer(screenSize: screenSize, text: 'Items',contr: fridayBreak,
                           ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: fridayLunch,
                             ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',contr: fridaySnacks,
                             ),
                              FoodButton(onTap: () async{
                                FoodModel modell = await FoodModel(items:  {
                                'Breakfast' : fridayBreak.text, 
                                'Lunch' : fridayLunch.text, 
                                'Snacks': fridaySnacks.text
                              });
                              addFoodandBeveragesToCollection('Friday',modell );
                                },)
                             ],
                           ),
                         ),
                        
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Column(
                            children: [
                              DaysContainer2(screenSize: screenSize, text: 'Sat',
                              Color:const Color.fromARGB(255, 255, 102, 222), ),
                               DaysContainer(screenSize: screenSize, text: 'Items', contr: saturdayBreak,
                           ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items', contr: saturdayLunch,
                             ),
                              const SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items', contr: saturdaySnacks,
                             ),
                              FoodButton(onTap: () async{ 
                                FoodModel modell = await  FoodModel(items:  {
                                'Breakfast' : saturdayBreak.text, 
                                'Lunch' : saturdayLunch.text, 
                                'Snacks': saturdaySnacks.text
                              });
                              addFoodandBeveragesToCollection('Saturday',modell );
                               },)
                            ],
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
    required this.screenSize, required this.text, required this.contr
  });

  final Size screenSize;
  final String text;
  TextEditingController contr;
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
          child: TextField(
            controller: contr,
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

