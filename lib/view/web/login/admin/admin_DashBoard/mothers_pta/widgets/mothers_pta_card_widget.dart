import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../controller/Getx/admin/mothers_pta_controller/mothers_pta_controller.dart';
import '../../../../../../constant/constant.dart';
import 'mothers_pta_dialogue_widget.dart';

class MothersPtaCardWidget extends StatelessWidget {
  MothersPtaCardWidget({
    super.key,
    required this.name,
    required this.designation,
    required this.position,
    required this.imageUrl,
    required this.iconData,
    required this.memberId,
    required this.imageId,
  });

  final String name;
  final String designation;
  final String position;

  final String? imageUrl;
  final IconData iconData;
  final String memberId;
  final String imageId;
  final MothersPtaController controller = Get.find<MothersPtaController>();
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
                onBackgroundImageError: (exception, stackTrace) {
                  if (kDebugMode) {
                    print(exception);
                  }
                },
                maxRadius: MediaQuery.of(context).size.width * .03,
                backgroundImage: imageUrl == null || imageUrl!.isEmpty
                    ? const AssetImage('assets/images/user.png')
                    : NetworkImage(imageUrl!) as ImageProvider,
              ),
            ),
            FittedBox(
              child: Text(
                name,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                designation,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                position,
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
                                  onPressed: () async {
                                    await controller.removeMember(
                                        memberId, imageId);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Remove'),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        controller.nameController.text = name;
                        controller.positionController.text = position;
                        controller.designationController.text = designation;

                        updateMothersPtaDialogue(
                          context,
                          memberId,
                          imageId,
                          imageUrl,
                        );
                      }
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
