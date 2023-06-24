// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverText extends StatefulWidget {
  final Widget Function(bool isHoverd)builder;
   OnHoverText({required this.builder, super.key});

  @override
  State<OnHoverText> createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHoverd = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(8, 0, 0)
      ..scale(1.2);
    final transform = isHoverd ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event)=>onEntered(true),
      onExit: (event)=>onEntered(false),
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: const Duration(milliseconds: 300),
      transform: transform,
      child: widget.builder(isHoverd),
      ),
    );
  }
  void onEntered(bool  isHoverd)=>setState(() {
    this.isHoverd =isHoverd;
  });
}
