import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatefulWidget {
  const 
  Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  String _studentName = '';
  late List<dynamic> _clubs = [];
  String _fathername = '';
  String _mothername = '';
  String _admissionno = '';
  String _class = '';
  String _address = '';
  String _phoneNo = '';
  String _emailId = '';
  String _resultYear = '';
  String _result = '';
  String _skills = '';
  String _arts = '';
  String _sports = '';
  String _technology = '';
  String _schoollevel = '';
  String _districtlevel = '';
  String _statelevel = '';
  String _teacherOpinion = '';
  String _housename = '';
  String _place = '';
  String _district = '';
  String _state = '';
  String _scholarship= '';

  // String _

  @override
  void initState() {
    super.initState();
    _getFieldValue();
  }

  void _getFieldValue() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
         .collection("SchoolListCollection").doc("mthssCheng16767").collection("sampoorna")
        .doc('YL0t9TBB8QTCUnD1rXgz')
        .get();
    setState(() {
      _studentName = snapshot.get('studentname');
      _fathername = snapshot.get('studentfather');
      _mothername = snapshot.get('studentmother');
          _housename = snapshot.get('housename');
      _place = snapshot.get('studentplace');
      _district = snapshot.get('studentdistrict');
      _state = snapshot.get('studentstate');
      _scholarship = snapshot.get('scholarship');


      _clubs = snapshot.get('clubs');
      _admissionno = snapshot.get('studentadmission');
      _class = snapshot.get('studentclass');
      _address = snapshot.get('studentaddress');
      _phoneNo = snapshot.get('parentphone');
      _emailId = snapshot.get('studentemail');
      _resultYear = snapshot.get('resultyear');
      _result = snapshot.get('results');
      _skills = snapshot.get('skills');
      _arts = snapshot.get('arts');
      _sports = snapshot.get('sports');
      _schoollevel = snapshot.get('schoollevel');
      _districtlevel = snapshot.get('districtlevel');
      _statelevel = snapshot.get('statelevel');
      _teacherOpinion = snapshot.get('teachersopinion');
      // _arts = snapshot.get('_arts');
      // _sports = snapshot.get('_sports');
    });
  }

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
                style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      SizedBox(height: screenSize.height * 0.01),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: screenSize.width * 0.32,
            height: screenSize.height * 1,
            color: Colors.teal[100],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20 ,top: 20),
                      child: Text(
                        "Biodata",
                        style: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height*0.01),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Name:" + "    " + "$_studentName",
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Adm No:" + "    " + "$_admissionno",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Class:" + "    " + "$_class",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Mother's Name:" + "    " + "$_mothername",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Father's Name:" + "    " + "$_fathername",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Text(
                        "Contact Info",
                        style: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Address:" + "    " + "$_housename ,"+ "    "  +"$_place",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("District:" + "    " + "$_district",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
               
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("State :" + "    "+ "$_state",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                 SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Phone No:" + "    " + "$_phoneNo",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Email Id:" + "    " + "$_emailId",
                        style: GoogleFonts.montserrat(fontSize: 16)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                ]),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: screenSize.width * 0.01),
        Container(
          width: screenSize.width * 0.4,
          height: screenSize.height * 1,
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Academics:",
                    style:
                        GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 21)),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Scholarships:" + "    " + "$_scholarship",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Class:" + "    " + "$_class",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Year:" + "    " + "$_resultYear",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Results:" + "    " + "$_result",
                      style: GoogleFonts.montserrat(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Skills/Talents:",
                    style:
                        GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 21)),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("1." + "    " + "$_skills",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Text("2.", style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            
            Row(
              children: [
                Text("Extra Curricular Activities",
                    style:
                        GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 21)),
              ],
            ),

            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Arts:" + "    " + "$_arts",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Sports:" + "    " + "$_sports",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Technology:" + "    " + "$_technology",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Achievements",
                    style:
                        GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 21)),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("School Level:" + "    " + "$_schoollevel",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("District Level:" + "    " + "$_districtlevel",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("State Level:" + "    " + "$_statelevel",
                      style: GoogleFonts.montserrat(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Clubs",
                    style:
                        GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 21)),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Member In :" + "    " + "$_clubs",
                    style: GoogleFonts.montserrat(fontSize: 16)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
           
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Teachers Opinion" ,
                    style:
                        GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 21)),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Opinion:" + "    " + "$_teacherOpinion", style: GoogleFonts.montserrat(fontSize: 18)),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
            ]),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
           
          ]),
        ),
      ]),
    ]));
  }
}
