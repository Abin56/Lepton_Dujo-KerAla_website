import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/upload_timetable/timetable_add_screen.dart';
//import 'package:dujo_website/view/pages/web/class_teacher/upload_timetable/timetable_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant/constant.dart';

class SelectClassForTimeTable extends StatefulWidget {
   SelectClassForTimeTable({super.key, required this.schoolID}); 

   String schoolID;

  @override
  State<SelectClassForTimeTable> createState() => _SelectClassForTimeTableState();
}

class _SelectClassForTimeTableState extends State<SelectClassForTimeTable> { 
 var classListValue;

 FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance; 

  @override
  Widget build(BuildContext context) {
    return Container( 
       decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(131, 234, 241, 1), 
          Color.fromRGBO(99, 164, 255, 1)
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column( 
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text('Select Class', style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold,),),  
    
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolID).collection('Classes').snapshots(),
                builder:  (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
                if(snapshot.hasData){
                  return  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 500.0, left: 500, top: 50, bottom: 50),
                      child: DropdownButtonFormField(
                                  hint: classListValue == null
                        ? const Text(
                            "Select Class",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                          )
                        : Text(classListValue!["classID"]),
                                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                                  ),
                                  items: snapshot.data!.docs.map(
                      (val) {
                        return DropdownMenuItem(
                          value: val["classID"],
                          child: Text(val["classID"]),
                        );
                      },
                                  ).toList(),
                                  onChanged: (val) {
                      var categoryIDObject = snapshot.data!.docs
                          .where((element) => element["classID"] == val)
                          .toList()
                          .first;
                                   
                      setState(
                        () {
                          classListValue = categoryIDObject;
                        },
                      );
                                  },
                                ),
                    ),
                  );
                } 
                return CircularProgressIndicator();
              }),
              sizedBoxH20,
            //   DropdownButton<String>(
            // value: dropdownValue,
            // onChanged: (String? newValue) {
            //   setState(() {
            //     dropdownValue = newValue!;
            //   });
            // },
            // items: options.map<DropdownMenuItem<String>>((String value) {
            //   return DropdownMenuItem<String>(
            //     value: value,
            //     child: Text(value),
            //   );
            // }).toList(),
            // ),] 
    
            MaterialButton(
              color: Color.fromARGB(255, 0, 70, 128),
              onPressed: (){
              print(classListValue!["classID"]);
             Navigator.push(context, MaterialPageRoute(builder: ((context) => TimeTableScreen(classID: classListValue!["classID"], schoolID: widget.schoolID,)))); 
              
            }, child: Text('OK', style: GoogleFonts.poppins(color: Colors.white),))
          ])
    
    
    
    
        ),
      ),
    );
  }
}