import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../model/pTA_section/add_PTAMemberModel.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import 'dropDownListofPTA_section.dart';


// ignore: must_be_immutable
class AddPtaMembersScreen extends StatelessWidget {
  var id;

  AddPtaMembersScreen({this.id, super.key});

  TextEditingController ptaMemberNameController = TextEditingController();

  TextEditingController ptaMemberIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(title: const Text('Add PTA Members'),
      backgroundColor: adminePrimayColor,),
      body:
       ListView(
          children:[
             Row(
               children: [ 
                Container(
                       color: adminePrimayColor,
                       height: size.height,
                      width: size.width * 1 / 2,
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
                            SizedBox(height: size.width/20,),
                             Text(
                              'Welcome To ',
                              style: ralewayStyle.copyWith(
                                fontSize: 25.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                        
                            SizedBox(
                              height: size.width/5,
                              width:size.width/2,
                              child: LottieBuilder.network(
                                  'https://assets1.lottiefiles.com/packages/lf20_vvtkfqbo.json'),
                            )
                      //       SizedBox(
                      // height: 400,
                      // width: 600,
                      // child: LottieBuilder.asset(
                      //     "assets/images/")),
                          ],
                        ),
                ),
                        
                       Padding(
                        padding:  EdgeInsets.only(left: size.width/8),
                        child: Container(
                          height: size.height * 1 /1 ,
                           width: size.width * 1 / 4,
                          child: Padding(
                            padding:  EdgeInsets.only(top: size.width/22),
                            child: Container(
                                        color: Colors.white,
                                       // height: size.width * 1 / 2,
                                        width: size.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaMemberNameController,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      icon: const Icon(Icons.person_3,color: Color.fromARGB(255, 13, 5, 122)),
                      labelText: 'Name ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaMemberIDController,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20) 
                      ),
                       icon: const Icon(Icons.people_outline_sharp,color: Color.fromARGB(255, 13, 5, 122)),
                      labelText: 'Member ID',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: PTASectionDropDownButton(schooilID: id,)),
                SizedBox(
                  height: size.width * 1 / 25,
                  width: size.width * 1 / 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      final ptaMemberDetails = AddPTAMemberModel(
                          id: ptaMemberIDController.text.trim(),
                          ptaCategory: pTAPowerDownValue!["id"],
                          active: false,
                          PtaMemberID: ptaMemberIDController.text.trim(),
                          userName: ptaMemberNameController.text.trim(),
                          joinDate: DateTime.now().toString());
                      await PTAMembersAddToFireBase().pTAMembersAddController(
                          ptaMemberDetails, context, id);
                    },
                    child: const Text("Add Category"),
                  ),
                )
               ]),
            ),
                   ),
                 ),
                       )
               ],
             ),
           ]
         ),                
    );
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
   