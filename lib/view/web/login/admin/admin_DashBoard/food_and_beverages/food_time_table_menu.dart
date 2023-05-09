import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class FoodTimeTableMenu extends StatefulWidget {
  const FoodTimeTableMenu({super.key});

  @override
  State<FoodTimeTableMenu> createState() => _FoodTimeTableMenuState();
}

class _FoodTimeTableMenuState extends State<FoodTimeTableMenu> { 
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('FOOD TIME TABLE'),backgroundColor: adminePrimayColor,),
      body:StreamBuilder( 
        stream:  FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.data!.docs.isEmpty){
            return Center(child: Text('No Data Found', style: GoogleFonts.poppins(fontWeight:FontWeight.w500),));
          } 
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return SingleChildScrollView(child:
                  Column(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: screenSize.width/9,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Container(
                              height: screenSize.width/6,
                             width: screenSize.width/7.3,
                              decoration: BoxDecoration(color: const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "DAYS",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: screenSize.width/6,
                               width: screenSize.width/7.3,
                               decoration: BoxDecoration(color: const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "MONDAY",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: screenSize.width/6,
                               width: screenSize.width/7.3,
                              decoration: BoxDecoration(color:const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "TUESDAY",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: screenSize.width/6,
                               width: screenSize.width/7.3,
                             decoration: BoxDecoration(color:const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "WEDNESDAY",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: screenSize.width/6,
                              width: screenSize.width/7.3,
                               decoration: BoxDecoration(color: const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "THURSDAY",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: screenSize.width/6,
                              width: screenSize.width/7.3,
                              decoration: BoxDecoration(color:const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "FRIDAY",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: screenSize.width/6,
                               width: screenSize.width/7.5,
                                decoration: BoxDecoration(color:const Color.fromARGB(255, 120, 119, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                    "SATURDAY",
                                                    style: TextStyle(
                                                        color: cBlack,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                            ),
                          ],
              ),
                      ),
                      Row(
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.only(left: 8),
                              children: <Widget>[
                                Container(
                                  height: screenSize.width/10,
                                  width: screenSize.width/15,
                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 194, 143, 209),
                                  borderRadius: BorderRadius.circular(15)),
                                  child: const Center(child: Text(
                                                    "BREAKFAST\n8AM-11AM",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                                ),
                                const SizedBox(height: 4,),
                                Container(
                                  height: screenSize.width/10,
                                  width: screenSize.width/15,
                                   decoration: BoxDecoration(color: const Color.fromARGB(255, 194, 143, 209),
                                  borderRadius: BorderRadius.circular(15)),
                                  child: const Center(child: Text(
                                                    "LUNCH\n12PM-3PM",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                                ),
                                const SizedBox(height: 4,),
                                Container(
                                  height: screenSize.width/10,
                                  width: screenSize.width/15,
                                 decoration: BoxDecoration(color: const Color.fromARGB(255, 194, 143, 209),
                                  borderRadius: BorderRadius.circular(15)),
                                  child: const Center(child: Text(
                                                    "SNACKS\n8AM-5PM",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:20,
                                                        fontWeight: FontWeight.bold),
                                                  ),),
                                ),
                               
                              ],
                            ),
                          ),
                          
                          SizedBox(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: StreamBuilder(
                              stream:  FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc('Monday').snapshots(),
                              builder: (context, snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),);
                                } 
                            
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(left: 8,),
                                  children: <Widget>[
                                   
                                    Container(
                                    height: screenSize.width/10,
                                      width: screenSize.width/15,
                                     decoration: BoxDecoration(color: const Color.fromARGB(255, 131, 236, 184),
                                      borderRadius: BorderRadius.circular(15)),
                                    child: ItemWidget(snap: snapshot, time: 'Breakfast',day: 'Monday', otherTime1 : 'Lunch', otherTime2: 'Snacks'),
                                    
                                    ),
                                    const SizedBox(height: 4,),
                                                 
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 131, 236, 184),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Lunch',day: 'Monday', otherTime1 : 'Breakfast', otherTime2: 'Snacks'),
                                      // child: const Center(child: SelectSubjectDropDownButton()),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                     decoration: BoxDecoration(color: const Color.fromARGB(255, 131, 236, 184),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Snacks',day: 'Monday', otherTime1 : 'Lunch', otherTime2: 'Breakfast'),
                                    ),
                                   
                                                   
                            
                                  ],
                                );
                              }
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc('Tuesday').snapshots(),
                              builder: (context, snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                                
                                if(snapshot.data!.data()!.isEmpty){
                                  return Center(
                                    child: Container(
                                      child: const Text('No Item Added'),
                                    ),
                                  );}
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(left: 8),
                                  children: <Widget>[
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 102, 222),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Breakfast',day: 'Tuesday', otherTime1 : 'Lunch', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 102, 222),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Lunch',day: 'Tuesday', otherTime1 : 'Breakfast', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 102, 222),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Snacks',day: 'Tuesday', otherTime1 : 'Lunch', otherTime2: 'Breakfast'),
                                    ),
                                   

                                  ],
                                );
                              }
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc('Wednesday').snapshots(),
                              builder: (context, snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                                 if(snapshot.data!.data()!.isEmpty){
                                  return Center(
                                    child: Container(
                                      child: const Text('No Item Added'),
                                    ),
                                  );}
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(left: 8),
                                  children: <Widget>[
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                     decoration: BoxDecoration(color: const Color.fromARGB(255, 236, 238, 148),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Breakfast',day: 'Wednesday', otherTime1 : 'Lunch', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 236, 238, 148),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Lunch',day: 'Wednesday', otherTime1 : 'Breakfast', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 236, 238, 148),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Snacks',day: 'Wednesday', otherTime1 : 'Lunch', otherTime2: 'Breakfast'),
                                    ),
                                    

                                  ],
                                );
                              }
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc('Thursday').snapshots(),
                              builder: (context, snapshot) {
                                if(snapshot.connectionState ==ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),);
                                }

                                 if(snapshot.data!.data()!.isEmpty){
                                  return Center(
                                    child: Container(
                                      child: const Text('No Item Added'),
                                    ),
                                  );}
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(left: 8),
                                  children: <Widget>[
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 253, 146, 173),
                                      borderRadius: BorderRadius.circular(15)),
                                      child:  ItemWidget(snap: snapshot, time: 'Breakfast',day: 'Thursday',  otherTime1 : 'Lunch', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 253, 146, 173),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Lunch',day: 'Thursday',  otherTime1 : 'Breakfast', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 253, 146, 173),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Snacks',day: 'Thursday',  otherTime1 : 'Lunch', otherTime2: 'Breakfast'),
                                    ),
                                   

                                  ],
                                );
                              }
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: StreamBuilder( 
                              stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc('Friday').snapshots(),
                              builder: (context, snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                                 if(snapshot.data!.data()!.isEmpty){
                                  return Center(
                                    child: Container(
                                      child: const Text('No Item Added'),
                                    ),
                                  );}
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(left: 8),
                                  children: <Widget>[
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 255, 221),
                                      borderRadius: BorderRadius.circular(15)),
                                      child: ItemWidget(snap: snapshot, time: 'Breakfast',day: 'Friday',  otherTime1 : 'Lunch', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 255, 221),
                                      borderRadius: BorderRadius.circular(15)),
                                      child:ItemWidget(snap: snapshot, time: 'Lunch',day: 'Friday',  otherTime1 : 'Breakfast', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 255, 221),
                                      borderRadius: BorderRadius.circular(15)),
                                      child:  ItemWidget(snap: snapshot, time: 'Snacks',day: 'Friday',  otherTime1 : 'Lunch', otherTime2: 'Breakfast'),
                                    ),
                                   

                                  ],
                                );
                              }
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: screenSize.width/7,
                            height: screenSize.height,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc('Saturday').snapshots(),
                              builder: (context, snapshot) {
                               
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                                
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  children: <Widget>[
                                    Container(
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 235, 190, 200),
                                      borderRadius: BorderRadius.circular(15)),
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                     //color: Color.fromARGB(255, 0, 255, 221),
                                      child: ItemWidget(snap: snapshot, time: 'Breakfast',day: 'Saturday',  otherTime1 : 'Lunch', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 235, 190, 200),
                                      borderRadius: BorderRadius.circular(15)),
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                       
                                      child: ItemWidget(snap: snapshot, time: 'Lunch',day: 'Saturday',  otherTime1 : 'Breakfast', otherTime2: 'Snacks'),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                       decoration: BoxDecoration(color: const Color.fromARGB(255, 235, 190, 200),
                                      borderRadius: BorderRadius.circular(15)),
                                      height: screenSize.width/10,
                                      width: screenSize.width/15,
                                     // color: Color.fromARGB(255, 0, 255, 221),
                                      child: ItemWidget(snap: snapshot, time: 'Snacks',day: 'Saturday',  otherTime1 : 'Lunch', otherTime2: 'Breakfast'),
                                    ),
                                   
                                  ],
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
  );
        }
      )
);
}
}

