// import 'package:dash_board/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';

// import '../../../../../../../../fonts/text_widget.dart';

class ParentNotification extends StatelessWidget {
  const ParentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: cWhite,
          // height: 700,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFontWidget(
                        text: "Notifications",
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.more_horiz),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,left: 10
                ),
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.elliptical(50, 50))),
                  child: Center(
                      child: TextFontWidget(
                          text: "16 June ,2019", fontsize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: TextFontWidget(
                  text:
                      "Great School manag mene esom tus eleifend lectus sed maximus mi faucibusnting.",
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFontWidget(
                        text: "Jennyfar Lopez / 5 min ago",
                        fontsize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  
                    //Jennyfar Lopez / 5 min ago
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
