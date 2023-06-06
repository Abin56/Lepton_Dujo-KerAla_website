import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


import '../../../view/web/login/admin/admin_DashBoard/Students_ScholarShip/student_scholarship.dart';


class CreateFoodMenu extends StatefulWidget {
  const CreateFoodMenu({super.key});

  @override
  State<CreateFoodMenu> createState() => _CreateFoodMenuState();
}

class _CreateFoodMenuState extends State<CreateFoodMenu> {
  
  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Create Food Menu')),
      body:SingleChildScrollView(child:
              Column(
                children: [
                  Row(children: [
                    Container(
                      height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                      child: Column(
                        children: [
                          DaysContainer2(screenSize: screenSize, text: 'Days',Color:Color.fromARGB(255, 255, 102, 222), ),
                          SizedBox(height: 20,),
                          DaysContainer2(screenSize: screenSize, text: 'BreakFast',Color:Color.fromARGB(255, 131, 236, 184), ),
                          SizedBox(height: 20,),
                           DaysContainer2(screenSize: screenSize, text: 'Lunch',Color:Color.fromARGB(255, 255, 102, 222), ),
                          SizedBox(height: 20,),
                          DaysContainer2(screenSize: screenSize, text: 'Tea',Color:Color.fromARGB(255, 131, 236, 184), ),
                        ],
                      ),
                    ),
                     
                          Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Column(
                             children: [
                               
                               DaysContainer2(screenSize: screenSize, text: 'Mon',
                               Color:Color.fromARGB(255, 131, 236, 184), ),
                                DaysContainer(screenSize: screenSize, text: 'Items',
                           ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                             FoodButton(onTap: () {  },)
                             ],
                           ),
                         ),
                       
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Column(
                            children: [
                              DaysContainer2(screenSize: screenSize, text: 'Tue',
                              Color:Color.fromARGB(255, 255, 102, 222), ),
                               DaysContainer(screenSize: screenSize, text: 'Items',
                           ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              FoodButton(onTap: () {  },)
                            ],
                          ),
                        ),
                        
                         Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Column(
                             children: [
                               
                               DaysContainer2(screenSize: screenSize, text: 'Wed',
                               Color:Color.fromARGB(255, 131, 236, 184), ),
                                DaysContainer(screenSize: screenSize, text: 'Items',
                           ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              FoodButton(onTap: () {  },)
                             ],
                           ),
                         ),
                          
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Column(
                            children: [
                              DaysContainer2(screenSize: screenSize, text: 'Thurs',
                              Color:Color.fromARGB(255, 255, 102, 222), ),
                               DaysContainer(screenSize: screenSize, text: 'Items',
                           ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              FoodButton(onTap: () {  },)
                            ],
                          ),
                        ),
                         
                         Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                           child: Column(
                             children: [
                               DaysContainer2(screenSize: screenSize, text: 'Fri',
                               Color:Color.fromARGB(255, 131, 236, 184), ),
                                DaysContainer(screenSize: screenSize, text: 'Items',
                           ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              FoodButton(onTap: () {  },)
                             ],
                           ),
                         ),
                        
                        Container(
                          height: screenSize.width/1.5,
                      width:screenSize.width/7.5 ,
                          child: Column(
                            children: [
                              DaysContainer2(screenSize: screenSize, text: 'Sat',
                              Color:Color.fromARGB(255, 255, 102, 222), ),
                               DaysContainer(screenSize: screenSize, text: 'Items',
                           ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              SizedBox(height: 20,),
                             DaysContainer(screenSize: screenSize, text: 'Items',
                             ),
                              FoodButton(onTap: () {  },)
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
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 50,
        width: 120,
        decoration: BoxDecoration(gradient: LinearGradient
        (colors: containerColor[8],),
       borderRadius: BorderRadius.circular(15),),
       child: Center(child: Text('Add',style: TextStyle(fontSize: 20,color: Colors.white),)),
      ));
  }
}

class DaysContainer extends StatelessWidget {
  const DaysContainer({
    super.key,
    // ignore: non_constant_identifier_names
    required this.screenSize, required this.text, 
  });

  final Size screenSize;
  final String text;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top: screenSize.width/32),
          height: screenSize.width/30,
          width: screenSize.width/12,
          child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
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
      margin: EdgeInsets.only(top: 10),
    height: screenSize.width/15,
     width: screenSize.width/8,
     decoration: BoxDecoration(color: Color,
        borderRadius: BorderRadius.circular(15)),
    child: Center(child: Text(text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:20,
                              fontWeight: FontWeight.bold),
                        ),),
                        );
  }
}

