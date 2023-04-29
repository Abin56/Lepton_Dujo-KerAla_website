
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_container.dart';
import 'create_food_menu.dart';
import 'food_time_table_menu.dart';

class FoodBeverages extends StatefulWidget {
   FoodBeverages({super.key, required this.schoolID});

  String schoolID;

  @override
  State<FoodBeverages> createState() => _FoodBeveragesState();
}

class _FoodBeveragesState extends State<FoodBeverages> {
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Food and Beverages'),backgroundColor:Color.fromARGB(255, 12, 34, 133) ),


 body:  SingleChildScrollView(
        child: Column(
            children:[
               Container(
                 child: Row(
                   children: [ 
                    Container(
                           color: Color.fromARGB(255, 12, 34, 133),
                           height: screenSize.height,
                          width: screenSize.width * 1 / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButtonBackWidget(color: cWhite,),

                                Expanded(
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
                                            "https://assets4.lottiefiles.com/packages/lf20_ysas4vcp.json"),
                                      )                        
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),                            
                        Padding(
                            padding:  EdgeInsets.only(left: screenSize.width/8),
                            child: Container(
                              height: screenSize.height * 1 /1 ,
                               width: screenSize.width * 1 / 3,
                              child: SingleChildScrollView(
                                 child: Padding(
                                   padding:  EdgeInsets.only(top: screenSize.width/15),
                                   child: Container(
                                     child: Column(
                                       children: [
                                         Padding(
                                             padding: const EdgeInsets.all(10),
                                             child: (InkWell(
                                               onTap: () {
                                                 Navigator.push(
                                                     context,
                                                     MaterialPageRoute(
                                                       builder: (context) => CreateFoodMenu(schoolID: widget.schoolID),
                                                     ));
                                               },
                                               child: Container(
                                                   height: screenSize.width * 1 / 10,
                                                   width: screenSize.width * 1 / 3,
                                                   child: CustomContainer(
                                                     text: 'Create Food Menu',
                                                     onTap: () {},
                                                   )),
                                             ))),
                                              Padding(
                                             padding: const EdgeInsets.all(10),
                                             child: (InkWell(
                                               onTap: () {
                                                 Navigator.push(
                                                     context,
                                                     MaterialPageRoute(
                                                       builder: (context) => FoodTimeTableMenu(),
                                                     ));
                                               },
                                               child: Container(
                                                   height: screenSize.width * 1 / 10,
                                                   width: screenSize.width * 1 / 3,
                                                   child: CustomContainer(
                                                     text: 'Show Food Menu',
                                                     onTap: () {},
                                                   )),
                                             ))),
                                         Padding(
                                             padding: const EdgeInsets.all(10),
                                             child: (InkWell(
                                               // onTap: () {
                                               //   Navigator.push(
                                               //       context,
                                               //       MaterialPageRoute(
                                               //         builder: (context) => AdminTeacherList(),
                                               //       ));
                                               // },
                                               child: Container(
                                                   height: screenSize.width * 1 / 10,
                                                   width: screenSize.width * 1 / 3,
                                                   child: CustomContainer(
                                                     text: 'Create Food Commities',
                                                     onTap: () {},
                                                   )),
                                             ))),
                                        
                                       ],
                                     ),
                                   ),
                                 ),
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