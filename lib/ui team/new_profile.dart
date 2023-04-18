
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({super.key});

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('New Profile'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50, top: 50,),
          child: Column(children: [          
            Container(
              height: screenSize.height/3,
              width: screenSize.width/2,
              color: Color.fromARGB(255, 78, 221, 226),
              child: Padding(
              padding: const EdgeInsets.only(right:200, ),
              child: Container(
                 height: screenSize.height/4,
              width: screenSize.width/6,
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent[400],
                  radius: screenSize.height/10,
                  child: Text(
                    'image',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ), //Text
                ),
              ),
            ), 
            ),
           

          ],
        
          ),
        ),
      ),      
    );
  }
}