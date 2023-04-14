
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/events/event_edit.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('Events'),backgroundColor: adminePrimayColor,
      ),
      body: 
        Row(
          children: [
             Container(height: screenSize.height,
                  width: screenSize.width * 1 / 2,
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hi ! Admin \n Create\n Events',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0,
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
                  color: adminePrimayColor),
            Container(
              child: Column(
                children: [
                  Padding(
                     padding: const EdgeInsets.only(top: 120,right: 110, left: 110, bottom: 30),
                      child: (InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddEventsAdmin(schoolID: widget.schoolID),
                              ));
                        },
                        child: Container(
                            height: screenSize.width * 1 / 15,
                            width: screenSize.width * 1 / 3.5,
                            child: CustomContainer(
                              text: 'Create Events',
                              onTap: () {},
                            )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.only(top: 30,right: 110, left: 110, bottom: 30),
                      child: (InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventsEditREmove(schoolID: widget.schoolID),
                              ));
                        },
                        child: Container(
                            height: screenSize.width * 1 / 15,
                            width: screenSize.width * 1 / 3.5,
                            //color: Colors.red,
                            child: CustomContainer(
                              text: 'Edit / Remove',
                              onTap: () {},
                            )),
                      ))),
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
          ],
        ),
     
    );
  }
  

}
