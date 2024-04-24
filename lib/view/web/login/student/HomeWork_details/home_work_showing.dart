// import 'package:dash_board/view/fonts/text_widget.dart';
// import 'package:dash_board/view/pages/home/users_panel/student_panel/pages/dash_board/sections/HomeWork_details/hw_detailed_graph.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/web/login/student/HomeWork_details/hwDetailed_graph.dart';
import 'package:flutter/material.dart';

class StdHomeWorkShowingContainer extends StatelessWidget {
  const StdHomeWorkShowingContainer({
    super.key,
  });

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
                text: " HomeWorks",
                fontsize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.blue[600],
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
                color: Colors.blue[600],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 450,
          child: HomeWorkTable())
        // Column(
        //   children: [
        //     Container(
        //       width: 710,
        //       height: 50,
        //       color: Colors.blue[50],
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 20),
        //             child: TextFontWidget(
        //               text: "NO.",
        //               fontsize: 13,
        //               fontWeight: FontWeight.w400,
        //               color: Colors.blue[300],
        //             ),
        //           ),
        //           TextFontWidget(
        //             text: "HOMEWORKS",
        //             fontsize: 13,
        //             fontWeight: FontWeight.w400,
        //             color: Colors.blue[300],
        //           ),
        //           TextFontWidget(
        //             text: "SUBJECT",
        //             fontsize: 13,
        //             fontWeight: FontWeight.w400,
        //             color: Colors.blue[300],
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(right: 20),
        //             child: TextFontWidget(
        //               text: "TIME",
        //               fontsize: 13,
        //               fontWeight: FontWeight.w400,
        //               color: Colors.blue[300],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     // ListView.separated(
        //     //     itemBuilder: (context, index) {
        //     //       Container(
        //     //         decoration: BoxDecoration(
        //     //             border: Border.all(
        //     //                 color: themeColorBlue.withOpacity(0.2),
        //     //                 width: 0.9)),
        //     //         height: 50,
        //     //         child: Row(
        //     //           children: [
        //     //             ListDataContainerWidget(
        //     //                 text: "text", height: 50, width: 177),
        //     //           ],
        //     //         ),
        //     //       );
        //     //     },
        //     //     separatorBuilder: (context, index) {
        //     //       return const SizedBox(
        //     //         height: 05,
        //     //       );
        //     //     },
        //     //     itemCount: 1)
        //   ],
        // )
      ],
    );
  }
}
