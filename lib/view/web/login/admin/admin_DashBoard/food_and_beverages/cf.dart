import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/icons/icons.dart';
import 'package:flutter/material.dart';

class Cf extends StatefulWidget {
  const Cf({super.key});

  @override
  State<Cf> createState() => _CfState();
}

class _CfState extends State<Cf> {
  List<String> items = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  String dropdownValue = 'Monday';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Food Menu'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: (screenSize.width / 3),
              left: screenSize.width / 3,
              top: screenSize.height / 10,
              bottom: screenSize.height / 10,
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              value: dropdownValue,
              items: items
                  .map((items) => DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      ))
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.pink,
                    ),
                    TextFormField(
                      style: ralewayStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blueDarkColor,
                        fontSize: 12.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppIcons.emailIcon),
                        ),
                        contentPadding: const EdgeInsets.only(top: 16.0),
                        hintText: 'Enter your ID',
                        hintStyle: ralewayStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.blueDarkColor.withOpacity(0.5),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
