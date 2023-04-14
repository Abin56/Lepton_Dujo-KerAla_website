// import 'package:flutter/material.dart';


// class TeacherPannelAdmin extends StatefulWidget {
//   const TeacherPannelAdmin({super.key});

//   @override
//   State<TeacherPannelAdmin> createState() => _TeacherPannelAdminState();
// }

// class _TeacherPannelAdminState extends State<TeacherPannelAdmin> {
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Teacher Dashboard"),
//           backgroundColor: Color.fromARGB(255, 134, 110, 241
//           ),
//         ),
//         drawer: Drawer(child: AdminDrawer()),
//         body: SingleChildScrollView(
//           child: Container(
//            // color: Color.fromARGB(255, 38, 104, 166),
//               //  Color.fromARGB(255, 189, 144, 207),
//             // color: Color.fromARGB(255, 32, 189, 142),
//             // Color.fromARGB(255, 166, 38, 155),
//             alignment: Alignment.topCenter,
//             child: Column(
//               children: [
 
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: screenSize.width * 0),
//                       child: Container(
//                         //eight: screenSize.height,
//                         width: screenSize.width*1/2,
//                         color: Color.fromARGB(255, 134, 110, 241),
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => TimetableTeacher(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                     onTap: () {},
//                                     text: "TimeTable",
//                                   )),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => SubjectTeacher(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Subject", onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //       builder: (context) => UpdateStudentTea(),
//                                 //     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Teaching Notes", onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => StudyMaterialTea(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Study Material Upload",
//                                       onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //       builder: (context) => EventsUpdates(),
//                                 //     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Upload ProgressReport",
//                                       onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ExamsAndResult(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Exams and Results", onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           AssignmentProjects(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Assiginment and Projects",
//                                       onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => AdminTeacherList(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Live classes", onTap: () {})),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => AdminTeacherList(),
//                                     ));
//                               },
//                               child: Container(
//                                   height: screenSize.width * 1 / 13,
//                                   width: screenSize.width * 1 / 3,
//                                   child: CustomTeaContainer(
//                                       text: "Recorded classes", onTap: () {})),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: screenSize.width * 1 / 3,
//                       child: 
//                           Column(
//                             children: [
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 1", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 2", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 3", onPressed: () {}),
//                               ),
//                               // Container(
//                               //   height: screenSize.width * 1 / 13,
//                               //   width: screenSize.width * 1 / 6,
//                               //   child: CustomDarkButton(
//                               //       text: "Class 3", onPressed: () {}),
//                               // ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 4", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 5", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 6", onPressed: () {}),
//                               ),
                           
                         
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 7", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 8", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 9", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 10", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 11", onPressed: () {}),
//                               ),
//                               Container(
//                                 height: screenSize.width * 1 / 13,
//                                 width: screenSize.width * 1 / 6,
//                                 child: CustomDarkButton(
//                                     text: "Class 12", onPressed: () {}),
//                               ),
//                               // Container(
//                               //   height: screenSize.width * 1 / 13,
//                               //   width: screenSize.width * 1 / 6,
//                               //   child: CustomDarkButton(
//                               //       text: "Student 13", onPressed: () {}),
//                               // ),
                           
                        
//                             ]
//                             )  
//                 )
//               ],
//             ),
//               ]
//           ),
        
    
    
//          )
//          )
//           );
//   }
// }
