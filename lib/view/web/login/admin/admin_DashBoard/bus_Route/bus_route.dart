
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_container.dart';
import 'create_bus_route.dart';


class BusRoute extends StatefulWidget {
  const BusRoute({super.key});

  @override
  State<BusRoute> createState() => _BusRouteState();
}

class _BusRouteState extends State<BusRoute> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Bus Route'),
      backgroundColor: adminePrimayColor),

      

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
                                  'https://assets3.lottiefiles.com/datafiles/MaKSoctsyXXTCDOpDktJYEcS3ws5SI6CLDo7iyMc/ex-splash.json'),
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
                        padding:  EdgeInsets.only(left: size.width/15),
                        child: Container(
                          height: size.height * 1 /1 ,
                           width: size.width * 1 / 3,
                          
                          child:     Column(
          children: [
            Padding(
                padding:  EdgeInsets.only(left:size.width * 1 / 16,
                top:size.width * 1 / 15, ),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateBusRoute(),
                        ));
                  },
                  child: Container(
                      height: size.width * 1 / 10,
                      width: size.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create bus route',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding:  EdgeInsets.only(left:size.width * 1 / 15,
                top:size.width * 1 / 20,),
                child: (InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminTeacherList(),
                    //     ));
                  },
                  child: Container(
                      height: size.width * 1 / 10,
                      width: size.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Update  Bus Route',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding:  EdgeInsets.only(left:size.width * 1 / 15,
                top:size.width * 1 / 20,),
                child: (InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminTeacherList(),
                    //     ));
                  },
                  child: Container(
                      height: size.width * 1 / 10,
                      width: size.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove  Bus Route',
                        onTap: () {},
                      )),
                ))),
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


























//       body: SingleChildScrollView(
//           child: Container(
//             color: Color(0XFFE8EAF6),
//             alignment: Alignment.topCenter,
//             child: Column(
//               children: [
                
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                      Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Container(
//                         height: screenSize.width * 1 / 2,
//                         width: screenSize.width * 1 / 2.08,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all
//                           (Radius.circular(20)
//                           ), 
//                         color: Color.fromARGB(255, 191, 212, 209), ),
//                        child: Column(
//                         children: const [

//                         ]),
//                           ),
//                          ),
//                           Column(
//           children: [
//             Padding(
//                 padding:  EdgeInsets.only(left:screenSize.width * 1 / 10,
//                 top:screenSize.width * 1 / 15, ),
//                 child: (InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CreateBusRoute(),
//                         ));
//                   },
//                   child: Container(
//                       height: screenSize.width * 1 / 10,
//                       width: screenSize.width * 1 / 3,
//                       child: CustomContainer(
//                         text: 'Create bus route',
//                         onTap: () {},
//                       )),
//                 ))),
//             Padding(
//                 padding:  EdgeInsets.only(left:screenSize.width * 1 / 10,
//                 top:screenSize.width * 1 / 20,),
//                 child: (InkWell(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => AdminTeacherList(),
//                     //     ));
//                   },
//                   child: Container(
//                       height: screenSize.width * 1 / 10,
//                       width: screenSize.width * 1 / 3,
//                       child: CustomContainer(
//                         text: 'Update  Bus Route',
//                         onTap: () {},
//                       )),
//                 ))),
//             Padding(
//                 padding:  EdgeInsets.only(left:screenSize.width * 1 / 10,
//                 top:screenSize.width * 1 / 20,),
//                 child: (InkWell(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => AdminTeacherList(),
//                     //     ));
//                   },
//                   child: Container(
//                       height: screenSize.width * 1 / 10,
//                       width: screenSize.width * 1 / 3,
//                       child: CustomContainer(
//                         text: 'Remove  Bus Route',
//                         onTap: () {},
//                       )),
//                 ))),
//           ],
//         ),



//                         ])   
//                        ])
//                       )
//                     )
//   );
       
//   }
// }

