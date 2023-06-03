import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/manage_notifications/attendance/manage_Attendance_notifications.dart';
import 'package:flutter/material.dart';

class MainScreenNotifications extends StatelessWidget {
  const MainScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        title: const Text('Notification Management'),
      ), 
      body: GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, 
        mainAxisSpacing: 50, crossAxisSpacing: 50, 
   
        ), 
        children: [
          GestureDetector( 
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAttendanceNotifications(),));
            },
            child: const SizedBox( 
              height: 50, 
              width: 50, 
              
              child: Card(
                color: Colors.pinkAccent,
                child: Center(child: Text('Attendance', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),))
              ),
            ),
          )
        ], 
      )
    );
  }
}