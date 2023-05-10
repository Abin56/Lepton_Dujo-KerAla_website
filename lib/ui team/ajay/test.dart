import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/class_list/class_list_model.dart';

class ManageTeachers1 extends StatelessWidget {
  ManageTeachers1({
    super.key,
    this.iconData,
  });
  final IconData? iconData;

  final getxController = Get.put(ClassProfileList());

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      child: SizedBox(
        width: 200,
        child: Column(
          children: <Widget>[
            sizedBoxH10,
            FittedBox(
              child: CircleAvatar(
                  onBackgroundImageError: (exception, stackTrace) {},
                  maxRadius: MediaQuery.of(context).size.width * .03,
                  backgroundImage: const AssetImage('assets/images/user.png')
                  //: NetworkImage('') as ImageProvider,
                  ),
            ),
            FittedBox(
              child: Text(
                '',
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                'designation',
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                'position',
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                FittedBox(
                  child: IconButton(
                    onPressed: () {
                      if (iconData == Icons.delete) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Remove'),
                              content: const Text(
                                  'Are you sure you want to remove This'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {},
                                  child: const Text('Remove'),
                                )
                              ],
                            );
                          },
                        );
                      } else {}
                    },
                    icon: Icon(
                      iconData,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
