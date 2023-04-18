
import 'package:flutter/material.dart';

import '../../../../../../ui team/abin/alumini_accocation/create_alumni.dart';
import '../../../../../../ui team/abin/alumini_accocation/create_category_alumni.dart';
import '../../../../widgets/custom_button.dart';

class AlumniAssocation extends StatefulWidget {
  const AlumniAssocation({super.key});

  @override
  State<AlumniAssocation> createState() => _AlumniAssocationState();
}

class _AlumniAssocationState extends State<AlumniAssocation> {
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(
                        "ALUMNI ASSOCATIONS",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                        width: screenSize.width * 1 / 3.3,
                        height: screenSize.width * 1 / 2.09,
                        // height: screenSize.width * 1 / 4,
                        //color: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 2, 0, 27),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(5, 5)),
                          ],
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 14, 80, 73),
                                Color(0xFF26A69A)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                    )
                    ), 
                                  
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  CreateAlumni()
                              ),
                            );
                          },
                          child: Container(
                              height: screenSize.width * 1 / 10,
                              width: screenSize.width * 1 / 3.7,
                              child: CustomButton(
                                text: "Create Members", onTap: () {  },
                              )
                              // color: Colors.red,
                              ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                       CreatecategoryAlumni())
                                );
                              },
                              child: Container(
                                height: screenSize.width * 1 / 10,
                                width: screenSize.width * 1 / 3.7,
                                child: CustomButton(
                                  text: 'Create Alumni Category', onTap: () {  },
                                ),
                                // color: Colors.red,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         NoticeUpdates(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: CustomButton(
                              text: 'Remove Members', onTap: () {  },
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                 
                  
                
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Container(
                            width: screenSize.width * 1 / 3.3,
                            height: screenSize.width * 1 / 2.09,
                            // height: screenSize.width * 1 / 4,
                            //color: Colors.blue,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                // BoxShadow(
                                //     color: Colors.blue,
                                //     blurRadius: 1,
                                //     spreadRadius: 3,
                                //     offset: Offset(0, 0)),
                                BoxShadow(
                                    color: Color.fromARGB(255, 2, 0, 20),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(5, 5)),
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 14, 80, 73),
                                    Color(0xFF26A69A)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            padding: const EdgeInsets.only(
                              top: 50,
                            ),
                            child: Column(children: [
                             
                            ])),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
