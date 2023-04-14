import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body:
      SingleChildScrollView(
        child: 
        Center(
          child: Container(
            width: screenSize.width*1/2,
        
            child: Column(
              children: [
                 Container(
                           
                            child: Image.asset(
                              "assets/images/Term1.jpg",
                              
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term2.jpg",
                             
                            )),
                             Container(
                            
                           
                            child: Image.asset(
                              "assets/images/Term3.jpg",
                            
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term4.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term5.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term6.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term7.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term8.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term9.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term10.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term11.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term12.jpg",
                             
                            )),
              ],
            ),
          ),
        ),
      ) ,
      );
  }
}