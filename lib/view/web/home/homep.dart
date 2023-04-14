
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'footer/footerhomep.dart';

class HomeP extends StatelessWidget {
   HomeP({super.key}); 

  List<String>containerNames = ['Aided Schools', 'Unaided Schoools', 'Government Schools', 'Aided Colleges', 
  'Unaided Colleges', 'Government Colleges', 'Engineering', 'Medical', 'Others']; 

  List<String>lottieFiles = ['https://assets7.lottiefiles.com/private_files/lf30_CrFtpW.json', 
  'https://assets7.lottiefiles.com/private_files/lf30_c3gZyd.json', 
  'https://assets7.lottiefiles.com/private_files/lf30_G9r0Hr.json', 
  'https://assets4.lottiefiles.com/private_files/lf30_pkxipgnh.json', 
  'https://assets4.lottiefiles.com/private_files/lf30_pkxipgnh.json', 
  'https://assets4.lottiefiles.com/private_files/lf30_pkxipgnh.json',
  'https://assets5.lottiefiles.com/packages/lf20_geumvtzy.json', 
  'https://assets8.lottiefiles.com/packages/lf20_ibbakwps.json', 
  'https://assets1.lottiefiles.com/packages/lf20_DkWbCBx3kE.json'

  ];


  @override
  Widget build(BuildContext context) {
    return Container( 
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
           Colors.white,
          
           Color.fromRGBO(103, 53, 107, 1), 
         // Color.fromRGBO(189, 63, 50, 1), 
        ], begin: Alignment.topCenter, 

        end: Alignment.bottomCenter, stops: [0.4, 2,]), 
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
              padding: const  EdgeInsets.only(right:80.0, left: 80),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1/4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone), 
                              SizedBox(width: 10,),
                              Text(
                                'Phone',
                                style: GoogleFonts.poppins(
                                  color: Color.fromRGBO(103, 53, 107, 1), 
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.mail), 
                              SizedBox(width: 10,),
                              Text(
                                'Mail Us',
                                style: GoogleFonts.poppins(
                                  color:  Color.fromRGBO(103, 53, 107, 1),
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/4,
                      child: Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color:  Color.fromRGBO(103, 53, 107, 1)), 
                    
                          ), 
                          Image.asset('assets/images/logo-facebookpng-32247.png', height: 50, width: 50,color: Color.fromRGBO(103, 53, 107, 1), ), 
                          Image.asset('assets/images/pngwing.com.png', height: 42, width: 42, color: Color.fromRGBO(103, 53, 107, 1), ), 
                          Image.asset('assets/images/twit.png', height: 42, width: 42,color: Color.fromRGBO(103, 53, 107, 1), ), 
                          Image.asset('assets/images/yout.png', height: 52, width: 52, color: Color.fromRGBO(103, 53, 107, 1),)
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),  
            Padding(
              padding: const  EdgeInsets.only(right:80.0, left: 80),
              child: Container(
               width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*.35, 
               // color: Color.fromARGB(255, 142, 234, 243),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
                  
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 500,
                                      
                                      child: Stack(
                                       // crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Image.asset('assets/images/dujo2.png', color:  Color.fromRGBO(103, 53, 107, 1).withOpacity(0.5) , width: 170, height: 170,),
                                          Positioned(
                                            left: 150,
                                            child: Image.asset('assets/images/lepton.png', width: 170, height: 170,color:  Color.fromRGBO(103, 53, 107, 1),)),
                                        ],
                                      ),
                                    ),
                                    Text('Watch And Guide,\nLet Them Study', style: GoogleFonts.montserrat(fontSize: 50, fontWeight: FontWeight.bold, color:  Color.fromRGBO(103, 53, 107, 1), ),), 
                                    SizedBox(height: 20,),
                                    MaterialButton(
                                      padding: EdgeInsets.all(20),
                                      height: 60,
                                      onPressed: (){}, color: Color.fromRGBO(103, 53, 107, 1), child: Text('Create School Profile', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),)
                                  ],
                                ), 
                               Container(
                                width: 600,
                             
                                 child: ShaderMask( 
                                   shaderCallback: (rect) {
    return LinearGradient(
      begin: Alignment.center ,
      end: Alignment.bottomCenter,
      colors: [Color.fromRGBO(103, 53, 107, 1), Colors.transparent],
    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
  },
  blendMode: BlendMode.dstIn,
                                   child: Stack(
                                    children: [
                                       Transform.rotate(
                                       angle: 0,
                                        
                                         child: Positioned(
                                          left: -100,
                                          child: 
                                                                           Image.asset('assets/images/boy.png', width: 300, height: 300,)),
                                       ),
                                       Positioned(
                                        left: 210,
                                        child: Image.asset('assets/images/pngegg.png',  width: 400, height: 400,)),
                                      Positioned(
                                        left: 100,
                                        child: Image.asset('assets/images/girl.png', width: 400, height: 400,fit: BoxFit.contain,)), 
                                          
                                     
                                    ],
                                   ),
                                 ),
                               )
                              ]
                            )
                ,
              ),
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Dujo Kerala Schools', style: GoogleFonts.poppins(fontSize:20, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.7)),),
                Text('Dujo Kerala Colleges', style: GoogleFonts.poppins(fontSize:20, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.7)),),
                Text('Dujo Customize', style: GoogleFonts.poppins(fontSize:20, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.7))),
              ],
            ) ,

           GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(9, (index) {
                      return Center(
                          child: SizedBox(
                        height: 500,
                        width: 500,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => pages[index])));
                          },
                          child: Card(
                            color: Colors.white.withOpacity(0.5),
                              elevation: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   '',
                                  //   width: 50,
                                  //   height: 50,
                                  // ),
                                  LottieBuilder.network(lottieFiles[index], width: 300, height: 300,),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    containerNames[index],
                                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 53, 107, 1), ),
                                  )
                                ],
                              )),
                        ),
                      ));
                    })), 
                    FooterHomeP()
          ]
        ), 
      ),
    );
  }
}

class UiContainer extends StatelessWidget {
  const UiContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 700, left: 700, top: 100, bottom: 100),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber, 
          borderRadius: BorderRadius.circular(50), 

        ), 
        height: 200, 
        width: 100,
      )

    );
  }
}
