import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Livecontainer extends StatelessWidget {
  const Livecontainer({
    
    
    super.key, required this.text,required this.onTap
  });
 
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 85,
        width: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          Colors.cyanAccent,Colors.cyan
        ])),
        child: Center(
          child: Text(text,style:GoogleFonts.acme(fontSize: 20.0,
          color: Color.fromARGB(255, 0, 0, 0), 
          fontWeight: FontWeight.w800,),),
        ),
      ),
    );
  }
}