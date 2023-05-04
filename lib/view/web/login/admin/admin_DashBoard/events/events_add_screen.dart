// ignore_for_file: sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../model/admin_models/event_model/events_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class AddEventsAdmin extends StatefulWidget {
   AddEventsAdmin({super.key, required this.schoolID}); 

  String schoolID;
  bool loadingStatus = false;

  @override
  State<AddEventsAdmin> createState() => _AddEventsAdminState();
}

class _AddEventsAdminState extends State<AddEventsAdmin> { 

  
  
  TextEditingController headingController = TextEditingController(); 
  TextEditingController dateController = TextEditingController(); 
  TextEditingController descriptionController = TextEditingController(); 
  TextEditingController venueController = TextEditingController(); 
  TextEditingController signedByController = TextEditingController(); 

  EventModel? modell;
  final _formKey = GlobalKey<FormState>();

    addEvent(){
    FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolID).collection('AdminEvents').doc(modell!.id).set(modell!.toJson()).then((value) => showToast(msg: 'New Achievement Added!'));
  }

  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Form(
      key:_formKey ,
      child: Scaffold(
        //backgroundColor: Color.fromARGB(255, 27, 95, 88),
        //appBar: AppBar(title: Text('Add New Events'),
       // backgroundColor: adminePrimayColor),
        body: SingleChildScrollView(
          
            child: Center(
              child: Row(
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
                                    'Hi ! Admin',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 48.0,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    'Create New\n Events',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 29.0,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                              
                                  
                                  Container(
                                    height: 300,
                                    width:screenSize.width/2,
                                    child: LottieBuilder.network(
                                        'https://assets1.lottiefiles.com/packages/lf20_98vgucqb.json'),
                                  ),
                                ],
                              ),
                        ),
                      ],
                    ),
                    color:adminePrimayColor),
              
    
    
                  Container(
                    color: Colors.white,
                    height: screenSize.height * 1 /1 ,
                    width: screenSize.width * 1 / 2,
                    child: Column(children: [
                      
                      Padding(
                        padding: EdgeInsets.only(top: 80, bottom: 10,left: 100,right: 100),
                        child: TextFormField(
                           validator: checkFieldEmpty,
                          controller: dateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),
    
                       Padding(
                         padding: EdgeInsets.only(top: 10, bottom: 10,left: 100,right: 100),
                        child: TextFormField(
                           validator: checkFieldEmpty,
                           controller: headingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Heading',
                          ),
                        ),
                      ),
                   
                      // SizedBox(
                      //   height: 10,
                      // ), 
                         Padding(
                         padding: EdgeInsets.only(top: 10, bottom: 10,left: 100,right: 100),
                        child: TextFormField(
                           validator: checkFieldEmpty,
                           controller: venueController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Venue',
                          ),
                        ),
                      ),
                      
                      Padding(
                         padding: EdgeInsets.only(top: 10, bottom: 10,left: 100,right: 100),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                           validator: checkFieldEmpty,
                           controller: descriptionController,
                           maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            
                            labelText: 'Description',
                            
                          ),
                        ),
                      ),
                        Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10,left: 100,right: 100),
                        child: TextFormField(
                           validator: checkFieldEmpty,
                           controller: signedByController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Signed by',
                          ),
                        ),
                      ),
    
                      SizedBox(height: 30,), 
    
                    
                      //  InkWell(
                      //   onTap: () {
                          
                      //   },
                      //    child: Container(
                      //         height: screenSize.width * 1 / 40,
                      //         width: screenSize.width * 1 / 8,
                      //         decoration: BoxDecoration(
                      //             color: Colors.blue,
                      //             borderRadius: BorderRadius.circular(14)),
                              
                      //           child: Center(child: const Text('Upload Events')),
                              
                      //       ),
                      //  ),
                      
                  
                 (widget.loadingStatus == false)? Container(
                            height: screenSize.width * 1 / 30,
                            width: screenSize.width * 1 / 5,
                            decoration: BoxDecoration(
                                color: adminePrimayColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(9.0),
                                textStyle: const TextStyle(fontSize: 17),
                              ),
                              onPressed: () async{
                                  if (_formKey.currentState!.validate()){
                                setState(() {
                                    widget.loadingStatus = true;
                                });
    
                                 modell = EventModel(eventName: headingController.text, eventDate: dateController.text,
                                 eventDescription: descriptionController.text, venue: venueController.text, signedBy: signedByController.text, id: headingController.text.substring(0,5).trim() + DateTime.now().microsecondsSinceEpoch.toString());
                              await addEvent(); 
                                setState(() {
                                    widget.loadingStatus = false;
                                }); 
                                
                                
                                // showToast(msg: 'New Event Added!');
    
                              // showDialog(context: context, builder: (context){
                              //     return AlertDialog(
                              //       title: Text('Events'),
                              //       content: Text('New Event Added!'),
                              //       actions: [
                              //         MaterialButton(
                              //           color: Colors.blue,
                              //           onPressed: (){
                                          
                              //           Navigator.pop(context);
                              //         }, child: Text('OK'),)
                              //       ],
                              //     );
                              //   });
    
                              }},
                              child: const Text('Upload Events'), 
    
                            ),
                          ) : Center(child: CircularProgressIndicator(),),
                      
                    ]),
                  ),
                ],
              ),
            ),
         
       ),
    ),
    );
}
}