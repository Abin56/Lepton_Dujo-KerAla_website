
// import 'package:dash_board/view/fonts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SubjectWiseProgressBarStd extends StatefulWidget {
  const  SubjectWiseProgressBarStd({super.key});

  @override
  SubjectWiseProgressBarStdState createState() => SubjectWiseProgressBarStdState();
}

class SubjectWiseProgressBarStdState extends State<SubjectWiseProgressBarStd> {

  
  @override
  Widget build(BuildContext context) {
    return 
        const Column(
          children: [
            SizedBox(
              height: 40,
              child: 
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: TextFontWidget(text: 'Subject Wise Progress', fontsize: 14,fontWeight: FontWeight.w700,),
                )
              ,
            ),
             Expanded(
               child: Padding(
                 padding: EdgeInsets.only(bottom: 25),
                 child: SizedBox(
                   child: SingleChildScrollView(
                     child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         LinearBarContainerWidget(trailing: Text("80%"),percent: 0.8, child: Text("Malayalam")),
                         LinearBarContainerWidget(trailing: Text("70%"), percent:  0.7,child: Text("English   "),),
                         LinearBarContainerWidget(trailing: Text("30%"), percent:  0.3,child: Text("social"),),
                         LinearBarContainerWidget(trailing: Text("40%"), percent: 0.4, child: Text("Science")),
                         LinearBarContainerWidget(trailing: Text("60%"), percent: 0.6, child: Text("Maths")),
                         LinearBarContainerWidget(trailing: Text("80%"),percent: 0.8, child: Text("Malayalam")),
                         LinearBarContainerWidget(trailing: Text("70%"), percent:  0.7,child: Text("English   "),),
                         LinearBarContainerWidget(trailing: Text("30%"), percent:  0.3,child: Text("social"),),
                         LinearBarContainerWidget(trailing: Text("40%"), percent: 0.4, child: Text("Science")),
                         LinearBarContainerWidget(trailing: Text("60%"), percent: 0.6, child: Text("Maths")),
                        
                       ],
                     ),
                   ),
                 ),
               ),
             ),
          ],
        );
    
  }
}

class LinearBarContainerWidget extends StatelessWidget {
 
 
  final Widget trailing;
  final double percent;
  final Widget child;
   const LinearBarContainerWidget({
   
  
    required this.trailing,
    required this.percent,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
      child: LinearPercentIndicator(
        animation: true,
        animationDuration: 1000,
        lineHeight: 20.0,
        leading: SizedBox(width: 75,height: 20,child: child,),
        trailing: trailing,
        percent: percent,
        //center: const Text("20.0%"),
        linearStrokeCap: LinearStrokeCap.butt,
        progressColor:Colors.greenAccent,
      ),
    );
  }
}

