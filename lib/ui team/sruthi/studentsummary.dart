
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/constant/constant.dart';



class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
          Container(
          height: screenSize.height * 0.1,
          width: screenSize.width * 1,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Student Summary",
                style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.blueGrey),
              ),
            ],
          )),
      Row(children: [
        sizedBoxH10,
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: screenSize.width * 0.3,
            height: screenSize.height * 1,
            color: Color.fromARGB(255, 14, 57, 92),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          radius: 90,
                          // backgroundImage: NetworkImage(
                          // allData[getxController.indexValue.value!]
                          // .studentImage),
                        ),
                      ),
                      sizedBoxH10,
                      sizedBoxH20,
                      LeftWidget(
                        screenSize: screenSize,
                        texts: ["Name", "Class", "Admission No."],
                        maintext: "Personal Info",
                      ),
                      sizedBoxH20,
                      LeftWidget(
                        screenSize: screenSize,
                        texts: [
                          "Mother's Name",
                          "Father's Name",
                        ],
                        maintext: "Parent Details",
                      ),
                      sizedBoxH20,
                      LeftWidget(
                        screenSize: screenSize,
                        texts: [
                          "Address",
                          "Phone No.",
                        ],
                        maintext: "Contact Info",
                      ),
                      sizedBoxH20,
            
                      //  sizedBoxH20,
                      //  HeadingWidget(screenSize: screenSize, text: 'Arts', text1: '', text2: 'Class', mainText: 'Extra Curricular Activities',),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: screenSize.width * 0.01),
          Container(
            width: screenSize.width * 0.68,
            height: screenSize.height * 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RightWidget(
                    screenSize: screenSize,
                    maintext: "Academics",
                    texts: ["Class", "Year", "Result"],
                  ),
                  sizedBoxH20,
                  RightWidget(
                    screenSize: screenSize,
                    maintext: "Extra Curricular Activities",
                    texts: ["Arts", "Sports", "Technology"],
                  ),
                  sizedBoxH20,
                  RightWidget(
                    screenSize: screenSize,
                    maintext: "Achievement",
                    texts: ["School Level", "District Level", "State Level"],
                  ),
                  sizedBoxH20,
                  RightWidget(
                    screenSize: screenSize,
                    maintext: "Skills/Talents",
                    texts: ["*"],
                  ),
                   sizedBoxH20,
                  RightWidget(
                    screenSize: screenSize,
                    maintext: "Clubs",
                    texts: ["*"],
            
                  ),
                   sizedBoxH20,
                  RightWidget(
                    screenSize: screenSize,
                    maintext: "Teachers Opinion",
                    texts: ["Good"],
                  ),
            
                ],
              ),
            ),
          )
        ])
      ])
    ]));
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({
    super.key,
    required this.screenSize,
    required this.texts,
    required this.maintext,
  });

  final Size screenSize;
  final List<String> texts;
  final maintext;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: screenSize.width * 0.68,
                    height: screenSize.height * 0.03,
                    color: Colors.indigo[900],
                    child: Center(
                        child: Text(
                      maintext,
                      style:
                          GoogleFonts.oswald(fontSize: 17, color: Colors.white),
                    ))),
              ],
            ),
            sizedBoxH20,
            for (String text in texts)
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(text,
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 115, 114, 114),
                          fontSize: screenSize.height * 0.016,
                          fontWeight: FontWeight.w600)),
                ),
              ]),
          ],
        ),
      ),
    ]);
  }
}



class LeftWidget extends StatelessWidget {
  const LeftWidget({
    super.key,
    required this.screenSize,
    required this.texts,
    required this.maintext,
  });

  final Size screenSize;
  final List<String> texts;
  final maintext;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: screenSize.width * 0.3,
                    height: screenSize.height * 0.03,
                    color: Colors.indigo[900],
                    child: Center(
                        child: Text(
                      maintext,
                      style:
                          GoogleFonts.oswald(fontSize: 17, color: Colors.white),
                    ))),
              ],
            ),
            sizedBoxH20,
            for (String text in texts)
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(text,
                      style: GoogleFonts.poppins(
                          color:Colors.white,
                          fontSize: screenSize.height * 0.016,
                          fontWeight: FontWeight.w600)),
                ),
              ]),
          ],
        ),
      ),
    ]);
  }
}
