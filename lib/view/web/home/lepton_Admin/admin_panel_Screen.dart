import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'admin_home_screen.dart';

class LeptonAdminLoginScreen extends StatelessWidget {
  LeptonAdminLoginScreen({Key? key}) : super(key: key);

  final _hideGetxController = Get.put(PasswordField());
  String adminpassword = '';
  

  final TextEditingController _leptonIdController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child:
           
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveWidget.isSmallScreen(context)
                    ?  const SizedBox()
                    : Expanded(
                        child: Container(
                          height: height,
                          color: const Color.fromARGB(255, 6, 71, 157),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               IconButtonBackWidget(color: cWhite,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hi !  Admin',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 45.0.w,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  sizedBoxH30,
                                  SizedBox(
                                    height: 350.h,
                                    child: LottieBuilder.network(
                                        'https://assets10.lottiefiles.com/packages/lf20_q0vtqaxf.json'),
                                  )
                                ],
                              ),
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
                            : height * 0.12),
                    color: AppColors.backColor,
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
                                      color: AppColors.blueDarkColor,
                                      fontWeight: FontWeight.normal,
                                    )),
                                TextSpan(
                                  text: ' Sign In 👇',
                                  style: ralewayStyle.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blueDarkColor,
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
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(height: height * 0.064),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Admin ID',
                              style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                color: AppColors.blueDarkColor,
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
                            child:
                            TextFormField(
                              controller: _leptonIdController,
                             
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor,
                                fontSize: 12.0,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppIcons.emailIcon),
                                ),
                                
                                contentPadding: const EdgeInsets.only(top: 16.0),
                                hintText: 'Enter your ID',
                                hintStyle: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueDarkColor.withOpacity(0.5),
                                  fontSize: 12.0,
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
                                fontSize: 12.0,
                                color: AppColors.blueDarkColor,
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
                            child: Obx(() => 
                            TextFormField(
                              controller: passwordController,
                              obscureText:_hideGetxController.isObscureSecond.value,
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor,
                                fontSize: 12.0,
                              ),
                             // obscureText: true,
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
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            )
                          ),
                          SizedBox(height: height * 0.03),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: ralewayStyle.copyWith(
                                  fontSize: 12.0,
                                  color: AppColors.mainBlueColor,
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
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _leptonIdController.text.trim(),
                                          password: passwordController.text.trim())
                                      .then(
                                        (value) => Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return const LeptonHomePage();
                                        },),),
                                      );
                                  // .then((value) => Get.to(SchoolStudentHomeNew(
                                  //       schoolID: schoolId,
                                  //       classID: classID,
                                  //       studentEmailid: emailController.text.trim(),
                                  //     )));
                                } catch (e) {
                                  errorBox(context, e);
                                }
                              },
                              borderRadius: BorderRadius.circular(16.0),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70.0, vertical: 18.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: const Color.fromARGB(255, 6, 71, 157),
                                ),
                                child: Text(
                                  'Sign In',
                                  style: ralewayStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whiteColor,
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
        return const AlertDialog(
          title: Text("Error"),
          content: Text( "Something Went Wrong"),
        );
      });
}
