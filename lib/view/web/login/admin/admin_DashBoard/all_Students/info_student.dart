import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/transfer_cretificate/tc_genrate.dart';
import 'package:flutter/material.dart';

getInfoofStudent(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Message'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Successfully created'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Genrate Tc'),
            onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return   GenrateTC();
      },));
            },
          ),
        ],
      );
    },
  );
}
