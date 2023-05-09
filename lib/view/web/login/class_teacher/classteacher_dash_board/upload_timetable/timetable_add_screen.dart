//import 'package:dujo_website/view/pages/web/class_teacher/upload_timetable/showtimetable.dart';
//import 'package:dujo_website/view/pages/web/class_teacher/upload_timetable/upload_time_tables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../model/time_table_model/day_model.dart';
import '../../../../../../model/time_table_model/time_table_to_firebase.dart';
import '../../../../../constant/constant.dart';
//import 'package:snippet_coder_utils/FormHelper.dart';

class TimeTableScreen extends StatefulWidget {
  TimeTableScreen({super.key, required this.classID, required this.schoolID});

  String classID;
  String schoolID;


  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  TextEditingController numberOfPeriodsController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>(); 
    final _formKey = GlobalKey<FormState>();

  List<TextEditingController> mondayList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> tuesdayList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> wednesdayList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> thursdayList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> fridayList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(131, 234, 241, 1), 
          Color.fromRGBO(99, 164, 255, 1)
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Add Timetable', style: GoogleFonts.poppins(),), 
            backgroundColor:  const Color.fromARGB(255, 0, 70, 128),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async { 

                    //monday timetable 
                
                    if(_formKey.currentState!.validate()){
                         MondayModel Mondaymodel = MondayModel(firstPeriod: {
                      'firstPeriod': mondayList[0].text,
                      'firstPeriodTeacher': mondayList[1].text
                    }, secondPeriod: {
                      'secondPeriod': mondayList[2].text,
                      'secondPeriodTeacher': mondayList[3].text
                    }, thirdPeriod: {
                      'thirdPeriod': mondayList[4].text,
                      'thirdPeriodTeacher': mondayList[5].text
                    }, fourthPeriod: {
                      'fourthPeriod': mondayList[6].text,
                      'fourthPeriodTeacher': mondayList[7].text
                    }, fifthPeriod: {
                      'fifthPeriod': mondayList[8].text,
                      'fifthPeriodTeacher': mondayList[9].text
                    }, sixthPeriod: {
                      'sixthPeriod': mondayList[10].text,
                      'sixthPeriodTeacher': mondayList[11].text
                    }, seventhPeriod: {
                      'seventhPeriod': mondayList[12].text,
                      'seventhPeriodTeacher': mondayList[13].text
                    }, dayName: 'Monday');
              
                    //tuesday timetable
                    MondayModel Tuesdaymodel = MondayModel(firstPeriod: {
                      'firstPeriod': tuesdayList[0].text,
                      'firstPeriodTeacher': tuesdayList[1].text
                    }, secondPeriod: {
                      'secondPeriod': tuesdayList[2].text,
                      'secondPeriodTeacher': tuesdayList[3].text
                    }, thirdPeriod: {
                      'thirdPeriod': tuesdayList[4].text,
                      'thirdPeriodTeacher': tuesdayList[5].text
                    }, fourthPeriod: {
                      'fourthPeriod': tuesdayList[6].text,
                      'fourthPeriodTeacher': tuesdayList[7].text
                    }, fifthPeriod: {
                      'fifthPeriod': tuesdayList[8].text,
                      'fifthPeriodTeacher': tuesdayList[9].text
                    }, sixthPeriod: {
                      'sixthPeriod': tuesdayList[10].text,
                      'sixthPeriodTeacher': tuesdayList[11].text
                    }, seventhPeriod: {
                      'seventhPeriod': tuesdayList[12].text,
                      'seventhPeriodTeacher': tuesdayList[13].text
                    }, dayName: 'Tuesday');
              
                    //wednesday
                    MondayModel Wednesdaymodel = MondayModel(firstPeriod: {
                      'firstPeriod': wednesdayList[0].text,
                      'firstPeriodTeacher': wednesdayList[1].text
                    }, secondPeriod: {
                      'secondPeriod': wednesdayList[2].text,
                      'secondPeriodTeacher': wednesdayList[3].text
                    }, thirdPeriod: {
                      'thirdPeriod': wednesdayList[4].text,
                      'thirdPeriodTeacher': wednesdayList[5].text
                    }, fourthPeriod: {
                      'fourthPeriod': wednesdayList[6].text,
                      'fourthPeriodTeacher': wednesdayList[7].text
                    }, fifthPeriod: {
                      'fifthPeriod': wednesdayList[8].text,
                      'fifthPeriodTeacher': wednesdayList[9].text
                    }, sixthPeriod: {
                      'sixthPeriod': wednesdayList[10].text,
                      'sixthPeriodTeacher': wednesdayList[11].text
                    }, seventhPeriod: {
                      'seventhPeriod': wednesdayList[12].text,
                      'seventhPeriodTeacher': tuesdayList[13].text
                    }, dayName: 'Wednesday');
              
                    //thursday
                    MondayModel Thursdaymodel = MondayModel(firstPeriod: {
                      'firstPeriod': thursdayList[0].text,
                      'firstPeriodTeacher': thursdayList[1].text
                    }, secondPeriod: {
                      'secondPeriod': thursdayList[2].text,
                      'secondPeriodTeacher': thursdayList[3].text
                    }, thirdPeriod: {
                      'thirdPeriod': thursdayList[4].text,
                      'thirdPeriodTeacher': thursdayList[5].text
                    }, fourthPeriod: {
                      'fourthPeriod': thursdayList[6].text,
                      'fourthPeriodTeacher': thursdayList[7].text
                    }, fifthPeriod: {
                      'fifthPeriod': thursdayList[8].text,
                      'fifthPeriodTeacher': thursdayList[9].text
                    }, sixthPeriod: {
                      'sixthPeriod': thursdayList[10].text,
                      'sixthPeriodTeacher': thursdayList[11].text
                    }, seventhPeriod: {
                      'seventhPeriod': thursdayList[12].text,
                      'seventhPeriodTeacher': tuesdayList[13].text
                    }, dayName: 'Thursday');
              
                    //friday
                    MondayModel Fridaymodel = MondayModel(firstPeriod: {
                      'firstPeriod': fridayList[0].text,
                      'firstPeriodTeacher': fridayList[1].text
                    }, secondPeriod: {
                      'secondPeriod': fridayList[2].text,
                      'secondPeriodTeacher': fridayList[3].text
                    }, thirdPeriod: {
                      'thirdPeriod': fridayList[4].text,
                      'thirdPeriodTeacher': fridayList[5].text
                    }, fourthPeriod: {
                      'fourthPeriod': fridayList[6].text,
                      'fourthPeriodTeacher': fridayList[7].text
                    }, fifthPeriod: {
                      'fifthPeriod': fridayList[8].text,
                      'fifthPeriodTeacher': fridayList[9].text
                    }, sixthPeriod: {
                      'sixthPeriod': fridayList[10].text,
                      'sixthPeriodTeacher': fridayList[11].text
                    }, seventhPeriod: {
                      'seventhPeriod': fridayList[12].text,
                      'seventhPeriodTeacher': fridayList[13].text
                    }, dayName: 'Friday');
              
                      AddTimeTableToFirebase().AddTimeTablesToFirebase(
                        widget.schoolID,
                        widget.classID,
                        Mondaymodel,
                        Tuesdaymodel,
                        Wednesdaymodel,
                        Thursdaymodel,
                        Fridaymodel).then((value) => showToast(msg: 'TimeTable Added!'));

                        
                    // Navigator.push(context, MaterialPageRoute(builder: ((context) => ShowTimeTable(k))));
                  
                    }},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                 
                  child:  Text(
                    'Submit Timetable',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          // body: Center(
          //   child: Container(
          //     height: 300,
          //     width: 300,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //        Padding(
          //          padding:  EdgeInsets.only(),
          //          child: TextField(
          //                 controller: numberOfPeriodsController,
          //                 decoration: InputDecoration(
          //                   filled: true,
          //                   fillColor: Colors.white,
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(15),
          //                     borderSide: BorderSide.none,
          //                   ),
          //                   hintStyle: TextStyle(fontSize: 19),
          //                   hintText: 'Enter the number of periods',
          //                 ),
          //                 style: TextStyle(fontSize: 19),
          //               ),
          //        ),
          //        sizedBoxH10,
          //        GestureDetector(
          //         onTap: (){
          //           Navigator.push(context, MaterialPageRoute(builder: ((context) => UploadTimetableScreen(numberOfPeriodsinString: numberOfPeriodsController.text,))));
          //         },
          //          child: ButtonContainerWidget(
          //                     curving: 30,
          //                     // ignore: sort_child_properties_last
          //                     child: Center(
          //                       child: Text("Done",
          //                           style: GoogleFont.subHeadTextStyle),
          //                     ),
          //                     colorindex: 7,
          //                     height: 50,
          //                     width: 100),
          //        ),
          //       ],
          //     ),
          //   ),
          // ),
          //   body: ListView(  //second
          //     shrinkWrap: true,
          //     physics: ScrollPhysics(),
          //     children: [
          //       Column(
          //         children: [
          //           sizedBoxH20,
          //           Text('Monday', style: TextStyle(fontSize: 20, color: Colors.white),), sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ), sizedBoxH20,
          //             SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ), sizedBoxH20,
          //             SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ), sizedBoxH20,
          //             SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),  sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),
          //           Text('Tuesday', style: TextStyle(fontSize: 20),),
          //            sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),
          //            sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),
          //            sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),
          //            sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),
          //            sizedBoxH20,
          //           SizedBox(
          //             height: 50,
          //             width: 200,
          //             child: TextField(
          //                    // controller: numberOfPeriodsController,
          //                     decoration: InputDecoration(
          //                       filled: true,
          //                       fillColor: Colors.white,
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(5),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintStyle: TextStyle(fontSize: 15),
          //                       hintText: '',
          //                     ),
          //                     style: TextStyle(fontSize: 19),
          //                   ),
          //           ),

          //         ],
          //       )
          //     ],
          //   ),
          // );
          body: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form( 
                    key: _formKey,
                    child: Flexible(
                      child: Container(
                        child: periodListWidget('Monday', mondayList),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                        child: periodListWidget('Tuesday', tuesdayList)),
                  ),
                  Flexible(
                    child: Container(
                        child: periodListWidget('Wednesday', wednesdayList)),
                  ),
                  Flexible(
                    child: Container(
                        child: periodListWidget('Thursday', thursdayList)),
                  ),
                  Flexible(
                    child: Container(
                      child: periodListWidget('Friday', fridayList),
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   bottom: 50,
              //   left: 50,
              //   right: 50,
              //   child: SizedBox(
              //     height: 100,
              //     child: ElevatedButton(onPressed: (){}, child: Text('Add Timetable', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),))),
              // )
            ],
          )),
    );
  }

  // Widget ui_Widget(day) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: ListView(
  //       children: [
  //         Text(
  //           day,
  //           style: TextStyle(
  //               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  //         ),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'firstperiod', '', 'First Period',
  //             borderRadius: 10,
  //             textColor: Colors.white,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'secondperiod', '', 'Second Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'thirdperiod', '', 'Third Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'fourthperiod', '', 'Fourth Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'fifthperiod', '', 'Fifth Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderFocusColor: Colors.white,
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'sixthperiod', '', 'Sixth Period',
  //               textColor: Colors.white,
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         ),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'seventhperiod', '', 'Seventh Period',
  //               textColor: Colors.white,
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         ),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'eighthperiod', '', 'Eighth Period',
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         ),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'nineth', '', 'Nineth Period',
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

