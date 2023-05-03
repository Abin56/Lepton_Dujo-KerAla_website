import 'dart:developer';

import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../controller/text_form_hide/password_filed.dart';
import '../../../colors/colors.dart';
import '../../../constant/constant.dart';
import '../../../fonts/fonts.dart';
import '../../../icons/icons.dart';
import '../../widgets/responsive.dart';

// ignore: must_be_immutable
class AdminLoginScreen extends StatelessWidget {
  String? adminSchoolId;
  //
  final _hideGetxController = Get.put(PasswordField());
  String adminpassword = '';
  AdminLoginScreenController adminLoginScreenController =
      Get.put(AdminLoginScreenController());
  GetFireBaseData getFireBaseData = Get.put(GetFireBaseData());

  //
  AdminLoginScreen({this.adminSchoolId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: cWhite),
          backgroundColor: Color.fromARGB(255, 74, 3, 107)),
      backgroundColor: Color.fromARGB(255, 74, 3, 107),
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: const Color.fromARGB(255, 74, 3, 107),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hi ! \n Admin',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          sizedBoxH30,
                          SizedBox(
                            height: 400.h,
                            child: LottieBuilder.network(
                                'https://assets10.lottiefiles.com/packages/lf20_q0vtqaxf.json'),
                          )
                        ],
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.15),
                color: Color.fromARGB(255, 74, 3, 107),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Let’s',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: cWhite,
                                  // AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: cWhite,
                                // AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: cWhite,
                          //AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Admin ID',
                          style: ralewayStyle.copyWith(
                            fontSize: 15.0,
                            color: cWhite,
                            // AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: Obx(
                          () => TextFormField(
                            controller:
                                adminLoginScreenController.schoolIdController,
                            obscureText:
                                _hideGetxController.isObscurefirst.value,
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor,
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.emailIcon),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _hideGetxController.isObscurefirst.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                onPressed: () {
                                  _hideGetxController.toggleObscureFirst();
                                },
                              ),
                              contentPadding: const EdgeInsets.only(top: 16.0),
                              hintText: 'Enter your ID',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: ralewayStyle.copyWith(
                            fontSize: 15.0,
                            color: cWhite,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: Obx(
                          () => TextFormField(
                            controller:
                                adminLoginScreenController.passwordController,
                            obscureText:
                                _hideGetxController.isObscureSecond.value,
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor,
                              fontSize: 15.0,
                            ),
                            // obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.lockIcon),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _hideGetxController.isObscureSecond.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                onPressed: () {
                                  _hideGetxController.toggleObscureSecond();
                                },
                              ),
                              contentPadding: const EdgeInsets.only(top: 16.0),
                              hintText: 'Enter Password',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: ralewayStyle.copyWith(
                              fontSize: 15.0,
                              color: cWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            await adminLoginScreenController.loginFunction(
                              context,
                            );

                
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: cWhite,
                            ),
                            child: Text(
                              'Sign In',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 58, 18, 238),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void errorBox(context, e) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(e.toString()),
        );
      });
}
