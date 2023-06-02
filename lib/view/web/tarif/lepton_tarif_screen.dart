// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dujo_kerala_website/controller/payment_tarif/checking_tarif_controller.dart';
// import 'package:dujo_kerala_website/model/tarif_purchase_model/tarif_purchase_model.dart';
// import 'package:dujo_kerala_website/view/constant/constant.dart';
// import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
// import 'package:dujo_kerala_website/view/web/widgets/button_container_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../controller/add_Newschool/add_new_schhol.dart';
// import '../../google_poppins_widget/google_poppins_widget.dart';
// import '../widgets/drop_DownList/get_tarif.dart';

// class LeptonTarifScreen extends StatefulWidget {
//   const LeptonTarifScreen({super.key});

//   @override
//   State<LeptonTarifScreen> createState() => _LeptonTarifScreenState();
// }

// class _LeptonTarifScreenState extends State<LeptonTarifScreen> {
//   AddNewSchoolController addNewSchoolController =
//       Get.put(AddNewSchoolController());
//   final _formKey = GlobalKey<FormState>();
//   bool isChecked = false;
//   bool showError = false;

//   void _validateForm() {
//     setState(() {
//       showError = true;
//     });

//     if (isChecked) {
//       // Checkbox is checked, perform necessary actions
//       // e.g., save data, navigate to a new screen, etc.
//       print('Checkbox is checked!');
//     }
//   }

//   TarifController tarifController = Get.put(TarifController());

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     String totalpayment = '';
//     double gst = 0;
//     //total = totalpayment+(totalpayemt)*18/100
//     // return 
//   }




// }
