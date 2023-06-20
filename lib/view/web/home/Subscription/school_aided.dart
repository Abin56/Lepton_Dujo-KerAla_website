import 'package:flutter/material.dart';

import '../../widgets/button_container_widget.dart';
import '../../widgets/custom_blue_button.dart';


class SchoolAidedSubscription extends StatefulWidget {
  const SchoolAidedSubscription({super.key});

  @override
  State<SchoolAidedSubscription> createState() => _SchoolAidedSubscriptionState();
}

class _SchoolAidedSubscriptionState extends State<SchoolAidedSubscription> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        title:const Text('School Aided / Gov') ,backgroundColor: const Color.fromARGB(255, 45, 120, 180),
        ),
  
        
        body: 
          
              Row(
                children: [
                   Container(
                      height:screenSize.width*1/2,
                          width: screenSize.width*1/2,
                          color: const Color.fromARGB(255, 45, 120, 180),
                      child: Padding(
                        padding: EdgeInsets.only(left: screenSize.width*0,
                        top: screenSize.width*0,
                        bottom: screenSize.width*0),
                        child: Column(
                          children: [
                             Padding(
                               padding: const EdgeInsets.all(15),
                               child: Container(
                                  child:  const Center(
                                    child: Text(
                                        "DuJo Schools",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ),
                                  
                                ),
                             ),
                            Container(
                              height:screenSize.width*1/2.5,
                              width: screenSize.width*1/2.8,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:Colors.blueAccent ,),
                             child: ListView(children: [
                                 
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: 'CMS HSS',
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) => FeesBills()),
                                          // );
                                        },
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: 'MTHSS',
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) => FeesBills()),
                                          // );
                                        },
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: 'SNV HSS',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: 'MS HSS',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: 'TTTMHSS',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: screenSize.width * 1 / 20,
                                      width: screenSize.width * 1 / 6,
                                      child: CustomBlueButton(
                                        text: '',
                                        onPressed: () {},
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ])
                            ),
                          ],
                        ),
                      ),
                    ),
                  

                 // SizedBox(width: screenSize.width*1/10,),


                  // Padding(
                  //   padding:  EdgeInsets.all(15),
                  //   child:
                     Container(
                      height: screenSize.width*1/2,
                      width:screenSize.width*1/2.1,
                      // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.
                      // circular(30),
                      color:const Color.fromARGB(255, 255, 255, 255) ,
                     // ),
                      child: Column(children: [
                        Center(
                          child: Padding(
                            padding:  EdgeInsets.only(top: screenSize.width*1/40),
                            child: const Text('Features',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 25),),
                          ),
                        ),
                        const SizedBox(height: 50,),
                       
                  
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                             height: screenSize.width*1/4,
                               width: screenSize.width*1/5,
                             decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 99, 218, 226),
                               borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                            ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Container(
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
                          ),
                          const SizedBox(width: 20,),
                  
                  
                          
                          Padding(
                            padding: const EdgeInsets.only(right: 10, ),
                            child: Container(
                             height: screenSize.width*1/4,
                               width: screenSize.width*1/5,
                             decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 99, 218, 226),
                               borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                            ),
                              child: Container(
                                child: Column(
                                      children: const [
                                       Padding(
                                         padding: EdgeInsets.only(top: 50),
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
                          ),
                        ],
                      ),
                  
                  
                  
                  
                  
                  
                  
                  
                        GestureDetector(
                      onTap: () {
                  
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                        top: screenSize.width*1/20,
                        left: screenSize.width*0,
                        right: screenSize.width*0,
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
                                  padding:  EdgeInsets.only(left:screenSize.width*1/25 ),
                                  child: const Text("SUBSCRIBE",
                                    style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 16),),
                                ),
                              
                                   const Icon(Icons.notifications,color: Colors.red,),  
                              ],
                            ),
                          
                             
                        ), 
                      ),
                    ),
                      ]),
                    ),
                 // )
                ],
              ),
            
        
        
      );
  }
}