class ItemWidget extends StatelessWidget {
   ItemWidget({
    super.key, required this.snap, 
    required this.time, 
    required this.day,required this.otherTime1, required this.otherTime2
  }); 

  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snap; 
  String time;
  String day; 
  String otherTime1; 
  String otherTime2;

  TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child:Text(
                          snap.data!.data()!['item1'][time],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize:15,
                              fontWeight: FontWeight.bold),
                        ),), IconButton(onPressed: (){
                          showDialog(context: context, builder: (context){
                            return  AlertDialog(
                              title: const Text('Edit Item'), 
                              content: TextFormField(
                                controller: editController,
                                decoration: InputDecoration(
                                  hintText: snap.data!.data()!['item1'][time]
                                ),
                              ),
                              actions: [
                                Row(
                                  children: [
                                    MaterialButton(onPressed: ()async{
                                        await FirebaseFirestore.instance.collection('SchoolListCollection').doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection('FoodAndBeverages').doc(day).update({
                                          'item1': {
                                            time: editController.text, 
                                            otherTime1: snap.data!.data()!['item1'][otherTime1], 
                                            otherTime2: snap.data!.data()!['item1'][otherTime2], 
                                          }
                                        }); 
                                         Navigator.pop(context);
                                    }, child: const Text('Edit'),), 
                                    sizedBoxW20, 
                                    MaterialButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: const Text('Cancel'),)
                                  ],
                                )
                              ],
                            );
                          });
                        }, icon: const Icon(Icons.edit))
      ],
    );
  }
}