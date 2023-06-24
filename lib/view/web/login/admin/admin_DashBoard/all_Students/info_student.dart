import 'package:flutter/material.dart';

getInfoofStudent(BuildContext context) {
  return showBottomSheet(context: context, builder: (context) {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        color: Colors.white,
      ),
    );
    
  },);
}

// class StudentsInfo extends StatelessWidget {
//   const StudentsInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ,
//     );
//   }
// }