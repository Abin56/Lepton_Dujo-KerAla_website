import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StudetnSummery extends StatelessWidget {
  const StudetnSummery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Student Summery",style: TextStyle(fontSize: 25),),),
    );
  }
}