import 'package:flutter/material.dart';

import '../../../../view/web/widgets/drop_DownList/schoolDropDownList.dart';

class HoverDropdown extends StatefulWidget {
  const HoverDropdown({super.key});

  @override
  _HoverDropdownState createState() => _HoverDropdownState();
}

class _HoverDropdownState extends State<HoverDropdown> {
  bool _isHovered = false;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap event
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Stack(
          children: [
            const Text(
              'Hover over me!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Visibility(
              visible: _isHovered,
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                 child:SingleChildScrollView(
                                              child: ListBody(
                                                children: const <Widget>[
                                                  GetSchoolListDropDownButton()
                                                ],
                                                
                                              ),
                                            ),
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}