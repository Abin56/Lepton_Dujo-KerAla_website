import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomBlueButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Color(0xFF26A69A),
              Color.fromARGB(255, 9, 49, 45),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 3, 39, 68),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Text(text),
          ),
        )
        );
  }
}
