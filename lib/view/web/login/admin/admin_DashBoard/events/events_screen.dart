
// ignore_for_file: sort_child_properties_last

import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/events/event_edit.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/custom_container.dart';
import 'events_add_screen.dart';


class EventsUpdates extends StatefulWidget {
   EventsUpdates({super.key, required this.schoolID}); 

  String schoolID; 


  @override
  State<EventsUpdates> createState() => _EventsUpdatesState();
}

class _EventsUpdatesState extends State<EventsUpdates> { 

  
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Events'),backgroundColor: adminePrimayColor,
      // ),
      body: 
        Row(
          children: [
             Container(height: screenSize.height,
                  width: screenSize.width * 1 / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButtonBackWidget(color: cWhite),
                      Expanded(
                        child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Hi ! Admin ',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 48.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  ' Create Events',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 28.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                            
                                SizedBox(
                                  height: 300,
                                  width:screenSize.width/2,
                                  child: LottieBuilder.network(
                                      'https://assets1.lottiefiles.com/packages/lf20_98vgucqb.json'),
                                )
                              ],
                            ),
                      ),
                    ],
                  ),
                  color: adminePrimayColor),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(top: 250.w,left: 165.w),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEventsAdmin(schoolID: widget.schoolID),
                            ));
                      },
                      child: SizedBox(
                          height: screenSize.width * 1 / 15,
                          width: screenSize.width * 1 / 3,
                          child: CustomContainer(
                            text: 'Create Events',
                            onTap: () {},
                          )),
                    ),
                    sizedBoxH30,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventsEditREmove(schoolID: widget.schoolID),
                            ));
                      },
                      child: SizedBox(
                          height: screenSize.width * 1 / 15,
                          width: screenSize.width * 1 / 3,
                          //color: Colors.red,
                          child: CustomContainer(
                            text: 'Edit / Remove',
                            onTap: () {},
                          )),
                    ),
                    // Padding(
                    //     padding: const EdgeInsets.all(10),
                    //     child: (InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => AdminTeacherList(),
                    //             ));
                    //       },
                    //       child: Container(
                    //           height: screenSize.width * 1 / 10,
                    //           width: screenSize.width * 1 / 3,
                    //           child: CustomContainer(
                    //             text: 'Remove Events',
                    //             onTap: () {},
                    //           )),
                    //     ))),
                  ],
                ),
              ),
            ),
          ],
        ),
     
    );
  }
  

}
