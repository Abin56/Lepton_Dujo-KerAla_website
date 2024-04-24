 
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/web/login/student/graph/total_result_progress.dart';
import 'package:flutter/material.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';

class MyStudyProgressStdContainerWidget extends StatelessWidget {
  const MyStudyProgressStdContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      //width: ResponsiveWebSite.isTablet(context)?MediaQuery.of(context).size.width/3.2 :ResponsiveWebSite.isMobile(context)? double.infinity: 300,
       color: Colors.white,
      
      child:
        AspectRatio(
          aspectRatio: ResponsiveWebSite.isMobile(context)? 2/1 : 1/1,
          child: const Column(
           children: [
            Padding(
              padding: EdgeInsets.only(left: 5,top: 10,bottom: 10),
              child: TextFontWidget(text: "My Study Progress", 
              fontsize: 16,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 57,87,254,),),
            ),
             Padding(
               padding: EdgeInsets.all(10),
               child: StudentTotalExamResultProgressChart(),
             ),
           ],
                 ),
        ),
    );
  }
}