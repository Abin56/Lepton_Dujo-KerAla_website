import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';



class CreateBusRoute extends StatefulWidget {
  const CreateBusRoute({super.key});

  @override
  State<CreateBusRoute> createState() => _CreateBusRouteState();
}

class _CreateBusRouteState extends State<CreateBusRoute> {
  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: Text('Create Bus Route'),
     backgroundColor: adminePrimayColor,
     ),


      body:  ListView(
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
                              'Create Your Bus Route',
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
                                  'https://assets3.lottiefiles.com/private_files/lf30_aav3tdzz.json'),
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
                          
                          child: Column(
                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      Padding(
                                        padding:  EdgeInsets.only(top: size.width/22),
                                        child: Container(
                                                    color: Colors.white,
                                                   // height: size.width * 1 / 2,
                                                    width: size.width * 1 / 4,
                                                    child: Column(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(15),
                                                        child: TextField(
                                                          
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                                                            icon: Icon(Icons.route_outlined,color: Color.fromARGB(255, 19, 7, 134)),
                                                            labelText: 'Route Number',
                                                          ),
                                                        ),
                                                      ),
                                                      
                                                      Padding(
                                                        padding: EdgeInsets.all(15),
                                                        child: TextField(
                                                         
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                               borderRadius: BorderRadius.circular(20)
                                                            ),
                                                             icon: Icon(Icons.bus_alert,color: Color.fromARGB(255, 19, 7, 134)),
                                                            labelText: 'Bus Number',
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(15),
                                                        child: TextField(
                                                          
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                               borderRadius: BorderRadius.circular(20)
                                                            ),
                                                             icon: Icon(Icons.phone_android_sharp,color: Color.fromARGB(255, 19, 7, 134)),
                                                            labelText: 'Driver Mobile Number',
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(15),
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                               borderRadius: BorderRadius.circular(20)
                                                            ),
                                                             icon: Icon(Icons.phone_android,color: Color.fromARGB(255, 19, 7, 134)),
                                                            labelText: 'Assistnce Mobile Number',
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(15),
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                               borderRadius: BorderRadius.circular(20)
                                                            ),
                                                             icon: Icon(Icons.person_2,color: Color.fromARGB(255, 19, 7, 134)),
                                                            labelText: 'Staff in Charge',
                                                          ),
                                                        ),
                                                      ),
                                                     
                                                      
                                                      SizedBox(
                                                        height: 30,),
                                                      InkWell(
                                                        onTap: () {
                                                        //  Navigator.push
                                                        //                 (context, MaterialPageRoute
                                                        //                 (builder: 
                                                        //                 ((context) =>  )));
                                                      },
                                                        child: Container(
                                                              height: size.width * 1 / 30,
                                                              width: size.width * 1 / 5,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.blue,
                                                                  borderRadius: BorderRadius.circular(14)),
                                                              child: TextButton(
                                                                style: TextButton.styleFrom(
                                                                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                                                                  padding: const EdgeInsets.all(9.0),
                                                                  textStyle: const TextStyle(fontSize: 17),
                                                                ),
                                                                onPressed: () {},
                                                                child: const Text('Create'),
                                                              ),
                                                            ),
                                                      ),
                                                      
                                                    ]),
                                                  ),
                                      ),
                                    ],
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















    // var screenSize = MediaQuery.of(context).size;
    // return Scaffold(
    //   backgroundColor: Color.fromARGB(255, 27, 95, 88),
    //   appBar: AppBar(title: Text('Bus Route dashboard')),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.only(top: screenSize.width * 1 / 13, bottom: 50),
    //       child: Center(
    //         child: Container(
    //           color: Colors.white,
    //           height: screenSize.width * 1 / 2,
    //           width: screenSize.width * 1 / 4,
    //           child: Column(children: [
    //             Padding(
    //               padding: EdgeInsets.all(15),
    //               child: TextField(
                    
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   labelText: 'Route Number',
    //                 ),
    //               ),
    //             ),
                
    //             Padding(
    //               padding: EdgeInsets.all(15),
    //               child: TextField(
                   
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   labelText: 'Bus Number',
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(15),
    //               child: TextField(
                    
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   labelText: 'Driver Mobile Number',
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(15),
    //               child: TextField(
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   labelText: 'Assistnce Mobile Number',
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(15),
    //               child: TextField(
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(),
    //                   labelText: 'Staff in Charge',
    //                 ),
    //               ),
    //             ),
    //             //  Padding(
    //             //   padding: EdgeInsets.all(15),
    //             //   child: TextField(
    //             //     decoration: InputDecoration(
    //             //       border: OutlineInputBorder(),
    //             //       labelText: '',
    //             //     ),
    //             //   ),
    //             // ),
    //             //  Padding(
    //             //   padding: EdgeInsets.all(15),
    //             //   child: TextField(
    //             //     decoration: InputDecoration(
    //             //       border: OutlineInputBorder(),
    //             //       labelText: '',
    //             //     ),
    //             //   ),
    //             // ),
                
    //             SizedBox(height: 30,),
    //             InkWell(onTap: () {
    //               //  Navigator.push
    //               //                 (context, MaterialPageRoute
    //               //                 (builder: 
    //               //                 ((context) =>  )));
    //             },
    //               child: Container(
    //                     height: screenSize.width * 1 / 30,
    //                     width: screenSize.width * 1 / 5,
    //                     decoration: BoxDecoration(
    //                         color: Colors.blue,
    //                         borderRadius: BorderRadius.circular(14)),
    //                     child: TextButton(
    //                       style: TextButton.styleFrom(
    //                         foregroundColor: Color.fromARGB(255, 255, 255, 255),
    //                         padding: const EdgeInsets.all(9.0),
    //                         textStyle: const TextStyle(fontSize: 17),
//                           ),
//                           onPressed: () {},
//                           child: const Text('Create'),
//                         ),
//                       ),
//                 ),
                
//               ]),
//             ),
//           ),
//         ),
//      ),
// );
// }
// }