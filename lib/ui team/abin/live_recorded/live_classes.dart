import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../view/colors/colors.dart';
import '../../../view/constant/constant.dart';
import '../../../view/fonts/fonts.dart';
import '../../../view/web/widgets/live_container.dart';


class LiveClasses extends StatefulWidget {
  const LiveClasses({super.key});

  @override
  State<LiveClasses> createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses> {
  TextEditingController dateinput = TextEditingController();
  
  @override
  void initState() {
    dateinput.text = ""; 
    super.initState();
  }
  bool isContainer1Visible = true;
  bool isContainer2Visible = false;

  @override
  Widget build(BuildContext context) {
       final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor:  adminePrimayColor,title: Text('Live Class'),),
      body:  SingleChildScrollView(
        child: Column(
            children:[
               Container(
                 child: Row(
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
                                  'Welcome',
                                  style: GoogleFonts.aclonica(
                                    fontSize: 25.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),                            
                                SizedBox(
                                  height: size.width/3.5,
                                  width:size.width/1,
                                  child: LottieBuilder.network(
                                      "https://assets2.lottiefiles.com/packages/lf20_3o3wutcj.json"),
                                )                        
                              ],
                            ),
                    ),                            
                        Padding(
                            padding:  EdgeInsets.only(left: size.width/8),
                            child: Container(
                              height: size.height * 1 /1 ,
                               width: size.width * 1 / 3,
                              child: SingleChildScrollView(
                                 child: Column(                                    
                                          children: [
                                 Positioned(
                                   top: 50,
                                   left: 50,                                   
                                    child: 
                                   GestureDetector(
                                     onTap: () {
                                       setState(() {
                                         isContainer1Visible = false;
                                         isContainer2Visible = true;
                                       });
                                     },
                                     child: AnimatedOpacity(
                                       opacity: isContainer1Visible ? 1.0 : 1.0,
                                       duration: Duration(milliseconds: 500),
                                       child: Container(
                                        margin: EdgeInsets.only(top: size.width/30),
                                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(colors: [
                                 Colors.cyanAccent,Colors.cyan
                                        ])),
                                        child: Center(
                                 child: Text(' As per the TimeTable  ',style:GoogleFonts.acme(fontSize: 20.0,
                                 color: Color.fromARGB(255, 0, 0, 0), 
                                 fontWeight: FontWeight.w800,),),
                                        ),
                                         width: 200,
                                         height: 100,                                        
                                       ),
                                     ),                                  
                                   ),
                                 ),
                                 Positioned(
                                   top: 150,
                                   left: 150,
                                   child: GestureDetector(
                                     onTap: () {
                                       setState(() {
                                         isContainer2Visible = false;                                       
                                       });
                                     },
                                     child: AnimatedOpacity(
                                       opacity: isContainer2Visible ? 1.0 : 0.0,
                                       duration: Duration(milliseconds: 10),
                                       child: Container(                                    
                                         width: 600,
                                         height: 200,
                                         color: Colors.green,
                                       ),
                                     ),
                                   ),
                                 ),
                                 sizedBoxH40,         
                                     Container(
                                       height: size.width/2.5,
                                    decoration: BoxDecoration(                                   
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(colors: 
                                      [Color.fromARGB(255, 168, 219, 207),Color.fromARGB(255, 228, 235, 236)]
                                      )),
                                      child: Column( 
                                        children: [
                                        Container(
                                          margin: EdgeInsets.only(top: size.width/25),
                                          child: Text('Scheduled Class', style: GoogleFonts.aclonica(fontSize: 20,
                                              color: Color.fromARGB(255, 10, 10, 10),
                                             fontWeight: FontWeight.w800,
                                            ),),
                                        ),                                           
                                         Padding(
                                              padding: EdgeInsets.only(top: size.width/35,                                             
                                              left: size.width/22,right: size.width/22),
                                              child: TextField(
                                                            controller: dateinput, 
                                                            decoration: InputDecoration( 
                                                              border: OutlineInputBorder(),
                                                               icon: Icon(Icons.calendar_today), 
                                                               labelText: "Enter Date" 
                                                            ),
                                                            readOnly: true,  
                                                            onTap: () async {
                                                              DateTime? pickedDate = await showDatePicker(
                                                                  context: context, initialDate: DateTime.now(),
                                                                  firstDate: DateTime(2000), 
                                                                  lastDate: DateTime(2101)
                                                              );                                                              
                                                              if(pickedDate != null ){
                                                                  print(pickedDate);  
                                                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                                                                  print(formattedDate); 
                                                                  setState(() {
                                                                     dateinput.text = formattedDate; //set output date to TextField value. 
                                                                  });
                                                              }else{
                                                                  print("Date is not selected");
                                                              }
                                                            },
                                                         ),),
                                      Padding(padding:  EdgeInsets.only(top: size.width/40,                                   
                                      left: size.width/22,right: size.width/22),
                                     child:  TextFieldlive(text: 'Time', icon: Icon (Icons.timer))),
                                         Padding( padding: EdgeInsets.only(top: size.width/40,                                      
                                         left: size.width/22,right: size.width/22),
                                        child: TextFieldlive(text: 'Teacher', icon: Icon (Icons.school_outlined),),
                                      ), 
                                      Padding( padding: EdgeInsets.only(top: size.width/40,                                     
                                         left: size.width/22,right: size.width/22),
                                        child: TextFieldlive(text: 'Subject', icon:Icon (Icons.subject_sharp),),
                                      ),
                                       Padding( padding: EdgeInsets.only(top: size.width/40,                                      
                                        left: size.width/22,right: size.width/22),
                                        child: Livecontainer(
                                          onTap: () {},
                                         text: 'Activate Class',),
                                      ),
                                      ]),
                                  )
                                   ]),
                               ),
                               )
                           ),    
                   ]),
               ),
                 ],),
      ),  
    );
  }
}
class TextFieldlive extends StatelessWidget {
  const TextFieldlive({
    super.key, required this.text, required this.icon,
  });
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                           icon: icon, 
                          labelText: text,
                        ),
              );
  }
}
