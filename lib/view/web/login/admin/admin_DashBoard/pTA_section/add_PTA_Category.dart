import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../model/pTA_section/pta_category_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';


class AddPTACategoryAcreen extends StatelessWidget {
  var id;


  AddPTACategoryAcreen(
      {
      this.id,
      super.key});

  TextEditingController ptaCategoryNameController = TextEditingController();

  TextEditingController ptaIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('Add PTA Category'),
      backgroundColor: adminePrimayColor),

      body:  SingleChildScrollView(
        child: Column(
            children:[
               Container(
                 child: Row(
                   children: [ 
                    Container(
                           color: adminePrimayColor,
                           height: screenSize.height,
                          width: screenSize.width * 1 / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Hi Admin ',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 48.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: screenSize.width/20,),
                                 Text(
                                  'Welcome',
                                  style: GoogleFonts.aclonica(
                                    fontSize: 25.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),                            
                                SizedBox(
                                  height: screenSize.width/3.5,
                                  width:screenSize.width/1,
                                  child: LottieBuilder.network(
                                      "https://assets3.lottiefiles.com/packages/lf20_uwh9uhdt.json"),
                                )                        
                              ],
                            ),
                    ),                            
                        Padding(
                            padding:  EdgeInsets.only(left: screenSize.width/8),
                            child: Container(
                              height: screenSize.height * 1 /1 ,
                               width: screenSize.width * 1 / 3,
                              child: SingleChildScrollView(
                                padding: EdgeInsets.only(top:screenSize.width/18),
                                 child: Column(                                    
                                          children: [
                                            Center(
            child: Container(
              decoration: BoxDecoration( border: Border.all(width: 1),
              color: Colors.white,),
              height: screenSize.width * 1 / 4,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaCategoryNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'PTA CategoryName',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaIDController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'PTA ID  ',
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      final ptaCategoryDetails = AddPTACategoryModel(
                          id: ptaIDController.text.trim(),
                          ptaCategory: ptaCategoryNameController.text.trim(),
                          active: false,
                          PTAID: ptaIDController.text.trim(),
                          joinDate: DateTime.now().toString());
                      await PTACategoryAddToFireBase().pTACategoryAddController(
                          ptaCategoryDetails, context, id);
                    },
                    child: const Text("Add Category"),
                  ),
                )
              ]),
            ),
          ),                 
                        ])
                       )
                     )
                  )
              ]),
             ),
         ])
      ), 
      
    );
  }
}
