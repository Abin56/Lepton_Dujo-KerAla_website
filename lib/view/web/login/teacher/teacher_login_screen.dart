import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/text_form_hide/password_filed.dart';
import '../../../colors/colors.dart';
import '../../../constant/constant.dart';
import '../../../fonts/fonts.dart';
import '../../../icons/icons.dart';
import '../../widgets/responsive.dart';

class TeacherLoginScreen extends StatelessWidget {
  final _hideGetxController = Get.put(PasswordField());
  String adminpassword = '';
   TeacherLoginScreen({Key? key}) : super(key: key);
   TextEditingController teacheridController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
    
      appBar: AppBar(backgroundColor:  AppColors.mainBlueColor),
      backgroundColor: AppColors.mainBlueColor,
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
                      color: AppColors.mainBlueColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Teacher Login',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0.h,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          sizedBoxH30,
                          SizedBox(
                            height: 300.h,
                            child: LottieBuilder.network(
                                'https://assets3.lottiefiles.com/packages/lf20_8llqg59i.json'),
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
                color: AppColors.mainBlueColor,
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
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: cWhite,
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
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Teacher ID',
                          style: ralewayStyle.copyWith(
                            fontSize: 15.0,
                            color: AppColors.whiteColor,
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
                        child:  TextFormField(
                        //  controller: TextEditingController. teacheridController,
                            obscureText:
                                _hideGetxController.isObscurefirst.value,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: cBlack,
                            fontSize: 15.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.emailIcon),
                            ),
                              
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter ID',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 15.0,
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
                        child: TextFormField(
                           obscureText:
                           _hideGetxController.isObscureSecond.value,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: cBlack,
                            fontSize: 15.0,
                          ),
                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                           suffixIcon:  IconButton(
                            
                                                      icon: Icon(_hideGetxController
                                                              .isObscureSecond
                                                              .value
                                                          ? Icons.visibility_off
                                                          : Icons
                                                              .visibility),
                                                      onPressed: () {
                                                        _hideGetxController
                                                            .toggleObscureSecond();
                                                      },
                                                    ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.lockIcon),
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
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            // adminLoginScreenController.forgetPassWord(context);
                          },
                          child: Text(
                            'Forgot Password?/ Reset Password ?',
                            style: ralewayStyle.copyWith(
                              fontSize: 14.0,
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
                          onTap: () {
                            //          Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            //   builder: (context) => TeacherPannelAdmin(),
                            // ));
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
                                color:AppColors.mainBlueColor,
                                fontSize: 16.0.w,
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
