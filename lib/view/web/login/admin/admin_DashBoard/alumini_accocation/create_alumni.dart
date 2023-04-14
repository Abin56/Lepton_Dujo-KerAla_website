import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';



class CreateAlumni extends StatefulWidget {
  const CreateAlumni({super.key});

  @override
  State<CreateAlumni> createState() => _CreateAlumniState();
}

class _CreateAlumniState extends State<CreateAlumni> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text('Alumni Creation'),
      backgroundColor: adminePrimayColor,),
       body:  ListView(
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
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: 'Name',
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                   
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: 'Designaiton',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: 'Place',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: 'Alumni ID',
                    ),
                  ),
                ),
               
                SizedBox(height: 30,),
                InkWell(onTap: () {
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
                 ),
                      )
               ],
             ),
           ]
         ),                
    );
  }
}








//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: screenSize.width * 1 / 13, bottom: 50),
//           child: Center(
//             child: Container(
//               color: Colors.white,
//               height: screenSize.width * 1 / 3,
//               width: screenSize.width * 1 / 4,
//               child: Column(children: [
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
                    
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: 'Name',
//                     ),
//                   ),
//                 ),
                
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
                   
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: 'Designaiton',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
                    
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: 'Place',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: 'Alumni ID',
//                     ),
//                   ),
//                 ),
               
//                 SizedBox(height: 30,),
//                 InkWell(onTap: () {
//                   //  Navigator.push
//                   //                 (context, MaterialPageRoute
//                   //                 (builder: 
//                   //                 ((context) =>  )));
//                 },
//                   child: Container(
//                         height: screenSize.width * 1 / 30,
//                         width: screenSize.width * 1 / 5,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(14)),
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             foregroundColor: Color.fromARGB(255, 255, 255, 255),
//                             padding: const EdgeInsets.all(9.0),
//                             textStyle: const TextStyle(fontSize: 17),
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