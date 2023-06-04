import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../controller/Getx/admin/alumni_association_controller/alumni_association_controller.dart';
import '../../../../../../constant/constant.dart';
import 'alumni_association_dialogue_widget.dart';

class AlumniAssociationCardWidet extends StatelessWidget {
  AlumniAssociationCardWidet({
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

  final String imageUrl;
  final IconData iconData;
  final String memberId;
  final String imageId;
  AlumniController controller = Get.put(AlumniController());
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey)),
      child: SizedBox(
        width: 200,
        child: Column(
          children: <Widget>[
            sizedBoxH10,
            FittedBox(
              child: CircleAvatar(
                maxRadius: MediaQuery.of(context).size.width * .03,
                backgroundImage: imageUrl.isEmpty
                    ? const AssetImage('assets/images/user.png')
                    : NetworkImage(imageUrl) as ImageProvider,
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
                                  'Are you sure you want to remove this Notice'),
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

                        updateAlumniDialogue(
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
