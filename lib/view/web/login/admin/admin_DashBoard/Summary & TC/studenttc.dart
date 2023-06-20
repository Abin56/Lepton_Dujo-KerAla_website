import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant/constant.dart';

class SchoolTc extends StatefulWidget {
  const SchoolTc({super.key});

  @override
  State<SchoolTc> createState() => _SchoolTcState();
}

class _SchoolTcState extends State<SchoolTc> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _admissionController1 = TextEditingController();
  final TextEditingController _fathernameController = TextEditingController();

  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _casteController = TextEditingController();
  final TextEditingController _whetherscstController = TextEditingController();
  final TextEditingController _dateofbirthController = TextEditingController();
  final TextEditingController _classStudiedController = TextEditingController();
  final TextEditingController _totalworkingdaysController = TextEditingController();
  final TextEditingController _membershipController = TextEditingController();
  final TextEditingController _gamesController = TextEditingController();
  final TextEditingController _studentNationalityController = TextEditingController();
  final TextEditingController _studentadmissionController = TextEditingController();
  String _fieldValue = '';
  String _fieldValue1 = '';
  String _fathername = '';
  String _nationality = '';
  String _caste = '';
  String _whetherscst = '';
  String _dateofbirth = '';
  String _classStudied = '';
  String _totalworkingdays = '';
  String _membership = '';
  String _games = '';
  String _studentNationality = '';
  String _admissionNo = '';

  @override
  void initState() {
    super.initState();
    _getFieldValue();
  }

  void _getFieldValue() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc("mthssCheng16767")
        .collection("sampoorna")
        .doc('YL0t9TBB8QTCUnD1rXgz')
        .get();
    setState(() {
      _fieldValue = snapshot.get('studentname');
      _fathername = snapshot.get('studentfather');
      _nationality = snapshot.get('nationality');
      _studentNationality = snapshot.get('studentnationality');
      _fieldValue1 = snapshot.get('studentmother');
      _caste = snapshot.get('caste');
      _whetherscst = snapshot.get('categories');
      _dateofbirth = snapshot.get('dateofbirth');
      _classStudied = snapshot.get('studentclass');
      _totalworkingdays = snapshot.get('totalworkingdays');
      _membership = snapshot.get('membership');
      _games = snapshot.get('games');
      _admissionNo = snapshot.get('studentadmission');
      _textEditingController.text = _fieldValue;
      _textEditingController1.text = _fieldValue1;
      _fathernameController.text = _fathername;
      _nationalityController.text = _nationality;
      _casteController.text = _caste;
      _whetherscstController.text = _whetherscst;
      _dateofbirthController.text = _dateofbirth;
      _classStudiedController.text = _classStudied;
      _totalworkingdaysController.text = _totalworkingdays;
      _membershipController.text = _membership;
      _gamesController.text = _games;
      _studentadmissionController.text = _admissionNo;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: screenSize.width * 1,
            height: screenSize.height * 1,
            //  color: Colors.amber,
            child: ListView(
              children: [
                Center(
                    child: Text(
                  "Transfer Certificate",
                  style: GoogleFonts.openSans(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Admission Number :",
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        // color: Colors.white,
                        // height: 100,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: _studentadmissionController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              // hintText: 'Class & Division',
                            ),
                          ),
                        ),
                      ),
                      sizedBoxW20,
                      Text("S.R.No.:",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Flexible(
                          child: SizedBox(
                            // color: Colors.white,
                            // height: 100,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Please enter the details',
                                    hintStyle: TextStyle(fontSize: 14)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1. Name of the Pupil :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _textEditingController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2. Father's /Guardian's Name :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          height: 45,
                          width: 800,
                          //  height: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _fathernameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3. Mother's Name :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _textEditingController1,
                              decoration: const InputDecoration(
                                border: InputBorder
                                    .none, // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("4. Nationality :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _nationalityController,
                              decoration: const InputDecoration(
                                border: InputBorder
                                    .none, // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("5. Caste :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _casteController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("6. Whether the Candidate bolongs to SC/ST :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _whetherscstController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("7. Date of First admissionin school with class :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "8. Date of Birth according to admission\n    registration in figure & words : ",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _dateofbirthController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "9. Class in which pupil last studied in words & figure :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              //  controller: _classStudiedController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "11. Whether failed: if so once/twice in the same class :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12. Subject studied /Compulsory :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "13. Whether qualified for promotion to higher\n    class is so, to which class :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("14. Total No.of  working days :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _totalworkingdaysController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("15. Total no.of working days present :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "16. Whether NCC Cadet/Boys Scout/Girls Guide\n   (Details may be given) :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _membershipController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "17. games played or extra curricular activities\n  which the pupil usually took part :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: _gamesController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Class & Division',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("18. General Conduct :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("19. Date of application for certificate :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 50,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("20. Date of Issue of Certificate :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("21. Reason for leaving the school :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("22. Any Other Remarks :",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          )),
                      Flexible(
                        child: SizedBox(
                          // color: Colors.white,
                          height: 45,
                          width: 800,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter the details',
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
