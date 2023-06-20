import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view/web/widgets/Iconbackbutton.dart';
import '../../../view/web/widgets/loginorCreateButton.dart';

class NewAllLogin extends StatelessWidget {
  const NewAllLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(backgroundColor: adminePrimayColor,
    //  title: Text("Login Screen")),
    // backgroundColor: Color.fromARGB(255, 20, 35, 82),
      body:
     Container(
     // width: double.infinity,
      
       child: Stack(
         children: [
          SizedBox(
            width: double.infinity,
          height: 1200.h,
          child: Image.asset("assets/images/login bg.jpg",fit: BoxFit.cover)),
           Container(
            
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                IconButtonBackWidget(color: cWhite),
                 Column(
                  children: [
               Container(
                  margin: EdgeInsets.only(left: 70.w,
                  top: 60.w
                  ),
                 // height: ,
                  width: double.infinity.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    
                        Container(
                          
                   height: 550.h,
                   width: 450.w,
                   decoration: BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(20)),border: Border.all(color: cWhite),
                     color:  Colors.transparent
                     ),
                     child: 
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                          Text(
                          'Class Teacher',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0.w,
                            color: cWhite,
                            // AppColors.blueDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH10,
                        RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Let’s',
                                            style: ralewayStyle.copyWith(
                                              fontSize: 25.0.w,
                                              color:
                                              cWhite,
                                              // cBlack,
                                             //  AppColors.blueDarkColor,
                                              fontWeight: FontWeight.normal,
                                            )),
                                        TextSpan(
                                          text: " Sign In 👇",
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color:
                                            cWhite,
                                            // cBlack, 
                                            // AppColors.blueDarkColor,
                                            fontSize: 25.0.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                
                                    Text(
                                    'Hey, Enter your details to get sign in \nto your account.',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 15.0.w,
                                      fontWeight: FontWeight.w400,
                                      color: cWhite,
                                       //AppColors.textColor,
                                    ),
                                  ),
                
                        //  GoogleMonstserratWidgets(
                        //   text: 'Admin Login',
                        //   color: cBlack,fontsize: 20,),
                
                      
                          Container(
                            margin: EdgeInsets.only(left: 50.w,right: 50.w,),
                                    height: 50.0.w,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: cWhite),
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: AppColors.whiteColor,
                                    ),
                                    child:
                                    // Obx(
                                     // () => 
                                      TextFormField(
                                        // controller:
                                        //     adminLoginScreenController.schoolIdController,
                                        // obscureText:
                                        //     _hideGetxController.isObscurefirst.value,
                                        style: ralewayStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blueDarkColor,
                                          fontSize: 15.0.w,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(AppIcons.emailIcon),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.visibility,),
                                              //  _hideGetxController.isObscurefirst.value
                                               //     ? Icons.visibility_off
                                                 //   : Icons.visibility),
                                           onPressed: () {
                                             // _hideGetxController.toggleObscureFirst();
                                            },
                                          ),
                                          contentPadding: const EdgeInsets.only(top: 16.0),
                                          hintText: 'Enter your ID',
                                          hintStyle: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blueDarkColor.withOpacity(0.5),
                                            fontSize: 15.0.w,
                                          ),
                                          // onPressed: () {  },
                                        ),
                                      ),
                                   // ),
                                  ),
                
                                    Text(
                                      'Password',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 15.0.w,
                                        color: cWhite,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                                    child: Container(
                                      height: 50.0.w,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: cWhite),
                                        borderRadius: BorderRadius.circular(16.0),
                                        color: AppColors.whiteColor,
                                      ),
                                      child:
                                      // Obx(
                                       // () =>
                                        TextFormField(
                                        //  controller:
                                             // adminLoginScreenController.passwordController,
                                        //  obscureText:
                                              //_hideGetxController.isObscureSecond.value,
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blueDarkColor,
                                            fontSize: 15.0.w,
                                          ),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(AppIcons.lockIcon),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                //  _hideGetxController.isObscureSecond.value
                                                   //   ? 
                                                      Icons.visibility_off),
                                                     // : Icons.visibility),
                                              onPressed: () {
                                                //_hideGetxController.toggleObscureSecond();
                                              },
                                            ),
                                            contentPadding: const EdgeInsets.only(top: 16.0),
                                            hintText: 'Enter Password',
                                            hintStyle: ralewayStyle.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blueDarkColor.withOpacity(0.5),
                                              fontSize: 15.0.w,
                                            ),
                                          ),
                                        ),
                                     // ),
                                    ),
                                  ),
                           sizedBoxH10,
                
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child:
                           LoginOrCreateButton(text: 'Login',))
                       ],
                     ),
                  ),
                  sizedBoxw20,
                  
                  
                
                
                
                
                
                
                
                  Container(          
                   height: 550.h,
                   width: 450.w,
                   decoration: BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(20)),border: Border.all(color: cWhite),
                     color:  Colors.transparent,
                     ),
                     child: 
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                           Text(
                          'Admin',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0.w,
                            color: cWhite,
                            // AppColors.blueDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH10,
                        RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Let’s',
                                            style: ralewayStyle.copyWith(
                                              fontSize: 25.0.w,
                                              color:
                                              cWhite,
                                              // cBlack,
                                             //  AppColors.blueDarkColor,
                                              fontWeight: FontWeight.normal,
                                            )),
                                        TextSpan(
                                          text: " Sign In 👇",
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color:
                                            cWhite,
                                            // cBlack, 
                                            // AppColors.blueDarkColor,
                                            fontSize: 25.0.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                
                                    Text(
                                    'Hey, Enter your details to get sign in \nto your account.',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 15.0.w,
                                      fontWeight: FontWeight.w400,
                                      color: cWhite,
                                       //AppColors.textColor,
                                    ),
                                  ),
                
                        //  GoogleMonstserratWidgets(
                        //   text: 'Admin Login',
                        //   color: cBlack,fontsize: 20,),
                
                     
                          Container(
                            margin: EdgeInsets.only(left: 50.w,right: 50.w,),
                                    height: 50.0.w,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: cWhite),
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: AppColors.whiteColor,
                                    ),
                                    child:
                                    // Obx(
                                     // () => 
                                      TextFormField(
                                        // controller:
                                        //    
                                        // obscureText:
                                        //     _hideGetxController.isObscurefirst.value,
                                        style: ralewayStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.mainBlueColor,
                                          fontSize: 15.0.w,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(AppIcons.emailIcon),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.visibility,),
                                              //  _hideGetxController.isObscurefirst.value
                                               //     ? Icons.visibility_off
                                                 //   : Icons.visibility),
                                           onPressed: () {
                                             // _hideGetxController.toggleObscureFirst();
                                            },
                                          ),
                                          contentPadding: const EdgeInsets.only(top: 16.0),
                                          hintText: 'Enter ClassTeacher ID',
                                          hintStyle: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blueDarkColor.withOpacity(0.5),
                                            fontSize: 15.0.w,
                                          ),
                                          // onPressed: () {  },
                                        ),
                                      ),
                                   // ),
                                  ),
                
                                    Text(
                                      'Password',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 15.0.w,
                                        color: cWhite,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                                    child: Container(
                                      height: 50.0.w,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: cWhite),
                                        borderRadius: BorderRadius.circular(16.0),
                                        color: AppColors.whiteColor,
                                      ),
                                      child:
                                      // Obx(
                                       // () =>
                                        TextFormField(
                                        //  controller:
                                             // 
                                        //  obscureText:
                                              //_hideGetxController.isObscureSecond.value,
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blueDarkColor,
                                            fontSize: 15.0.w,
                                          ),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(AppIcons.lockIcon),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                //  _hideGetxController.isObscureSecond.value
                                                   //   ? 
                                                      Icons.visibility_off),
                                                     // : Icons.visibility),
                                              onPressed: () {
                                                //_hideGetxController.toggleObscureSecond();
                                              },
                                            ),
                                            contentPadding: const EdgeInsets.only(top: 16.0),
                                            hintText: 'Enter Password',
                                            hintStyle: ralewayStyle.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blueDarkColor.withOpacity(0.5),
                                              fontSize: 15.0.w,
                                            ),
                                          ),
                                        ),
                                     // ),
                                    ),
                                  ),
                           sizedBoxH10,
                
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child:
                           LoginOrCreateButton(text: 'Login',))
                       ],
                     ),
                  ),
                     sizedBoxw20,  
                
                
                
                
                
                
                
                  Container(
                          
                   height: 550.h,
                   width: 450.w,
                   decoration: BoxDecoration(
                     borderRadius: const BorderRadius.all(Radius.circular(20)),border: Border.all(color: cWhite),
                     color:  Colors.transparent
                     ),
                     child: 
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text(
                          'Teacher',
                          style: ralewayStyle.copyWith(
                            fontSize: 25.0.w,
                            color: cWhite,
                            // AppColors.blueDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBoxH10,
                        RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Let’s',
                                            style: ralewayStyle.copyWith(
                                              fontSize: 25.0.w,
                                              color:
                                              cWhite,
                                              // cBlack,
                                             //  AppColors.blueDarkColor,
                                              fontWeight: FontWeight.normal,
                                            )),
                                        TextSpan(
                                          text: " Sign In 👇",
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color:
                                            cWhite,
                                            // cBlack, 
                                            // AppColors.blueDarkColor,
                                            fontSize: 25.0.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                
                                    Text(
                                    'Hey, Enter your details to get sign in \nto your account.',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 15.0.w,
                                      fontWeight: FontWeight.w400,
                                      color: cWhite,
                                       //AppColors.textColor,
                                    ),
                                  ),
                
                        //  GoogleMonstserratWidgets(
                        //   text: 'Admin Login',
                        //   color: cBlack,fontsize: 20,),
                
                       
                          Container(
                            margin: EdgeInsets.only(left: 50.w,right: 50.w,),
                                    height: 50.0.w,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: cWhite),
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: AppColors.whiteColor,
                                    ),
                                    child:
                                    // Obx(
                                     // () => 
                                      TextFormField(
                                        // controller:
                                        //     adminLoginScreenController.schoolIdController,
                                        // obscureText:
                                        //     _hideGetxController.isObscurefirst.value,
                                        style: ralewayStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blueDarkColor,
                                          fontSize: 15.0.w,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(AppIcons.emailIcon),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.visibility,),
                                              //  _hideGetxController.isObscurefirst.value
                                               //     ? Icons.visibility_off
                                                 //   : Icons.visibility),
                                           onPressed: () {
                                             // _hideGetxController.toggleObscureFirst();
                                            },
                                          ),
                                          contentPadding: const EdgeInsets.only(top: 16.0),
                                          hintText: 'Enter your Teacher ID',
                                          hintStyle: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blueDarkColor.withOpacity(0.5),
                                            fontSize: 15.0.w,
                                          ),
                                          // onPressed: () {  },
                                        ),
                                      ),
                                   // ),
                                  ),
                
                                    Text(
                                      'Password',
                                      style: ralewayStyle.copyWith(
                                        fontSize: 15.0.w,
                                        color: cWhite,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                                    child: Container(
                                      height: 50.0.w,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: cWhite),
                                        borderRadius: BorderRadius.circular(16.0),
                                        color: AppColors.whiteColor,
                                      ),
                                      child:
                                      // Obx(
                                       // () =>
                                        TextFormField(
                                        //  controller:
                                             // adminLoginScreenController.passwordController,
                                        //  obscureText:
                                              //_hideGetxController.isObscureSecond.value,
                                          style: ralewayStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blueDarkColor,
                                            fontSize: 15.0.w,
                                          ),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(AppIcons.lockIcon),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                //  _hideGetxController.isObscureSecond.value
                                                   //   ? 
                                                      Icons.visibility_off),
                                                     // : Icons.visibility),
                                              onPressed: () {
                                                //_hideGetxController.toggleObscureSecond();
                                              },
                                            ),
                                            contentPadding: const EdgeInsets.only(top: 16.0),
                                            hintText: 'Enter Password',
                                            hintStyle: ralewayStyle.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blueDarkColor.withOpacity(0.5),
                                              fontSize: 15.0.w,
                                            ),
                                          ),
                                        ),
                                     // ),
                                    ),
                                  ),
                           sizedBoxH10,
                
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child:
                           LoginOrCreateButton(text: 'Login',))
                       ],
                     ),
                  ),
                     
                      ],
                    ),
                  ),
               ),
             ]  ),
               ],
             ),
           ),
         ],
       ),
     ),
    
    );
  }
}






class MainLoginTextFormField extends StatelessWidget {
  const MainLoginTextFormField({
    super.key,
    required this.labelText,
  ///  required this.textEditingController,
    required this.function,
    
  });
// final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String? fieldContent) function;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: function,
        // controller: textEditingController,
        decoration: InputDecoration(fillColor: cWhite,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
         
          labelText: labelText,labelStyle: TextStyle(fontSize: 20.w),
        ),
      ),
    );
  }
}