import 'package:flutter/material.dart';

class TTSample extends StatefulWidget {
  const TTSample({super.key}); 

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

  final List<String> days = [
    'Monday', 
    'Tuesday', 
    'Wednesday', 
    'Thursday', 
    'Friday'
  ];

  TextEditingController periodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / 4,
            left: MediaQuery.of(context).size.width / 4),
        child: ListView(
          children: [
            DropdownButton(
      hint: const Text('Select an item'),
      value: _selectedItem,
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        print('Selected item: $_selectedItem');
      },
      items: days.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item), 
        );
      }).toList(),),
            const SizedBox(
              height: 50,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                }),
                itemCount: 8,
                itemBuilder: ((context, index) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      // Note: Same code is applied for the TextFormField as well
                       TextField(
                        decoration: InputDecoration(
                          hintText: periodNames[index],
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black), //<-- SEE HERE
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      // Note: Same code is applied for the TextFormField as well
                       TextField(
                        decoration: InputDecoration(
                          hintText: _selectedItem,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black), //<-- SEE HERE
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
