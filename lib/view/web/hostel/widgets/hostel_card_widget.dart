import 'package:flutter/material.dart';

class HostelCardWidget extends StatelessWidget {
  const HostelCardWidget({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      width: 200,
      height: 180,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
