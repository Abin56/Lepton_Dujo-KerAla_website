import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class StudentProtectionGroup extends StatefulWidget {
  const StudentProtectionGroup({super.key});

  @override
  State<StudentProtectionGroup> createState() => _StudentProtectionGroupState();
}

class _StudentProtectionGroupState extends State<StudentProtectionGroup> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Text('Student ProtectionGroup'),
          backgroundColor: adminePrimayColor),
      body: Row(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: screenSize.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Student Protection Group",
                          style: GoogleFonts.oswald(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          width: screenSize.width * 0.14,
                          height: screenSize.height * 0.29,
                          color: Colors.cyan[200],
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: CircleAvatar(
                                    maxRadius: 45,
                                  ),
                                ),
                                Text("Name:",
                                    style: GoogleFonts.almendra(fontSize: 18)),
                                sizedBoxH10,
                                Text("Principal",
                                    style: GoogleFonts.almendra(fontSize: 18)),
                                sizedBoxH10,
                                Text("ChairPerson",
                                    style: GoogleFonts.almendra(fontSize: 18)),
                                sizedBoxH10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [EditWidget()],
                                )
                              ],
                            ),
                          )),
                      sizedBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SecondColumnWidget(
                            screenSize: screenSize,
                            texts: [
                              "Name:",
                              "Guidence Teacher",
                              "Vice ChairPerson"
                            ],
                          ),
                          sizedBoxw10,
                          SecondColumnWidget(
                            screenSize: screenSize,
                            texts: [
                              "Name:",
                              "Faculty President",
                              "Faculty Representative"
                            ],
                          ),
                        ],
                      ),
                      sizedBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SecondColumnWidget(
                            screenSize: screenSize,
                            texts: [
                              "Name:",
                              "Student Representative",
                              "President"
                            ],
                          ),
                          sizedBoxw10,
                          SecondColumnWidget(
                            screenSize: screenSize,
                            texts: [
                              "Name:",
                              "Student Representative",
                              "Vice President"
                            ],
                          ),
                          sizedBoxH10,
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 3,
              crossAxisSpacing: 11,
              mainAxisSpacing: 11,
              children: List.generate(
                12,
                (index) => Container(
                  height: 50,

                  // ignore: sort_child_properties_last
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text("MEMBER IN SPG",
                              style: GoogleFonts.alumniSans(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        sizedBoxH20,
                        const CircleAvatar(
                          maxRadius: 40,
                        ),
                        sizedBoxH20,
                        Text("Name :",
                            style: GoogleFonts.abel(
                              fontSize: 15,
                            )),
                        sizedBoxH20,
                        Text("Designation:",
                            style: GoogleFonts.abel(
                              fontSize: 15,
                            )),
                        sizedBoxH20,
                        Text("Position:",
                            style: GoogleFonts.abel(
                              fontSize: 15,
                            )),
                        sizedBoxH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [EditWidget()],
                        )
                      ],
                    ),
                  ),
                  //  height: screenSize.height*0.02,
                  width: screenSize.width * 0.02,
                  margin: EdgeInsets.only(
                      bottom: screenSize.width * 0.01,
                      left: screenSize.width * 0.01,
                      right: screenSize.width * 0.01),
                  color: Colors.blueGrey[100],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EditWidget extends StatelessWidget {
  const EditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: Size(36, 36), // button width and height
        child: ClipOval(
          child: Material(
            child: InkWell(
              onTap: () {
                _showEditDialog(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.edit), // icon
                  // Text("Edit",style: TextStyle(fontSize: 15),), // text
                ],
              ),
            ),
          ),
        ));
  }
}

class SecondColumnWidget extends StatelessWidget {
  const SecondColumnWidget(
      {super.key, required this.screenSize, required this.texts});

  final Size screenSize;
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenSize.width * 0.11,
        height: screenSize.height * 0.26,
        color: Colors.lightBlue[50],
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  maxRadius: 35,
                ),
              ),
              for (String text in texts)
                Column(
                  children: [
                    Text(text,
                        style: GoogleFonts.almendra(
                          fontSize: 15,
                        )),
                    sizedBoxH10,
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [EditWidget()],
              )
            ],
          ),
        ));
  }
}

void _showEditDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String name = "";
      String? position;
      String? designation;

      return AlertDialog(
        title: Text("Edit Members"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Name",
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Select  designation",
              ),
              value: designation,
              items: <String>[
                'Principal',
                'Teacher',
                'Parent',
                'Student',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                designation = value;
              },
            ),
            sizedBoxH20,
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Select position",
              ),
              value: designation,
              items: <String>[
                'ChairPerson',
                'Vice ChairPerson',
                'Faculty President',
                'President',
                'Vice President',
                'Member'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                designation = value;
              },
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // perform edit action
              Navigator.pop(context);
            },
            child: Text("Submit"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  );
}