periodListWidget(String day, List<TextEditingController> contList) {
  return ListView(
    children: [
      const SizedBox(
        height: 10,
      ),
      Center(
          child: Text(
        day,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      )),
      sizedBoxH10,
      ui_W('First Period', contList[0]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('First Period Teacher', contList[1]),
      sizedBoxH20,
      ui_W('Second Period', contList[2]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('Second Period Teacher', contList[3]),
      sizedBoxH20,
      ui_W('Third Period', contList[4]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('Third Period Teacher', contList[5]),
      sizedBoxH20,
      ui_W('Fourth Period', contList[6]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('Fourth Period Teacher', contList[7]),
      sizedBoxH20,
      ui_W('Fifth Period', contList[8]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('Fifth Period Teacher', contList[9]),
      sizedBoxH20,
      ui_W('Sixth Period', contList[10]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('Sixth Period Teacher', contList[11]),
      sizedBoxH20,
      ui_W('Seventh Period', contList[12]),
      const SizedBox(
        height: 0,
      ),
      const SizedBox(
        height: 5,
      ),
      ui_W('Seventh Period Teacher', contList[13]),
    ],
  );
}

ui_W(String text, TextEditingController cont) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 25.0,
      right: 25,
    ),
    child: SizedBox(
      //height: 36,
      child: TextFormField(
         validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please don\'t leave any empty fields';
              }
              return null;
            },
        controller: cont,
        decoration: InputDecoration(
            labelText: text,
            labelStyle: GoogleFonts.poppins(color:const Color.fromARGB(255, 0, 70, 128)),
            //  hintStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:  const BorderSide(color: Color.fromARGB(255, 0, 70, 128))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:  const BorderSide(color:  Colors.blue))),
      ),
    ),
  );
}

// TextField(

//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: 'Name',
//                     ),
//                   ),
