import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SchoolExamMainPage extends StatefulWidget {
   SchoolExamMainPage({super.key, required this.sn});

  QueryDocumentSnapshot<Map<String, dynamic>> sn;

  @override
  State<SchoolExamMainPage> createState() => _SchoolExamMainPageState();
}

class _SchoolExamMainPageState extends State<SchoolExamMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container()
    );
  }
}