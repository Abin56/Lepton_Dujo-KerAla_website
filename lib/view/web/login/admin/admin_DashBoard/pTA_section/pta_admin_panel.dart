import 'dart:developer';

import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/pTA_section/pta_member_list.dart';
import 'package:dujo_kerala_website/view/web/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../controller/Getx/pta_category_list/pta_category_memberslist.dart';
import '../../../../../../model/pTA_section/add_PTAMemberModel.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import 'add_PTAMembers.dart';
import 'add_PTA_Category.dart';
import 'pta_member_remove.dart';

class PtaMemberAdmin extends StatefulWidget {
  final String id;
  const PtaMemberAdmin({required this.id, super.key});

  @override
  State<PtaMemberAdmin> createState() => _PtaMemberAdminState();
}

class _PtaMemberAdminState extends State<PtaMemberAdmin> {
  final getxController = Get.put(PTACategoeyMembersList());
  String name = '';
  int lenth = 0;
  // ignore: unused_field
  final bool _showContainer = false;
  List<AddPTAMemberModel> allMembers = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('PTA'),
      backgroundColor: adminePrimayColor,),
        backgroundColor: Colors.white,

         body:  SingleChildScrollView(
        child: Column(
            children:[
               Container(
                 child: Row(
                   children: [ 
                    Container(
                           color: Color.fromARGB(255, 12, 34, 133),
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
                                      "https://assets3.lottiefiles.com/packages/lf20_3n0j5bwn.json"),
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
                                padding:EdgeInsets.only(top: screenSize.width/20),
                                 child: Column(                                    
                                          children: [ 
                                            Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddPtaMembersScreen(id: widget.id),
                              ),
                            );
                          },
                          child: Container(
                              height: screenSize.width * 1 / 15,
                              width: screenSize.width * 1 / 3.7,
                              child: CustomButton(
                                text: "Create Members",
                                onTap: () {},
                              )
                              // color: Colors.red,
                              ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: screenSize.width * 1 / 15,
                            width: screenSize.width * 1 / 3.7,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddPTACategoryAcreen(
                                            id: widget.id,
                                          )),
                                );
                              },
                              child: ptacontainer(
                                screenSize: screenSize, text: 'Create PTA Category', onTap: () {  },),
                            ),
                          )),
                           Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PTAMemberList(),
                              ),
                            );
                          },
                          child: ptacontainer(
                                screenSize: screenSize, text: 'Members List', onTap: () { 
                                  
                                },),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RemovePtaMembers(schoolId: widget.id),
                              ),
                            );
                          },
                          child: ptacontainer(
                                screenSize: screenSize, text: 'Remove Members', onTap: () { 

                                },),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 35,
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

class ptacontainer extends StatelessWidget {
   ptacontainer({
    super.key,
    required this.screenSize, required this.text,required this.onTap
  });

  final Size screenSize;
  final String text;
  VoidCallback  onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.width * 1 / 15,
      width: screenSize.width * 1 / 3.7,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: containerColor[7],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Center(
          child: Text(text,
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.black)
            //TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),    
      ),
    );
  }
}
