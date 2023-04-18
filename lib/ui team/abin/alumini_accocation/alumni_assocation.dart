
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../view/fonts/fonts.dart';
import '../../../view/web/widgets/custom_button.dart';
import 'create_alumni.dart';

class AlumniAssocation extends StatefulWidget {
  const AlumniAssocation({super.key});

  @override
  State<AlumniAssocation> createState() => _AlumniAssocationState();
}

class _AlumniAssocationState extends State<AlumniAssocation> {
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions:[IconButton(
                        icon: Icon(Icons.arrow_back,
                        color: Color.fromARGB(255, 255, 255, 255),), 
                        onPressed: () {
                          Navigator.of(context).pop();
                        },)
                        ],title: Text("ALUMNI ASSOCATIONS"
                      ),backgroundColor: adminePrimayColor, ), 
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Column(
            children:[
               Container(
                 child: Row(
                   children: [ 
                    Container(
                           color: adminePrimayColor,
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
                                      "https://assets8.lottiefiles.com/packages/lf20_Lqd2eacYpM.json"),
                                )                        
                              ],
                            ),
                    ),                            
                        Padding(
                            padding:  EdgeInsets.only(left: screenSize.width/8),
                            child: Container(
                              height: screenSize.height * 1 /1 ,
                               width: screenSize.width * 1 / 3,
                              child: SingleChildScrollView(
                                 child: 
                                 Container(
                                  margin: EdgeInsets.only(top: 100),
                                   child: Column(                                    
                                            children: [
                                               Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          CreateAlumni()
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                      height: screenSize.width * 1 / 15,
                                                      width: screenSize.width * 1 / 3.7,
                                                      child: CustomButton(
                                                        text: "Create Members", onTap: () {  },
                                                      )
                                                      // color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                               SizedBox(height: screenSize.width/30,),
                                              Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child: Container(
                                                    height: screenSize.width * 1 / 16,
                                                    width: screenSize.width * 1 / 3.7,
                                                    child: InkWell(
                                                      onTap: () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (BuildContext context) =>
                                                        //           AddPTACategoryAcreen(
                                                        //             id: widget.id,
                                                        //           )),
                                                        // );
                                                      },
                                                      child: Container(
                                                        height: screenSize.width * 1 / 15,
                                                        width: screenSize.width * 1 / 3.7,
                                                        child: CustomButton(
                                                          text: 'Create Alumni Category', onTap: () {  },
                                                        ),
                                                        // color: Colors.red,
                                                      ),
                                                    ),
                                                  )),
                                                  SizedBox(height: screenSize.width/30,),
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: InkWell(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (BuildContext context) =>
                                                    //         NoticeUpdates(),
                                                    //   ),
                                                    // );
                                                  },
                                                  child: Container(
                                                    height: screenSize.width * 1 / 15,
                                                    width: screenSize.width * 1 / 3.7,
                                                    child: CustomButton(
                                                      text: 'Remove Members', onTap: () {  },
                                                    ),
                                                    // color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                                                 
                                                                 
                                                                           
                                          
                                                         ]),
                                 )
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
        
        
        
        
        
        // SingleChildScrollView(
        //   child: Column(
        //    children: [
        //      Padding(
        //        padding: const EdgeInsets.all(10),
        //        child: InkWell(
        //          onTap: () {
        //            Navigator.push(
        //              context,
        //              MaterialPageRoute(
        //                builder: (context) =>
        //                  CreateAlumni()
        //              ),
        //            );
        //          },
        //          child: Container(
        //              height: screenSize.width * 1 / 10,
        //              width: screenSize.width * 1 / 3.7,
        //              child: CustomButton(
        //                text: "Create Members", onTap: () {  },
        //              )
        //              // color: Colors.red,
        //              ),
        //        ),
        //      ),
        //      Padding(
        //          padding: const EdgeInsets.all(10),
        //          child: Container(
        //            height: screenSize.width * 1 / 10,
        //            width: screenSize.width * 1 / 3.7,
        //            child: InkWell(
        //              onTap: () {
        //                // Navigator.push(
        //                //   context,
        //                //   MaterialPageRoute(
        //                //       builder: (BuildContext context) =>
        //                //           AddPTACategoryAcreen(
        //                //             id: widget.id,
        //                //           )),
        //                // );
        //              },
        //              child: Container(
        //                height: screenSize.width * 1 / 10,
        //                width: screenSize.width * 1 / 3.7,
        //                child: CustomButton(
        //                  text: 'Create Alumni Category', onTap: () {  },
        //                ),
        //                // color: Colors.red,
        //              ),
        //            ),
        //          )),
        //      Padding(
        //        padding: const EdgeInsets.all(10),
        //        child: InkWell(
        //          onTap: () {
        //            // Navigator.push(
        //            //   context,
        //            //   MaterialPageRoute(
        //            //     builder: (BuildContext context) =>
        //            //         NoticeUpdates(),
        //            //   ),
        //            // );
        //          },
        //          child: Container(
        //            height: screenSize.width * 1 / 10,
        //            width: screenSize.width * 1 / 3.7,
        //            child: CustomButton(
        //              text: 'Remove Members', onTap: () {  },
        //            ),
        //            // color: Colors.red,
        //          ),
        //        ),
        //      ),
        //    ],
        //       ),
        // )
      
