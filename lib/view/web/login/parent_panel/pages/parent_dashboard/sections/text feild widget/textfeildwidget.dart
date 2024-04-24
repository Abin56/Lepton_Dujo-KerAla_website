import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFeildWidget extends StatelessWidget {
  String text;
   TextFormFeildWidget({super.key,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 217, 210, 210),
    borderRadius: BorderRadius.all(Radius.circular(5))
    ),
    child:  TextField(
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 247, 244, 244),
        hintStyle: const TextStyle(fontSize: 17),
        hintText: text,
       
        border: InputBorder.none,
        
        contentPadding: const EdgeInsets.all(15),
      ),
    ),
  );
  }
}