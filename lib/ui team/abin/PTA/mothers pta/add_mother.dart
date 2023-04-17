import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

import '../../../../view/colors/colors.dart';
import '../../../../view/fonts/fonts.dart';

class AddMothers extends StatefulWidget {
  const AddMothers({super.key});

  @override
  State<AddMothers> createState() => _AddMothersState();
}

class _AddMothersState extends State<AddMothers> {
  @override
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(title: const Text('Add PTA Members'),
      backgroundColor:adminePrimayColor),
      body:
       ListView(
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
                                  'https://assets6.lottiefiles.com/packages/lf20_bvynf4ow.json'),
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
                  
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      icon: Icon(Icons.person_3,color: Color.fromARGB(255, 13, 5, 122)),
                      labelText: 'Name of Mother ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                   
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20) 
                      ),
                       icon: Icon(Icons.people_outline_sharp,color: Color.fromARGB(255, 13, 5, 122)),
                      labelText: 'Member ID',
                    ),
                  ),
                ),
              
                SizedBox(
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
                     
                    },
                    child: const Text("Add Category"),
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
      
      
      
      
      
      
      
      
      
      
      
      
   