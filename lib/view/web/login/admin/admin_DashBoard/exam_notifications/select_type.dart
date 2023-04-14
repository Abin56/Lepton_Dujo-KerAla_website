
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/exam_notifications/school_notifications.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/exam_notifications/state_level_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectType extends StatefulWidget {
   SelectType({super.key, required this.schoolID}); 

  String schoolID;

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  @override
  Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector( 
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => SchoolLevelNotifications(schoolID: widget.schoolID))));
              },
              child: SizedBox(
                 width: screenSize.width/3, 
                height: screenSize.height/3,
                child: Card( 
                   
                   color: Color.fromARGB(255, 68, 165, 245), 
                
                  child: Center(child: Text('School Level Examinations',  style: GoogleFonts.poppins(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))),
                ),
              ),
            ), SizedBox(height: 30,),
            GestureDetector( 
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => StateLevelNotifications())));
              },
              child: SizedBox(
                 width: screenSize.width/3, 
                height: screenSize.height/3,
                child: Card(  
                   
                 color: Color.fromARGB(255, 245, 86, 75), 
                
                  child: Center(child: Text('State Level Examinations', style: GoogleFonts.poppins(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),
      ),
     );
}
}