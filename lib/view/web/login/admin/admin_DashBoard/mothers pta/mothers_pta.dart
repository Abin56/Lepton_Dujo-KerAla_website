import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_button.dart';
import '../pTA_section/pta_admin_panel.dart';
import 'add_mother.dart';
import 'mothers_list.dart';

class MothersPta extends StatefulWidget {
  const MothersPta({super.key});

  @override
  State<MothersPta> createState() => _MothersPtaState();
}

class _MothersPtaState extends State<MothersPta> {

   @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Mothers PTA'),
      backgroundColor: adminePrimayColor,),
        backgroundColor: adminePrimayColor,

         body:  SingleChildScrollView(
        child: Column(
            children:[
               Container(
                 child: Row(
                   children: [ 
                    Container(
                           color: const Color.fromARGB(255, 12, 34, 133),
                           height: screenSize.height,
                          width: screenSize.width * 1 / 2,
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
                                SizedBox(height: screenSize.width/20,),
                                 Text(
                                  'Welcome',
                                  style: GoogleFonts.aclonica(
                                    fontSize: 25.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),                            
                                SizedBox(
                                  height: screenSize.width/3.5,
                                  width:screenSize.width/1,
                                  child: LottieBuilder.network(
                                      "https://assets3.lottiefiles.com/packages/lf20_3n0j5bwn.json"),
                                )                        
                              ],
                            ),
                    ),                            
                        Padding(
                            padding:  EdgeInsets.only(left: screenSize.width/8),
                            child: SizedBox(
                              height: screenSize.height * 1 /1 ,
                               width: screenSize.width * 1 / 3,
                              child: SingleChildScrollView(
                                padding:EdgeInsets.only(top: screenSize.width/20),
                                 child: Column(                                    
                                          children: [ 
                                            Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                     const AddMothers(),
                              ),
                            );
                          },
                          child: SizedBox(
                              height: screenSize.width * 1 / 15,
                              width: screenSize.width * 1 / 3.7,
                              child: CustomButton(
                                text: "Create Mother ID",
                                onTap: () {},
                              )
                              // color: Colors.red,
                              ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: screenSize.width * 1 / 15,
                            width: screenSize.width * 1 / 3.7,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (BuildContext context) =>
                                //          ),
                                // );
                              },
                              child: ptacontainer(
                                screenSize: screenSize, text: 'Create PTA Category', onTap: () {  },),
                            ),
                          )),
                           Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                   const MothersList() ,
                              ),
                            );
                          },
                          child: ptacontainer(
                                screenSize: screenSize, text: 'Members List', onTap: () { 
                                  
                                },),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //        ,
                            //   ),
                           // );
                          },
                          child: ptacontainer(
                                screenSize: screenSize, text: 'Remove Members', onTap: () { 

                                },),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),             
                        ])
                       )
                     )
                  )
              ]),
             ),
         ])
      ), 
       
        );
  }
}




