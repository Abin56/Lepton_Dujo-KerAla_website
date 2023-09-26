import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:flutter/material.dart';

mobileandTabAlert(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: GooglePoppinsWidgets(text: 'Message', fontsize: 15),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GooglePoppinsWidgets(
                  text:
                      'Please login to the Desktop Site for Better Experience..',
                  fontsize: 15),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
