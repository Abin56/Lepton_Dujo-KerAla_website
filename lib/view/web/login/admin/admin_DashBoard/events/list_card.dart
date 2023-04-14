import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItemCard extends StatelessWidget {
   ListItemCard({super.key,required this.title, required this.content, required this.tapFun, required this.tapFun2}); 

  String title; 
  String content;
  Function tapFun;
  Function tapFun2;

  @override
  Widget build(BuildContext context) {
    return Container( 
     // height: 200,
      child: Card(
                            elevation: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Text(title, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),), 
    
                                   SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    content, maxLines: 10,
                                    style: GoogleFonts.poppins(),
                                  ), 
                                  
                                ],
                              ),), 
                              Row(
                                children: [
                                  MaterialButton(onPressed: ()=> tapFun(),
                            
                                   child: Text('Edit', style: GoogleFonts.poppins(color: Colors.white),), color: Colors.blue,), SizedBox(width: 20,), 
                                  MaterialButton(onPressed: ()=> tapFun2(), child: Text('Delete',style: GoogleFonts.poppins(color: Colors.white),), color: Colors.red,), 
                                ],
                              )
                                ],
                              )
                            )),
    );
  }
}