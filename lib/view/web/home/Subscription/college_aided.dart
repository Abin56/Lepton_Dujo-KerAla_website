import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/button_container_widget.dart';
import '../../widgets/custom_blue_button.dart';

class CollegeAidedSubscription extends StatefulWidget {
  const CollegeAidedSubscription({super.key});

  @override
  State<CollegeAidedSubscription> createState() => _CollegeAidedSubscriptionState();
}

class _CollegeAidedSubscriptionState extends State<CollegeAidedSubscription> {
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text('College Govt / Aided') 
        ),
        body: 
          
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenSize.width*1/20,
                    top: screenSize.width*1/20,
                    bottom: screenSize.width*1/20),
                    child: Container(
                      height:screenSize.width*1/2,
                      width: screenSize.width*1/2.8,
                      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
                      color:Colors.blueAccent ,),
                     child: ListView(children: [
                          Container(
                            child:  Center(
                              child: Text(
                                  "List of Colleges",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                            ),
                            
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'CMS College',
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => FeesBills()),
                                  // );
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'IET College',
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => FeesBills()),
                                  // );
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'NSS College',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'MG College',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'NIT College',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: '',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ])
                    ),
                  ),

                  SizedBox(width: screenSize.width*1/10,),


                  Container(
                    height: screenSize.width*1/2,
                    width: screenSize.width*1/2.3,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.
                    circular(30),
                    color:Color.fromARGB(255, 6, 218, 154) ,
                    ),
                    child: ListView(children: [
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.only(top: screenSize.width*1/30),
                          child: Text('Features',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 25),),
                        ),
                      ),
                      SizedBox(height: 50,),
                      
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                           height: screenSize.width*1/4,
                             width: screenSize.width*1/5,
                            
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 99, 218, 226),
                               borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                      children: const [
                                        
                                                    Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Student Login',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                                    SizedBox(height: 50,),
                                                    Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Parent Login And Guardian Login',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                                   
                                                    SizedBox(height: 50,),
                                                     Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Live Attendances',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                                    SizedBox(height: 50,),
                                                    Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Daily updates and Homeworks',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                                   
                                                    SizedBox(height: 50,),
                                                   
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),


                        
                        Padding(
                          padding: const EdgeInsets.only(right: 10, ),
                          child: Container(
                          height: screenSize.width*1/4,
                               width: screenSize.width*1/5,
                             decoration: BoxDecoration(
                              color: Color.fromARGB(255, 99, 218, 226),
                               borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                            ),
                            child: Column(
                                  children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 50),
                                     child: 
                                      Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Class Group Chats',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                                
                                   ),
                                                SizedBox(height: 50,),
                                                 Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Study Material Sharing',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                                
                                                SizedBox(height: 50,),
                                                 Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Progress Report',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                               
                                                 SizedBox(height: 50,),
                                                  Align(
                                                   alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                     padding: EdgeInsets.only(left: 10),
                                                     child: Text(
                                                   '*  Exam Notifications',
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                     ),
                                                   ),),
                                               
                                ],),
                            
                          ),
                        ),
                      ],
                    ),








                       GestureDetector(
                      onTap: () {

                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                        top: screenSize.width*1/20,
                        left: screenSize.width/9,
                        right: screenSize.width/9,
                        bottom: screenSize.width*0),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: containerColor[5].first.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(4, 4),
                              ),
                            ],
                            gradient: LinearGradient(
                                colors: containerColor[0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          height: 80,
                          width: 250,
                          child: 
                          Row(
                              children:  [
                                Padding(
                                  padding:  EdgeInsets.only(left:screenSize.width/13.5 ),
                                  child: Text("SUBSCRIBE",
                                    style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 16),),
                                ),
                              
                                   Icon(Icons.notifications,color: Colors.red,),  
                              ],
                            ),
                          
                             
                        ), 
                      ),
                    ),
                    ]),
                  )
                ],
              ),
            
        
        
      );
  }
}