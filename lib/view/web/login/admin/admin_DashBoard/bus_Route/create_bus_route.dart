import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class CreateBusRoute extends StatefulWidget {
  const CreateBusRoute({super.key});

  @override
  State<CreateBusRoute> createState() => _CreateBusRouteState();
}

final formKey = GlobalKey<FormState>();

class _CreateBusRouteState extends State<CreateBusRoute> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: adminePrimayColor,
     
      body: ListView(children: [
        Row(
          children: [
           
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
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
                        SizedBox(
                          height: size.width / 20,
                        ),
                        Text(
                          'Create Your Bus Route',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                  
                        SizedBox(
                          height: size.width / 5,
                          width: size.width / 2,
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
                ],
              ),
            ),
            SizedBox(
                width: size.width * 1 / 2,
                height: size.height,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width / 10, right: size.width / 10),
                      child: Column(children: [

                        BusRouteTextFormWidget(
                          function: checkFieldEmpty,
                          labelText: 'Route Number',
                          icon: Icons.route_outlined,
                        ),

                        BusRouteTextFormWidget(
                          function: checkFieldEmpty,
                          labelText: 'Bus Number',
                          icon: Icons.bus_alert,
                        ),

                        BusRouteTextFormWidget(
                          function: checkFieldPhoneNumberIsValid,
                          labelText: 'Driver Mobile Number',
                          icon: Icons.phone_android_sharp,
                        ),

                        BusRouteTextFormWidget(
                          function: checkFieldPhoneNumberIsValid,
                          labelText: 'Assistance Mobile Number',
                          icon: Icons.phone_android,
                        ),

                        BusRouteTextFormWidget(
                          function: checkFieldEmpty,
                          labelText: 'Staff inCharge',
                          icon: Icons.person_2,
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 1 / 20,
                                right: size.width * 1 / 20),
                            child: Container(
                              height: size.width * 1 / 30,
                              width: size.width * 1 / 9,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(14)),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(9.0),
                                  textStyle: const TextStyle(fontSize: 17),
                                ),
                                onPressed: () async {
                                  bool? result =
                                      formKey.currentState?.validate();
                                },
                                child: const Text('Create'),
                              ),
                            )),
                      ]),
                    ),
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}

class BusRouteTextFormWidget extends StatelessWidget {
  BusRouteTextFormWidget({
    super.key,
    required this.labelText,
    // required this.textEditingController,
    required this.function,
    required this.icon,
  });
// final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: function,
        // controller: textEditingController,
        decoration: InputDecoration(fillColor: cWhite,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon: Icon(
            icon,
            color: cBlack
            //Color.fromARGB(221, 28, 9, 110),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}

































// Column(
//                                                       children: [
//                                                       Padding(
//                                                         padding: EdgeInsets.all(15),
//                                                         child: TextFormField(
                                                          
//                                                           decoration: InputDecoration(
//                                                             border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
//                                                             icon: Icon(Icons.route_outlined,color: Color.fromARGB(255, 19, 7, 134)),
//                                                             labelText: 'Route Number',
//                                                           ),
//                                                         ),
//                                                       ),
                                                      
//                                                       Padding(
//                                                         padding: EdgeInsets.all(15),
//                                                         child: TextFormField(
                                                         
//                                                           decoration: InputDecoration(
//                                                             border: OutlineInputBorder(
//                                                                borderRadius: BorderRadius.circular(20)
//                                                             ),
//                                                              icon: Icon(Icons.bus_alert,color: Color.fromARGB(255, 19, 7, 134)),
//                                                             labelText: 'Bus Number',
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding: EdgeInsets.all(15),
//                                                         child: TextFormField(
                                                          
//                                                           decoration: InputDecoration(
//                                                             border: OutlineInputBorder(
//                                                                borderRadius: BorderRadius.circular(20)
//                                                             ),
//                                                              icon: Icon(Icons.phone_android_sharp,color: Color.fromARGB(255, 19, 7, 134)),
//                                                             labelText: 'Driver Mobile Number',
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding: EdgeInsets.all(15),
//                                                         child: TextFormField(
//                                                           decoration: InputDecoration(
//                                                             border: OutlineInputBorder(
//                                                                borderRadius: BorderRadius.circular(20)
//                                                             ),
//                                                              icon: Icon(Icons.phone_android,color: Color.fromARGB(255, 19, 7, 134)),
//                                                             labelText: 'Assistnce Mobile Number',
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding: EdgeInsets.all(15),
//                                                         child: TextFormField(
//                                                           decoration: InputDecoration(
//                                                             border: OutlineInputBorder(
//                                                                borderRadius: BorderRadius.circular(20)
//                                                             ),
//                                                              icon: Icon(Icons.person_2,color: Color.fromARGB(255, 19, 7, 134)),
//                                                             labelText: 'Staff in Charge',
//                                                           ),
//                                                         ),
//                                                       ),
                                                     
                                                      
//                                                       SizedBox(
//                                                         height: 30,),
//                                                       InkWell(
//                                                         onTap: () {
//                                                         //  Navigator.push
//                                                         //                 (context, MaterialPageRoute
//                                                         //                 (builder: 
//                                                         //                 ((context) =>  )));
//                                                       },
//                                                         child: Container(
//                                                               height: size.width * 1 / 30,
//                                                               width: size.width * 1 / 5,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors.blue,
//                                                                   borderRadius: BorderRadius.circular(14)),
//                                                               child: TextButton(
//                                                                 style: TextButton.styleFrom(
//                                                                   foregroundColor: Color.fromARGB(255, 255, 255, 255),
//                                                                   padding: const EdgeInsets.all(9.0),
//                                                                   textStyle: const TextStyle(fontSize: 17),
//                                                                 ),
//                                                                 onPressed: () {},
//                                                                 child: const Text('Create'),
//                                                               ),
//                                                             ),
//                                                       ),
                                                      
//                                                     ]),