import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:flutter/material.dart';

class DujoShoppingCart extends StatelessWidget {
  const DujoShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 145, 197, 240),
      body: SafeArea(
          child: Center(
        child: Container(
          height: 800,
          width: 800,
          decoration: const BoxDecoration(
          color:  Color.fromARGB(255, 212, 223, 243),
          borderRadius: BorderRadius.all(Radius.circular(30))

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoogleMonstserratWidgets(text: "Marthoma Higher Secondary School", fontsize: 13),
                    GooglePoppinsWidgets(text: 'Current Plan', fontsize: 10),
                    
                  ],
                )
          
              ],
            ),
          ),
        ),
      )),
    );
  }

}
