import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/time_table_model/day_model.dart';

class AddTimeTableToFirebase{
  FirebaseFirestore _firestore = FirebaseFirestore.instance; 

  AddTimeTablesToFirebase(String schoolID, String classID, MondayModel MondayModel,MondayModel tuesdayModel, MondayModel wednesdayModel,
  MondayModel thursdayModel, MondayModel fridayModel )async{
    try{
       await _firestore.collection('SchoolListCollection').doc(schoolID).collection('Classes').doc(classID).collection('TimeTables').doc(MondayModel.dayName)
        .set(MondayModel.toJson()); 

       await _firestore.collection('SchoolListCollection').doc(schoolID).collection('Classes').doc(classID).collection('TimeTables').doc(tuesdayModel.dayName)
        .set(tuesdayModel.toJson()); 

        await _firestore.collection('SchoolListCollection').doc(schoolID).collection('Classes').doc(classID).collection('TimeTables').doc(wednesdayModel.dayName)
        .set(wednesdayModel.toJson());  

        await _firestore.collection('SchoolListCollection').doc(schoolID).collection('Classes').doc(classID).collection('TimeTables').doc(thursdayModel.dayName)
        .set(thursdayModel.toJson());  

         await _firestore.collection('SchoolListCollection').doc(schoolID).collection('Classes').doc(classID).collection('TimeTables').doc(fridayModel.dayName)
        .set(fridayModel.toJson()); 
    } 
    catch(e){
      print(e.toString());
    }
   
  }
} 