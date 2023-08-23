// import 'package:dujo_kerala_website/view/constant/constant.dart';
// import 'package:flutter/material.dart';

// class NotificatonScreen extends StatelessWidget {
//    NotificatonScreen({super.key});

//   TextEditingController messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text('Common Notifications'),
//       ), 

//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 75.0, left: 75.0),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: TextField(
//                   controller: messageController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter the notification message to be sent',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 2.0,
//                       ),
//                     ),
//                   ),
            
//                   ),
//                 ),
//             ),
//             // sizedBoxH20,
//             MaterialButton(onPressed: (){
              
//             }, color: Colors.blue ,child: const Text('Send Notification'),)
//           ],
//         )));
//   }
// }