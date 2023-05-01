
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/achievements/add_achievements.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_container.dart';
import 'achievements_view.dart';


class Achievements extends StatefulWidget {
  Achievements({super.key, required this.schoolID});

  String schoolID;

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override



   Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
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
                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                IconButtonBackWidget(color: cWhite),
                                Expanded(
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
                                        'Achievements',
                                        style: ralewayStyle.copyWith(
                                          fontSize: 25.0,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),                            
                                      SizedBox(
                                        height: screenSize.width/3.5,
                                        width:screenSize.width/1,
                                        child: LottieBuilder.network(
                                            "https://assets5.lottiefiles.com/packages/lf20_6qeidctp.json"),
                                      )                        
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Padding(
             padding:  EdgeInsets.only(left: 120.w),
                         child: Container(
                          
                          child: Column(
          children: [
            (InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAchievements(
                        schoolID: widget.schoolID,
                      ),
                    ));
              },
              child: SizedBox(
                  height: screenSize.width * 1 / 10,
                  width: screenSize.width * 1 / 3,
                  child: CustomContainer(
                    text: 'Add Achievements',
                    onTap: () {},
                  )),
            )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AchievementsViewAndEdit(
                              schoolID: widget.schoolID),
                        ));
                  },
                  child: SizedBox(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Edit  Achievements',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AdminTeacherList(),
                  //       ));
                  // },
                  child: SizedBox(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove Acheivements',
                        onTap: () {},
                      )),
                ))),
          ],
        ), 
                        ),
                      ),                              
                      
              ]),
             ),
         ])
      ), 
       );
 }
}







