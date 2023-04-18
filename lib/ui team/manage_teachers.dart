import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class ManageTeachers extends StatefulWidget {
  const ManageTeachers({Key? key}) : super(key: key);

  @override
  State<ManageTeachers> createState() => _ManageTeachersState();
}

class _ManageTeachersState extends State<ManageTeachers> {
  @override
  Widget build(BuildContext context) {
    var screenSize= MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
            title: Text("MANAGE TEACHERS"),
           leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               icon:Icon(Icons.arrow_back_ios), 
               //replace with our own icon data.
            )
          
          ),
        body: Padding(
          padding: EdgeInsets.only(left: screenSize.width/10, right:screenSize.width/10, top: screenSize.width/15,),
          child: Row(
            children: [
             
                 Container(
                  height: screenSize.height/2.5,
                  width: screenSize.width/5,
                  decoration: BoxDecoration(
                  //  color: Colors.amber,
            
              border: Border.all(
                color: Color.fromARGB(255, 223, 96, 223),
                width: 4,
              ), //Border.all
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    3.0,
                    3.0,
                  ), //Offset
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
                   child: Profile(
                    imageUrl: "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                    name: "Shamim Miah",
                    teacherID: "123456789",


                    // website: "shamimmiah.com",
                    // designation: "Project Manager | Flutter & Blockchain Developer",
                    // email: "cse.shamimosmanpailot@gmail.com",
                    // phone_number: "01757736053",
                                 ),
                 ),
                SizedBox(width: screenSize.width/10,),
                Container(
                  height: screenSize.height/2.5,
                  width: screenSize.width/5,
                  decoration: BoxDecoration(
                  //  color: Colors.amber,
            
              border: Border.all(
                color: Color.fromARGB(255, 223, 96, 223),
                width: 4,
              ), //Border.all
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    3.0,
                    3.0,
                  ), //Offset
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
                   child: Profile(
                    imageUrl: "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                    name: "Shamim Miah",
                    teacherID: "123456789",


                    // website: "shamimmiah.com",
                    // designation: "Project Manager | Flutter & Blockchain Developer",
                    // email: "cse.shamimosmanpailot@gmail.com",
                    // phone_number: "01757736053",
                                 ),
                 ),
                 SizedBox(width: screenSize.width/10,),
                 Container(
                  height: screenSize.height/2.5,
                  width: screenSize.width/5,
                  decoration: BoxDecoration(
                  //  color: Colors.amber,
            
              border: Border.all(
                color: Color.fromARGB(255, 223, 96, 223),
                width: 4,
              ), //Border.all
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    3.0,
                    3.0,
                  ), //Offset
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
                   child: Profile(
                    imageUrl: "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                    name: "Shamim Miah",
                    teacherID: "123456789",


                    // website: "shamimmiah.com",
                    // designation: "Project Manager | Flutter & Blockchain Developer",
                    // email: "cse.shamimosmanpailot@gmail.com",
                    // phone_number: "01757736053",
                                 ),
                 ),
            ],
          ),
        )
      );
  }
}

