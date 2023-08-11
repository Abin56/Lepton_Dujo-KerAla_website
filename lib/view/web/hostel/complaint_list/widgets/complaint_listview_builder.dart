import 'package:flutter/material.dart';

import '../../complaint_list_page.dart';
import 'hostel_complaint_dialogue.dart';

class ComplaintListViewBuilder extends StatelessWidget {
  const ComplaintListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(25),
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ListTile(
              leading: ComplaintTextWidget(
                value: 'Date',
                fontWeight: FontWeight.bold,
              ),
              title: Center(
                  child: ComplaintTextWidget(
                value: 'Title',
                fontWeight: FontWeight.bold,
              )),
              trailing: ComplaintTextWidget(
                value: 'Student Name',
                fontWeight: FontWeight.bold,
              ),
            );
          }
          return ListTile(
            leading: const ComplaintTextWidget(value: "data"),
            title: const Center(child: ComplaintTextWidget(value: "data")),
            trailing: const ComplaintTextWidget(value: "data"),
            onTap: () {
              hostelComplaintDialogue(context);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
