// // import 'package:flutter/material.dart';

// // void main(){
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context) {
// //      return MaterialApp(
// //          home: Home()
// //       );
// //   }
// // }

// // class Home extends  StatefulWidget {
// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   String? gender; //no radio button will be selected
// //   //String gender = "male"; //if you want to set default value
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //             title: Text("Radio Button in Flutter"),
// //             backgroundColor: Colors.deepOrangeAccent,
// //         ),
// //         body: Container( 
// //             padding: EdgeInsets.all(20),
// //             child: 
// //           Column(
// //             children: [
                
// //                 Text("What is your gender?", style: TextStyle( 
// //                     fontSize: 18
// //                 ),),

// //                 Divider(),
                
// //                 RadioListTile(
// //                     title: Text("Male"),
// //                     value: "male", 
// //                     groupValue: gender, 
// //                     onChanged: (value){
// //                       setState(() {
// //                           gender = value.toString();
// //                       });
// //                     },
// //                 ),

// //                 RadioListTile(
// //                     title: Text("Female"),
// //                     value: "female", 
// //                     groupValue: gender, 
// //                     onChanged: (value){
// //                       setState(() {
// //                           gender = value.toString();
// //                       });
// //                     },
// //                 ),

// //                 RadioListTile(
// //                       title: Text("Other"),
// //                       value: "other", 
// //                       groupValue: gender, 
// //                       onChanged: (value){
// //                         setState(() {
// //                             gender = value.toString();
// //                         });
// //                       },
// //                 )
// //             ],
// //           ),
// //         ),
// //     );
// //   } 
// // }


// import 'package:flutter/material.dart';

// class MyRadioGroup extends StatefulWidget {
//   @override
//   _MyRadioGroupState createState() => _MyRadioGroupState();
// }

// class _MyRadioGroupState extends State<MyRadioGroup> {
//   String? selectedOption;

//   void setSelectedOption(String option) {
//     setState(() {
//       selectedOption = option;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Choose an option:'),
//         Row(
//           children: [
//             Radio(
//               value: 'option 1',
//               groupValue: selectedOption,
//               onChanged: setSelectedOption,
//             ),
//             Text('Option 1'),
//           ],
//         ),
//         Row(
//           children: [
//             Radio(
//               value: 'option 2',
//               groupValue: selectedOption,
//               onChanged: setSelectedOption,
//             ),
//             Text('Option 2'),
//           ],
//         ),
//         Row(
//           children: [
//             Radio(
//               value: 'option 3',
//               groupValue: selectedOption,
//               onChanged: setSelectedOption,
//             ),
//             Text('Option 3'),
//           ],
//         ),
//       ],
//     );
//   }
// }