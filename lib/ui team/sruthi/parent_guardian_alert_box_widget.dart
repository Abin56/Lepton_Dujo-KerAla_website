import 'package:dujo_kerala_website/ui%20team/sruthi/student_details_alert_box_widget.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/colors/colors.dart';
import '../../view/constant/constant.dart';

class Parent_Guardian_Alert_box_Widget extends StatelessWidget {
  const Parent_Guardian_Alert_box_Widget({
    super.key,
        required this.text,

  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,height: 500,
      child: AlertDialog(
        title: Container(
     
            color: adminePrimayColor,
            child: Row(
              children: [
                IconButtonBackWidget(color: cWhite),
                Text('Parent Details',
                    style: GoogleFonts.poppins(fontSize: 16.h, color: cWhite)),
              ],
            )),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                  )
                ],
              ),
            ),
                    Student_Info_text_Widget(text: "Name : Anu"),
            sizedBoxH10,
    
          Student_Info_text_Widget(text: "Phone No. :9654781287"),
    
            sizedBoxH10,
                    Student_Info_text_Widget(text: "Gender :Female"),
            sizedBoxH10,
    
                   Student_Info_text_Widget(text: "Blood Group :B -ve"),
            sizedBoxH10,
    
                   Student_Info_text_Widget(text: "Email :anu@gmail.com"),
            sizedBoxH10,
                    Student_Info_text_Widget(text: "House Name :New HOme"),
            sizedBoxH10,
    
                    Student_Info_text_Widget(text: "Place :Kochi"),
            sizedBoxH10,
                    Student_Info_text_Widget(text: "District :Ernakulam"),
    
            sizedBoxH10,
                   Student_Info_text_Widget(text: "State :Kerala"),
            sizedBoxH10,
    
    
          ],
        ),
        actions: [
     Student_Info_Elevated_button_Widget(onPressed: () { Navigator.of(context).pop(); }, text: 'Cancel',)
    
         ] ),
    );
      
      
    
  }
}

class Student_Info_Elevated_button_Widget extends StatelessWidget {
  const Student_Info_Elevated_button_Widget({
    super.key,
    required this.text,
    required this.onPressed

 
  });
final String text;
 final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onPressed,style: ElevatedButton.styleFrom(
    backgroundColor: adminePrimayColor, // Background color
  ),
            child: Text(text));
  }
}

class Student_Info_text_Widget extends StatelessWidget {
  const Student_Info_text_Widget({
    super.key,
    required this.text
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(fontSize: 14));
  }
}
void _showParentAlertbox(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Parent_Guardian_Alert_box_Widget(text: 'Parent Info',),
  );
}
void _showGuardianAlertbox(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Parent_Guardian_Alert_box_Widget(text: 'Parent Info',),
  );
}

void _showAlert(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (context) => Student_Details_AlertBox_Widget(),
  );
}


