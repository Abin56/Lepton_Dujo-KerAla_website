import 'package:flutter/material.dart';

import 'hostel_card_widget.dart';
import 'hostel_title_widget.dart';

class MobileScreenHostelWidget extends StatelessWidget {
  const MobileScreenHostelWidget(
      {super.key,
      required this.title,
      required this.names,
      required this.iconList});

  final String title;
  final List<String> names;
  final List<String> iconList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HostelTitleWidget(title: title),
        const SizedBox(height: 20),
        ...List.generate(
            names.length,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: HostelCardWidget(
                        title: names[index], imagePath: iconList[index]),
                  ),
                ))
      ],
    );
  }
}


