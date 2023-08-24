import 'package:flutter/material.dart';

class SecondaryCreateButtonWidget extends StatelessWidget {
  const SecondaryCreateButtonWidget({
    required this.text,
    super.key,
    required this.screenSize,
  });

  final Size screenSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.width * 1 / 40,
      width: screenSize.width * 1 / 5,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(14)),
      child: Center(child: Text(text)),
    );
  }
}
