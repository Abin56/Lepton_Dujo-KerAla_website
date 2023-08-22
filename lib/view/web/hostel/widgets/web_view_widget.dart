import 'package:flutter/material.dart';

import 'custom_scroll_behaviour.dart';
import 'hostel_card_widget.dart';
import 'hostel_title_widget.dart';

class WebScreenHostelWidget extends StatelessWidget {
  const WebScreenHostelWidget({
    super.key,
    required this.title,
    required this.names,
    required this.iconList,
    required this.navigationWidgets,
  });

  final String title;
  final List<String> names;
  final List<String> iconList;
  final List<Widget> navigationWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HostelTitleWidget(title: title),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => navigationWidgets[index])),
                    child: HostelCardWidget(
                      title: names[index],
                      imagePath: iconList[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
