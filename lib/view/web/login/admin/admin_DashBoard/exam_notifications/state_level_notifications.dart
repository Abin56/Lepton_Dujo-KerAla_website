import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StateLevelNotifications extends StatefulWidget {
  const StateLevelNotifications({super.key});

  @override
  State<StateLevelNotifications> createState() => _StateLevelNotificationsState();
}

class _StateLevelNotificationsState extends State<StateLevelNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: adminePrimayColor),
    );
  }
}