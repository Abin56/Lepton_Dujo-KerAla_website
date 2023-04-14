import 'package:flutter/material.dart';


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
      appBar: AppBar(title: Text('FOOD TIME TABLE')),
      body:SingleChildScrollView(child:
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
                          decoration: BoxDecoration(color: Color.fromARGB(255, 194, 143, 209),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "DAYS",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: screenSize.width/6,
                           width: screenSize.width/7.3,
                           decoration: BoxDecoration(color: Color.fromARGB(255, 131, 236, 184),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "MONDAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: screenSize.width/6,
                           width: screenSize.width/7.3,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 102, 222),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "TUESDAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: screenSize.width/6,
                           width: screenSize.width/7.3,
                         decoration: BoxDecoration(color: Color.fromARGB(255, 236, 238, 148),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "WEDNESDAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: screenSize.width/6,
                          width: screenSize.width/7.3,
                           decoration: BoxDecoration(color: Color.fromARGB(255, 253, 146, 173),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "THURSDAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: screenSize.width/6,
                          width: screenSize.width/7.3,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 221),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "FRIDAY",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: screenSize.width/6,
                           width: screenSize.width/7.5,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 235, 190, 200),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(child: Text(
                                                "SATURDAY",
                                                style: TextStyle(
                                                    color: Colors.white,
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
                                decoration: BoxDecoration(color: Color.fromARGB(255, 194, 143, 209),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "BREAKFAST\n8AM-11AM",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               decoration: BoxDecoration(color: Color.fromARGB(255, 194, 143, 209),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "LUNCH\n12PM-3PM",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:20,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                             decoration: BoxDecoration(color: Color.fromARGB(255, 194, 143, 209),
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
                      
                      Container(
                        width: screenSize.width/7,
                        height: screenSize.height,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(left: 8,),
                          children: <Widget>[
                           
                            Container(
                             
                              child: const Center(child: Text(
                                                "Dosa\nIdly\nVada",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                             decoration: BoxDecoration(color: Color.fromARGB(255, 131, 236, 184),
                              borderRadius: BorderRadius.circular(15)),
                            
                            ),
                            SizedBox(height: 4,),
                     
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               decoration: BoxDecoration(color: Color.fromARGB(255, 131, 236, 184),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                               "Meals",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                              // child: const Center(child: SelectSubjectDropDownButton()),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                             decoration: BoxDecoration(color: Color.fromARGB(255, 131, 236, 184),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Tea\nCoffee\nJuices",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                           
                       

                          ],
                        ),
                      ),
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
                              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 102, 222),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Dosa\nIdly\nVada",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               decoration: BoxDecoration(color: Color.fromARGB(255, 255, 102, 222),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                               "Meals",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               decoration: BoxDecoration(color: Color.fromARGB(255, 255, 102, 222),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Tea\nCoffee\nJuices",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                           

                          ],
                        ),
                      ),
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
                             decoration: BoxDecoration(color: Color.fromARGB(255, 236, 238, 148),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Dosa\nIdly\nVada",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               decoration: BoxDecoration(color: Color.fromARGB(255, 236, 238, 148),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                               "Meals",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               decoration: BoxDecoration(color: Color.fromARGB(255, 236, 238, 148),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                               "Tea\nCoffee\nJuices",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            

                          ],
                        ),
                      ),
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
                               decoration: BoxDecoration(color: Color.fromARGB(255, 253, 146, 173),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                               "Dosa\nIdly\nVada",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                              decoration: BoxDecoration(color: Color.fromARGB(255, 253, 146, 173),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Meals",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                              decoration: BoxDecoration(color: Color.fromARGB(255, 253, 146, 173),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Tea\nCoffee\nJuices",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                           

                          ],
                        ),
                      ),
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
                              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 221),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Dosa\nIdly\nVada",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 221),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                               "Meals",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 221),
                              borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text(
                                                "Tea\nCoffee\nJuices",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                           

                          ],
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: screenSize.width/7,
                        height: screenSize.height,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          children: <Widget>[
                            Container(
                               decoration: BoxDecoration(color: Color.fromARGB(255, 235, 190, 200),
                              borderRadius: BorderRadius.circular(15)),
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                             //color: Color.fromARGB(255, 0, 255, 221),
                              child: const Center(child: Text(
                                               "Dosa\nIdly\nVada",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              decoration: BoxDecoration(color: Color.fromARGB(255, 235, 190, 200),
                              borderRadius: BorderRadius.circular(15)),
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                               
                              child: const Center(child: Text(
                                                "Meals",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                            SizedBox(height: 4,),
                            Container(
                               decoration: BoxDecoration(color: Color.fromARGB(255, 235, 190, 200),
                              borderRadius: BorderRadius.circular(15)),
                              height: screenSize.width/10,
                              width: screenSize.width/15,
                             // color: Color.fromARGB(255, 0, 255, 221),
                              child: const Center(child: Text(
                                               "Tea\nCoffee\nJuices",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:15,
                                                    fontWeight: FontWeight.bold),
                                              ),),
                            ),
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
  )
);
}
}