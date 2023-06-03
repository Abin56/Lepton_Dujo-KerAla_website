import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAttendanceNotifications extends StatefulWidget {
   const ManageAttendanceNotifications({super.key});

  @override
  State<ManageAttendanceNotifications> createState() => _ManageAttendanceNotificationsState();
}

class _ManageAttendanceNotificationsState extends State<ManageAttendanceNotifications> {
  TextEditingController timeController = TextEditingController();

  TimeOfDay? selectedTime;

  Future<void> addTimeToFirebase()async{
    await FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection('Notifications').doc('Attendance').set({
      'timeToDeliverAbsenceNotification' : timeController.text
    }).then((value) => showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Attendance Notifications'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Time Added !')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },));
  }

  // Future<void>_selectTime(BuildContext context)async{
  //   final TimeOfDay? pickedTime =  await showTimePicker(context: context, initialTime: selectedTime!); 
    
  //   if(pickedTime!=null && pickedTime != selectedTime){
  //     selectedTime = pickedTime;
  //   } 

  //   setState(() {
  //     String time = '${selectedTime!.hour}:${(selectedTime!.minute.toString().length == 1)? '0${selectedTime!.minute.toString()}': selectedTime!.minute}';
  //    timeController.text =  time.toString();
  //   });

    
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //selectedTime = TimeOfDay.now();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              
              Expanded(
                child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 2)),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: timeController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Enter time (in hours) to wait before sending absence notifications to parents',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 168, 166, 166)),
                  ),
                ),
                  ),
              ),
            ],
          ), 

    sizedBoxH10, 
    MaterialButton(onPressed: (){
      addTimeToFirebase();
    }, 
    color: Colors.blue,
    child:  GoogleMonstserratWidgets(text: 'Add', fontsize: 15)
    
    )]
      ),
    );
  }
}