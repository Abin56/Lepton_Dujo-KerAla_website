import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class CreateBusRoute extends StatefulWidget {
  const CreateBusRoute({super.key});
  //  TextEditingController routeController = TextEditingController();
  //   TextEditingController busnumberController = TextEditingController();
  //    TextEditingController driverphoneController = TextEditingController();
  //     TextEditingController assistancephoneController = TextEditingController();
  //      TextEditingController staffinchargeController = TextEditingController();

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
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ! Admin ',
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
                          'Create your bus route',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        sizedBoxH20,
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
                child: Container(
                  margin: EdgeInsets.only(top: 120.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: size.width / 10, right: size.width / 10),
                        child: Column(children: [
                          BusRouteTextFormWidget(
                            //  textEditingController:routeController,
                            function: checkFieldEmpty,
                            labelText: 'Route number',
                            icon: Icons.route_outlined,
                          ),
                          BusRouteTextFormWidget(
                            //textEditingController:busnumberController ,
                            function: checkFieldEmpty,
                            labelText: 'Bus number',
                            icon: Icons.bus_alert,
                          ),
                          BusRouteTextFormWidget(
                            // textEditingController:staffinchargeController ,
                            function: checkFieldEmpty,
                            labelText: 'Driver name',
                            icon: Icons.person_2,
                          ),
                          BusRouteTextFormWidget(
                            // textEditingController:driverphoneController,
                            function: checkFieldPhoneNumberIsValid,
                            labelText: 'Driver mobile number',
                            icon: Icons.phone_android_sharp,
                          ),
                          BusRouteTextFormWidget(
                            // textEditingController:staffinchargeController ,
                            function: checkFieldEmpty,
                            labelText: 'Assistance name',
                            icon: Icons.person_2,
                          ),
                          BusRouteTextFormWidget(
                            // textEditingController: assistancephoneController,
                            function: checkFieldPhoneNumberIsValid,
                            labelText: 'Assistance mobile number',
                            icon: Icons.phone_android,
                          ),
                          BusRouteTextFormWidget(
                            // textEditingController:staffinchargeController ,
                            function: checkFieldEmpty,
                            labelText: 'Staff incharge',
                            icon: Icons.person_2,
                          ),
                           BusRouteTextFormWidget(
                            // textEditingController: assistancephoneController,
                            function: checkFieldPhoneNumberIsValid,
                            labelText: 'Staff incharge number',
                            icon: Icons.phone_android,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: 40.w),
                              height: 60.w,
                              width: 300.w,
                              decoration: BoxDecoration(
                                  color: adminePrimayColor,
                                  borderRadius: BorderRadius.circular(14)),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(9.0),
                                  textStyle: const TextStyle(fontSize: 17),
                                ),
                                onPressed: () async {
                                  bool? result =
                                      formKey.currentState?.validate();
                                  if (result == true) {
                                  
                                    showToast(
                                        msg: 'Bus route successfully created ');
                                  }
                                },
                                child: const Text('Create'),
                              ),
                            ),
                          ),
                        ]),
                      ),
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
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: function,
        // controller: textEditingController,
        decoration: InputDecoration(
          fillColor: cWhite,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon: Icon(icon, color: cBlack
              //Color.fromARGB(221, 28, 9, 110),
              ),
          labelText: labelText,
        ),
      ),
    );
  }
}































