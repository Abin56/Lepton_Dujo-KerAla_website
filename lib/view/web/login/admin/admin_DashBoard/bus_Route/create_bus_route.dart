import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/bus_route_controller/bus_route_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class CreateBusRoute extends StatelessWidget {
  CreateBusRoute({super.key});
  final TextEditingController routeController = TextEditingController();
  final TextEditingController busnumberController = TextEditingController();
  final TextEditingController driverphoneController = TextEditingController();
  final TextEditingController assistancephoneController =
      TextEditingController();
  final TextEditingController staffinchargeController = TextEditingController();
  final BusRouteController busRouteController = Get.put(BusRouteController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                        sizedBoxH20,
                        SizedBox(
                          height: size.width / 5,
                          width: size.width / 2,
                          child: LottieBuilder.network(
                              'https://assets3.lottiefiles.com/private_files/lf30_aav3tdzz.json'),
                        )
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
                            textEditingController: routeController,
                            function: checkFieldEmpty,
                            labelText: 'Route Number',
                            icon: Icons.route_outlined,
                          ),
                          BusRouteTextFormWidget(
                            textEditingController: busnumberController,
                            function: checkFieldEmpty,
                            labelText: 'Bus Number',
                            icon: Icons.bus_alert,
                          ),
                          BusRouteTextFormWidget(
                            textEditingController: driverphoneController,
                            function: checkFieldPhoneNumberIsValid,
                            labelText: 'Driver Mobile Number',
                            icon: Icons.phone_android_sharp,
                          ),
                          BusRouteTextFormWidget(
                            textEditingController: assistancephoneController,
                            function: checkFieldPhoneNumberIsValid,
                            labelText: 'Assistance Mobile Number',
                            icon: Icons.phone_android,
                          ),
                          BusRouteTextFormWidget(
                            textEditingController: staffinchargeController,
                            function: checkFieldEmpty,
                            labelText: 'Staff Incharge',
                            icon: Icons.person_2,
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
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    await busRouteController
                                        .createBusRoute(
                                            routeNumber: routeController.text,
                                            busNumber: busnumberController.text,
                                            driveMobNum:
                                                driverphoneController.text,
                                            assistantMobNum:
                                                assistancephoneController.text,
                                            staffInCharge:
                                                staffinchargeController.text)
                                        .then((value) {
                                      routeController.clear();
                                      busnumberController.clear();
                                      driverphoneController.clear();
                                      assistancephoneController.clear();
                                      staffinchargeController.clear();
                                    });
                                  }
                                },
                                child: Obx(() =>
                                    busRouteController.isLoading.value
                                        ? circularProgressIndicator
                                        : const Text('Create')),
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

final formKey = GlobalKey<FormState>();

class BusRouteTextFormWidget extends StatelessWidget {
  const BusRouteTextFormWidget({
    super.key,
    required this.labelText,
    required this.textEditingController,
    required this.function,
    required this.icon,
  });
  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: function,
        controller: textEditingController,
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
