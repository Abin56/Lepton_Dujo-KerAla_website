import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view/web/widgets/loginorCreateButton.dart';

class DummyLogin extends StatelessWidget {
  const DummyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: adminePrimayColor,
     title: Text("Login Screen")),
      body:
     Column(
      children: [
    Container(
      margin: EdgeInsets.only(left: 70.w,top: 180.w),
     // height: ,
      width: double.infinity.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        
            Container(
              
       height: 400.h,
       width: 450.w,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(),
         //color: cBlue
         ),
         child: 
         Column(
           children: [
            sizedBoxH40,

             GoogleMonstserratWidgets(
              text: 'Admin Login',
              color: cBlack,fontsize: 20,),

             MainLoginTextFormField(
            //  textEditingController: ,
              function:checkFieldEmpty ,
              labelText: 'User Name',
              ),

             MainLoginTextFormField(
             //i textEditingController: ,
              function: checkFieldEmpty,
              labelText: 'Password',
              ),
               sizedBoxH40,
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
           
       height: 400.h,
       width: 450.w,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(),
        // color: cBlue
         ),
         child: 
         Column(
           children: [
            sizedBoxH40,
            GoogleMonstserratWidgets(
              text: 'Class Teacher Login',color: cBlack,fontsize: 20,),

             MainLoginTextFormField(
             // textEditingController: ,
              function:checkFieldEmpty ,
              labelText: 'User Name',
              ),

             MainLoginTextFormField(
             // textEditingController: ,
              function: checkFieldEmpty,
              labelText: 'Password',
              ),
               sizedBoxH40,
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
       height: 400.h,
       width: 450.w,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(),
       //  color: cBlue
         ),
         child: 
         Column(
           children: [
            sizedBoxH40,
            GoogleMonstserratWidgets(
              text: 'Teacher Login',color: cBlack,fontsize: 20,),

             MainLoginTextFormField(
             // textEditingController: ,

              function:checkFieldEmpty ,
              labelText: 'User Name',
              ),

             MainLoginTextFormField(
             // textEditingController: ,
              function: checkFieldEmpty,
              labelText: 'Password',
              ),

              sizedBoxH40,
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
    
    );
  }
}






class MainLoginTextFormField extends StatelessWidget {
  MainLoginTextFormField({
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
      padding: EdgeInsets.all(15),
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