import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                              "assets/images/privacy 3.jpg",
                            
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/privacy 4.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/privacy 5.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/Term6.jpg",
                             
                            )),
                             Container(
                           
                            child: Image.asset(
                              "assets/images/privacy 7.jpg",
                             
                            )),
                             
              ],
            ),
          ),
        ),
      ) ,
      );
  }
}