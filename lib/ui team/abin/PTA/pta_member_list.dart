import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../view/colors/colors.dart';


class PTAMemberList extends StatefulWidget {
  const PTAMemberList({super.key});

  @override
  State<PTAMemberList> createState() => _PTAMemberListState();
}

class _PTAMemberListState extends State<PTAMemberList> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Member list'),
      backgroundColor: adminePrimayColor),
     body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                       width: screenSize.width*0.3,
                    //  color: Colors.amber[50],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                              child: Text(
                            "PTA Members",
                            style: GoogleFonts.oswald(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: screenSize.width * 0.16,
                                height: screenSize.height * 0.29,
                                color: Colors.red[100],
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "PRESIDENT",
                                          style: GoogleFonts.oswald(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      const CircleAvatar(
                                        maxRadius: 40,
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      Text(
                                        "Name :",
                                        style: GoogleFonts.oswald(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.02,
                              ),
                              Container(
                                width: screenSize.width * 0.16,
                                height: screenSize.height * 0.29,
                                color: Colors.red[100],
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "VICE PRESIDENT",
                                          style: GoogleFonts.oswald(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      const CircleAvatar(
                                        maxRadius: 40,
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      Text(
                                        "Name :",
                                        style: GoogleFonts.oswald(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.02,
                              ),
                              Container(
                                width: screenSize.width * 0.16,
                                height: screenSize.height * 0.29,
                                color: Colors.red[100],
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "SECRETARY ",
                                          style: GoogleFonts.oswald(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      const CircleAvatar(
                                       
                                        maxRadius: 40,
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      Text(
                                        "Name :",
                                        style: GoogleFonts.oswald(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: screenSize.height * 0.02,
                              ),
                              Container(
                                width: screenSize.width * 0.16,
                                height: screenSize.height * 0.29,
                                color: Colors.red[100],
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "TRESURER ",
                                          style: GoogleFonts.oswald(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      const CircleAvatar(
                                       
                                        maxRadius: 40,
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      Text(
                                        "Name :",
                                        style: GoogleFonts.oswald(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(15),
              crossAxisCount: 3,
              children: List.generate(
                9,
                (index) =>Container(
                  // ignore: sort_child_properties_last
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text("MEMBER IN PTA",
                              style: GoogleFonts.alumniSans(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.03,),
                        const CircleAvatar(
                          maxRadius: 45,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02, ),
                        Text("Name :",
                            style: GoogleFonts.abel(
                              fontSize: 15,
                            )),
                        SizedBox(
                          height: screenSize.height * 0.02, ),
                        Text("Position:",
                            style: GoogleFonts.abel(
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ),
                  height: screenSize.height*0.02,
                  width: screenSize.width*0.02,
                  margin: EdgeInsets.only(
                      bottom: screenSize.width * 0.01,
                      left: screenSize.width * 0.01,
                      right: screenSize.width * 0.01),
                  color: Colors.lightBlue[50],
                ),
              ),
            ),
          ),
        ],
     ),
);
}
}