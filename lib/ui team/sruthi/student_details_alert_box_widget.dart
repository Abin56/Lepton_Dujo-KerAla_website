import 'package:dujo_kerala_website/ui%20team/sruthi/parent_guardian_alert_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/colors/colors.dart';
import '../../view/constant/constant.dart';
import '../../view/web/login/admin/admin_DashBoard/all_Students/search_students.dart';
import '../../view/web/widgets/Iconbackbutton.dart';

class Student_Details_AlertBox_Widget extends StatelessWidget {
  const Student_Details_AlertBox_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Container(
          color: adminePrimayColor,
          child: Row(
            children: [

              IconButtonBackWidget(color:cWhite ),
              Text(' Student Details',
                  style: GoogleFonts.poppins(fontSize: 16.h, color: cWhite)),
            ],
          )),
      content: Container(
        width: 600,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        color: adminePrimayColor,
                        child: Center(
                          child: Text(' Personal Info ',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.h, color: cWhite)),
                        )),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Name :Anu',),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Class :8 B'),
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'Adm.No:9094'),
                    
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'Gender : Female'),
                    
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'Blood Group :B -ve'),
                    
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'Email : Anu@gmail.com'),
                    
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'House Name : New House'),
                   
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'Place :Kochi'),
                    
                    sizedBoxH20,
                      Student_Info_text_Widget(text: 'District: Ernakulam'),
                    
                    sizedBoxH20,
                      Student_Info_text_Widget(text: "State : Kerala"),
                    
                    sizedBoxH20,
                  ],
                ),
                sizedBoxw40,
                Column(
                  children: [
                    Container(
                        width: 300,
                        height: 380,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(0.3),),
                        child: Column(children: [
                          Container(
                              color: adminePrimayColor,
                              child: Text(' Academics Info ',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.h, color: cWhite))),
                          const ListTile(
                            leading: Icon(Icons.class_),
                            title: Student_Info_text_Widget(text: "Class"),
                            subtitle: Student_Info_text_Widget(text: "10 : B"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.person),
                            title: Student_Info_text_Widget(text: "Class Incharge"),
                            subtitle: Student_Info_text_Widget(text: "Nenna"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.format_list_numbered),
                            title: Student_Info_text_Widget(text: "Admission No"),
                            subtitle: Student_Info_text_Widget(text: "7458"),
                          ),
                          sizedBoxH20,
                          Student_Info_Elevated_button_Widget(text: 'Generate TC', onPressed: () {  },),
                          sizedBoxH20,
                          Student_Info_Elevated_button_Widget(text: 'Shift Class', onPressed: () {  },),
                          sizedBoxH20,
                          Student_Info_Elevated_button_Widget(text: 'Generate Summary', onPressed: () {  },),
                           
                          
                        ]))
                  ],
                )
              ],
            ),

           
          ],
        ),
      ),
      actions: [
  Student_Info_Elevated_button_Widget(text: ('Parent Info'), onPressed: () { _showParentAlertbox(context); }, ),

        
        Student_Info_Elevated_button_Widget(text: ('Guardian Info'), onPressed: () { _showGuardianAlertbox(context); }, 
        ),
  
         Student_Info_Elevated_button_Widget(onPressed: () { Navigator.of(context).pop(); }, text: 'Cancel',),
      ],
    );
  }
}
void _showParentAlertbox(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Parent_Guardian_Alert_box_Widget(text: 'Parent Info',),
  );
}
void _showGuardianAlertbox(BuildContext context) {
  showDialog(
     barrierDismissible: false,
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

