// import 'package:dash_board/view/fonts/text_widget.dart';
// import 'package:dash_board/view/pages/home/users_panel/student_panel/pages/dash_board/sections/graph/total_result_progress.dart';
// import 'package:dash_board/view/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/student/graph/total_result_progress.dart';
import 'package:flutter/material.dart';
// import 'package:vidyaveechi_website/responsive.dart';

class StudentStudyProgress extends StatelessWidget {
  const StudentStudyProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: ResponsiveWebSite.isTablet(context)?MediaQuery.of(context).size.width/3 :ResponsiveWebSite.isMobile(context)? double.infinity: 300,
       color: Colors.white,
      
      child:
        Column(
         children: [
          Padding(
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            child: TextFontWidget(text: "My Study Progress", 
            fontsize: 16,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 57,87,254,),),
          ),
           const Padding(
             padding: EdgeInsets.all(10),
             child: StudentTotalExamResultProgressChart(),
           ),
         ],
       ),
    );
  }
}