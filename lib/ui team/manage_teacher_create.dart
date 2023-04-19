
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:multiselect/multiselect.dart';
import 'package:profile/profile.dart';

class AddTeachersSubjects extends StatefulWidget {
  const AddTeachersSubjects({super.key});

 

  @override
  State<AddTeachersSubjects> createState() => _AddTeachersSubjectsState();
}


class _AddTeachersSubjectsState extends State<AddTeachersSubjects> {
   List<String> fruits = ['MALAYALAM', 'MATHS', 'ENGLISH', 'SCIENCE', 'HINDI'];
  List<String> selectedFruits = [];
  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    var _file;
    var studentNameController;
    return Scaffold(
      appBar: AppBar(title: Text('ADD TEACHERS SUBJECTS'),
       leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               icon:Icon(Icons.arrow_back_ios), 
               //replace with our own icon data.
            )),
      body: SingleChildScrollView(
       
          child: Row(children: [  
             Container(
                height: screenSize.height * 1.1,
                width: screenSize.width * 1 / 2,
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
                    SizedBox(height: screenSize.height/15,),
                     Text(
                      'ADD SUBJECTS\nTO TEACHERS',
                      style: ralewayStyle.copyWith(
                        fontSize: 25.0,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: screenSize.height /10,),
                    SizedBox(
                      height: screenSize.height / 2,
                      width: screenSize.width / 3,
                      child: LottieBuilder.network(
                          'https://assets10.lottiefiles.com/packages/lf20_7htpyk2w.json'),
                    )
                  ],
                ),
                color: adminePrimayColor), 


                Container(
                 height: screenSize.height * 1.1,
                width: screenSize.width * 1 / 2,
                
                child:Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width / 30),
                      child:(_file == null)? CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Color.fromARGB(241, 54, 225, 248),
                      ): CircleAvatar(
                        radius: 100,
                        backgroundImage: MemoryImage(_file!)
                            
                      ) ,
                    ),
                       Padding(
                  padding:
                      EdgeInsets.only(top: screenSize.height/40, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
                  child: TextField(                  
                    controller: studentNameController,
                    decoration: InputDecoration(                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),                    
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                      // icon: new Icon(Icons.person),
                    ),
                  ),
                ),
                 Padding(
                  padding:
                      EdgeInsets.only(top: screenSize.height/40, left:screenSize.width/10, right: screenSize.width/10, bottom: screenSize.height/40),
                  child: TextField(
                  
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      labelText: 'Employee ID',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                ),
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10, top: screenSize.height/40),
                      child: DropDownMultiSelect(
                                  options: fruits,
                                  selectedValues: selectedFruits,
                                  onChanged: (value) {
                                    print('selected Subjects $value');
                                    setState(() {
                                      selectedFruits = value;
                                    });
                                    print('You have selected $selectedFruits Subjects.');
                                  },
                                  whenEmpty: 'Select your Subjects',
                                ),
                    ),
                     Padding(
                       padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10, top: screenSize.height/30),
                      child: TextButton(
                        
                                            child: const Text('CREATE',style: TextStyle(fontSize: 25),),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                     ),


                  ],
                )

                ),
          ],
        
          ),
        
      ),      
    );
  }
}