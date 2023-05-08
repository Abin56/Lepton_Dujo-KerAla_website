import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/time_table_model/day_model.dart'; 
import 'package:get/get.dart';

class AddTimeTableToFirebase{
  FirebaseFirestore _firestore = FirebaseFirestore.instance; 

  Future<void>AddTimeTablesToFirebase(String schoolID, String classID, MondayModel MondayModel,MondayModel tuesdayModel, MondayModel wednesdayModel,
  MondayModel thursdayModel, MondayModel fridayModel )async{ 
    try{
       await _firestore.collection('SchoolListCollection').doc(schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('classes').doc(Get.find<GetFireBaseData>().classIDD.value).collection('TimeTables').doc(MondayModel.dayName)
        .set(MondayModel.toJson()); 

       await _firestore.collection('SchoolListCollection').doc(schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('classes').doc(Get.find<GetFireBaseData>().classIDD.value).collection('TimeTables').doc(tuesdayModel.dayName)
        .set(tuesdayModel.toJson()); 

        await _firestore.collection('SchoolListCollection').doc(schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('classes').doc(Get.find<GetFireBaseData>().classIDD.value).collection('TimeTables').doc(wednesdayModel.dayName)
        .set(wednesdayModel.toJson());  

        await _firestore.collection('SchoolListCollection').doc(schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('classes').doc(Get.find<GetFireBaseData>().classIDD.value).collection('TimeTables').doc(thursdayModel.dayName)
        .set(thursdayModel.toJson());  

         await _firestore.collection('SchoolListCollection').doc(schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('classes').doc(Get.find<GetFireBaseData>().classIDD.value).collection('TimeTables').doc(fridayModel.dayName)
        .set(fridayModel.toJson()); 
    } 
    catch(e){
      print(e.toString());
    }
   
  }
} 