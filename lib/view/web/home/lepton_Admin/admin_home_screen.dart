import 'package:dujo_kerala_website/view/web/home/lepton_Admin/requested_list/req_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/button_container_widget.dart';
import 'list_of_schools/list_of_schools_screen.dart';

class LeptonHomePage extends StatelessWidget {
  const LeptonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SchoolsListScreen();
                    },
                  ),
                );
                

              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 200,
                width: 400,
                child: Center(
                    child: Text(
                  'List of Schools',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RequestedSchoolsListScreen();
                    },
                  ),
                );
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 6,
                height: 200,
                width: 400,
                child: Center(
                    child: Text(
                  'Requested List',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
