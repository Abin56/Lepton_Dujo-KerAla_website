import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton2({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD500F9), Color(0xFF651FFF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed(),
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color.fromARGB(255, 212, 150, 145), Color.fromARGB(255, 212, 150, 145)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)]
];
