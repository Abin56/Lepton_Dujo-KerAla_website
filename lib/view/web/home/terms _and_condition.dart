import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../fonts/google_monstre.dart';

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
      backgroundColor: adminePrimayColor,
      appBar: AppBar(iconTheme: const IconThemeData(color: cWhite),
      backgroundColor: adminePrimayColor,
       title: GoogleMonstserratWidgets(text: "Terms And Conditions", fontsize: 15.w,)),
      body:
      SingleChildScrollView(
        child: 
        Center(
          child: Column(
                  children: [
              SizedBox(
                width: screenSize.width*1/2,
        
                child: 
                  
                    Column(
                      children: [
                         Image.network(
                           "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm1.jpg?alt=media&token=bc305f24-71c4-4d3d-b470-61ed2ef15872",
                           
                         ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm2.jpg?alt=media&token=668956e0-febe-4725-bcfc-7d80a3e8276d",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm3.jpg?alt=media&token=49133ca0-0467-4435-8f66-ae9025128f56",
                                     
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm4.jpg?alt=media&token=e520323c-ad24-4a6e-8288-e554697a2379",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm5.jpg?alt=media&token=987393a3-ad2c-4658-9b22-d2181750c065",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm6.jpg?alt=media&token=8d65917a-df6d-4f8b-987f-651778aa9f43",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm7.jpg?alt=media&token=110e62dc-0025-4785-9d44-244b9df3c2d4",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm8.jpg?alt=media&token=e8b9a3fb-7d84-48bf-a8c2-55d36e1cb7e6",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm9.jpg?alt=media&token=9bb109b8-3dba-46f5-a1e6-6ac2a0c1b59b",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm10.jpg?alt=media&token=59bdb91e-26d7-483b-be19-97682d4e17de",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm11.jpg?alt=media&token=7eff7d64-ba59-4985-b321-1d24d2c53d2d",
                                      
                                     ),
                                     Image.network(
                                       "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fterms%20and%20condition%2FTerm12.jpg?alt=media&token=6338ac63-cd57-450f-9498-d4f935599ce7",
                                      
                                     ),
                      ],
                    ),
                  
              ),
            ],
          ),
        ),
      ) ,
      );
  }
}