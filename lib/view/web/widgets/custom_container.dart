import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomContainer({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(width: 1),
              gradient: LinearGradient(
                  colors: containerColor[7],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            child: Center(
              child:
              
               Text(
                text,
                style: const TextStyle(fontSize: 25, color: cBlack),
              ),
            ),
          ),
        ));
  }
}

const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color.fromARGB(255, 212, 150, 145), Color.fromARGB(255, 212, 150, 145)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 205, 216, 228)],
  [adminePrimayColor, adminePrimayColor]
];
