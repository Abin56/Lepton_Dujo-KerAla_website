import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// import '../../../../../../../../../fonts/text_widget.dart';

class SubjectWiseGraph extends StatefulWidget {
  const SubjectWiseGraph({super.key});

  @override
  SubjectWiseGraphState createState() => SubjectWiseGraphState();
}

class SubjectWiseGraphState extends State<SubjectWiseGraph> {
  @override
  Widget build(BuildContext context) {
    return   const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            child:  TextFontWidget(text: 'Student Study Progress', fontsize:18 ,fontWeight: FontWeight.bold,)
            ),
            LinearBarContainerWidget(
                trailing: Text("80%"),
                percent: 0.8,
                child: Text(
                  "Malayalam",
                  style: TextStyle(fontSize: 14),
                )),
            LinearBarContainerWidget(
              trailing: Text("70%"),
              percent: 0.7,
              child: Text("English   "),
            ),
            LinearBarContainerWidget(
              trailing: Text("30%"),
              percent: 0.3,
              child: Text("social"),
            ),
            LinearBarContainerWidget(
                trailing: Text("40%"), percent: 0.4, child: Text("Science")),
            LinearBarContainerWidget(
                trailing: Text("60%"), percent: 0.6, child: Text("Maths")),
            LinearBarContainerWidget(
                trailing: Text("80%"), percent: 0.8, child: Text("Malayalam")),
            LinearBarContainerWidget(
              trailing: Text("70%"),
              percent: 0.7,
              child: Text("English   "),
            ),
            LinearBarContainerWidget(
              trailing: Text("30%"),
              percent: 0.3,
              child: Text("social"),
            ),
            LinearBarContainerWidget(
                trailing: Text("40%"), percent: 0.4, child: Text("Science")),
            LinearBarContainerWidget(
                trailing: Text("60%"), percent: 0.6, child: Text("Maths")),
          ],
        ),
      ),
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
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: LinearPercentIndicator(
     
        animation: true,
        animationDuration: 1000,
        lineHeight: 20.0,
        leading: SizedBox(
          width: 75,
          // height: 20, 
            // width: ResponsiveWebSite.isMobile(context)
        //     ? MediaQuery.of(context).size.width / 2
        //     : ResponsiveWebSite.isTablet(context)
        //         ? 
        //         : MediaQuery.of(context).size.width / 6.9,
          child: child,
        ),
        trailing: trailing,
        percent: percent,
        //center: const Text("20.0%"),
        linearStrokeCap: LinearStrokeCap.butt,
        progressColor: Colors.greenAccent,
      ),
    );
  }
}
