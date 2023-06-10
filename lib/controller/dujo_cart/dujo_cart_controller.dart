import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DujoCartController extends GetxController {

  getDujoCart(BuildContext context)async{
  return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dujo Cart'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Sorry you have no access to delete'),
                  
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
  
}