import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class UnderMaintanceScreen extends StatelessWidget {
  const UnderMaintanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.network(
                'https://assets8.lottiefiles.com/packages/lf20_TLbeE6oxm5.json',
                height: 300,
              ),
              sizedBoxH10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Under Maintenance",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                  
                      color: Color.fromARGB(255, 34, 34, 34)
                    ),
                  ),
                  LottieBuilder.network(
                      'https://assets1.lottiefiles.com/packages/lf20_yyoe1mkr.json',height: 100,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
