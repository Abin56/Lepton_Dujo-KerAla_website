import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../model/guardian/guardian_model.dart';

class EditGuardianDetails extends StatelessWidget {
   EditGuardianDetails({super.key, required this.model, required this.id}); 
  
  GuardianAddModel model; 
  String id;
  TextEditingController guardianNameController = TextEditingController(); 
  TextEditingController classInChargeController = TextEditingController(); 
  TextEditingController joinDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;  
     guardianNameController.text = model.guardianName??""; 
     joinDateController.text = model.createdate??"";
    return Scaffold(
       appBar: AppBar(backgroundColor: adminePrimayColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: guardianNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: model.guardianName,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: classInChargeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: joinDateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: model.createdate,
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
                width: 250.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async { 
                    // try{
                    //   final data = FirebaseFirestore.instance.collection('SchoolListCollection').doc(id).collection('Student_Guardian').doc(model.guardianID); 
                    //  data.update({"guardianName": guardianNameController.text, 
                    //  "classIncharge": classInChargeController.text, 
                    //  "joinDate": joinDateController.text});
                    // } 

                    // catch(e){
                    //   print(e.toString());
                    // }

                  //  final guardianDetails = await GuardianModel(id: guardianIDController.text,
                  //   guardianName: guardianNameController.text, studentID: studentIDController.text,
                  //    classIncharge: classInchargeController.text, guardianID: guardianIDController.text, joinDate: joinDateController.text); 
                  //    CreateGuardiansAddToFireBase().createSchoolController(guardianDetails, context, schoolId);
                  },
                  child: const Text("Edit Guardian Details"),
                ),
              )
            ]),
          ),
        ),
      ),
    ); }}