import 'package:dujo_kerala_website/controller/Getx/admin/pta/pta_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constant/constant.dart';
import 'admin_pta_dialogue_widget.dart';

class PtaCardWidget extends StatelessWidget {
  PtaCardWidget({
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
  PtaController controller = Get.find<PtaController>();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 200,
        child: Column(
          children: <Widget>[
            sizedBoxH10,
            FittedBox(
              child: CircleAvatar(
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
                                  'Are you sure you want to delete this member?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await controller.removePtaMember(
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

                        updateAdminPtaDialogue(
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
