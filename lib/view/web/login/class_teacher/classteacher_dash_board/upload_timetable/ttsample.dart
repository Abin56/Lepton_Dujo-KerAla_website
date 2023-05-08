import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/upload_timetable/timetable_add_screen.dart';
import 'package:flutter/material.dart';

class TTSample extends StatefulWidget {
  TTSample({super.key}); 

  @override
  State<TTSample> createState() => _TTSampleState();
}

class _TTSampleState extends State<TTSample> {
  String? _selectedItem;

  List<TextEditingController> controllersList = List.generate(8, (index) => TextEditingController());

  List<String> periodNames = [
    'First Period',
    'Second Period',
    'Third Period',
    'Fourth Period',
    'Fifth Period',
    'Sixth Period',
    'Seventh Period',
    'Eighth Period'
  ];  

  List<String> _items = [];

  TextEditingController periodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / 4,
            left: MediaQuery.of(context).size.width / 4),
        child: ListView(
          children: [
            DropdownButton(
      hint: Text('Select an item'),
      value: _selectedItem,
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        print('Selected item: $_selectedItem');
      },
      items: _items.map((item) {
        return DropdownMenuItem(
          child: new Text(item),
          value: item,
        );
      }).toList(),),
            SizedBox(
              height: 50,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 20,
                  );
                }),
                itemCount: 8,
                itemBuilder: ((context, index) {
                  return ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      // Note: Same code is applied for the TextFormField as well
                       TextField(
                        decoration: InputDecoration(
                          hintText: periodNames[index],
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Colors.greenAccent), //<-- SEE HERE
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      // Note: Same code is applied for the TextFormField as well
                       TextField(
                        decoration: InputDecoration(
                          hintText: _selectedItem,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Colors.greenAccent), //<-- SEE HERE
                          ),
                        ),
                      )
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }
}
