// import 'package:dash_board/view/fonts/text_widget.dart';
// import 'package:dash_board/view/pages/home/users_panel/student_panel/pages/dash_board/sections/HomeWork_details/submission_hw_graph.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/web/login/student/HomeWork_details/hw_submissionGraph.dart';
import 'package:flutter/material.dart';

class StdHomeWorkStatusContainer extends StatelessWidget {
  const StdHomeWorkStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              TextFontWidget(
                text: " HomeWorks Submission",
                fontsize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.green[900],
              ),
              const Spacer(),
              Container(
                height: screensize.height / 35,
                alignment: Alignment.center,
                child: const VerticalDivider(
                color: Colors.black38,
                thickness: 1,
                ),
              ),
              TextFontWidget(
                text: "View All",
                fontsize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.green[900],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 450,
          child: SubmissionTable()),
       
      ],
    );
  }
}