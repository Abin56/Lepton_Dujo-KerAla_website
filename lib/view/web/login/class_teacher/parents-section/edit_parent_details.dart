// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dujo_website/model/parent/parent_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class EditParentDetails extends StatelessWidget {
//    EditParentDetails({super.key, required this.model, required this.id}); 

//   var id; 
//   ParentModel model; 
//   TextEditingController parentNameController = TextEditingController(); 
//   TextEditingController classInChargeController = TextEditingController(); 
//   TextEditingController joinDateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//      var screenSize = MediaQuery.of(context).size;  
//      parentNameController.text = model.parentName; 
//      joinDateController.text = model.joinDate;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
//           child: Center(
//             child: Column(children: [
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   controller: parentNameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: model.parentName,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   controller: classInChargeController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   controller: joinDateController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: model.joinDate,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: screenSize.width * 1 / 25,
//                 width: screenSize.width * 1 / 7,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 3, 39, 68),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   onPressed: () async { 
//                     try{
//                       final data = FirebaseFirestore.instance.collection('SchoolListCollection').doc(id).collection('Students_Parents').doc(model.parentID); 
//                      data.update({"parentName": parentNameController.text, 
//                      "classIncharge": classInChargeController.text, 
//                      "joinDate": joinDateController.text});
//                     } 

//                     catch(e){
//                       print(e.toString());
//                     }

//                   //  final guardianDetails = await GuardianModel(id: guardianIDController.text,
//                   //   guardianName: guardianNameController.text, studentID: studentIDController.text,
//                   //    classIncharge: classInchargeController.text, guardianID: guardianIDController.text, joinDate: joinDateController.text); 
//                   //    CreateGuardiansAddToFireBase().createSchoolController(guardianDetails, context, schoolId);
//                   },
//                   child: const Text("Edit Parent Details"),
//                 ),
//               )
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }