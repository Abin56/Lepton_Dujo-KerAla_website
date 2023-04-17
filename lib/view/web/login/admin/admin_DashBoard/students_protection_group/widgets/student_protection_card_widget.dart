import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../controller/Getx/admin/student_protection_controller/student_protection_controller.dart';
import '../../../../../../../model/admin_models/student_protection_model/student_protection_model.dart';
import '../../../../../../constant/constant.dart';
import 'student_protection_dialogue_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.imageUrl,
    required this.iconData,
    required this.memberid,
    required this.imageId,
  });

  final String firstName;
  final String secondName;
  final String thirdName;

  final String? imageUrl;
  final IconData iconData;
  final String memberid;
  final String imageId;

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
                firstName,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                secondName,
                style: GoogleFonts.almendra(fontSize: 18),
              ),
            ),
            sizedBoxH10,
            FittedBox(
              child: Text(
                thirdName,
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
                                    await Get.find<
                                            StudentProtectionController>()
                                        .removeMember(memberid, imageId);
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
                        final StudentProtectionController
                            studentProtectionController =
                            Get.find<StudentProtectionController>();

                        studentProtectionController.nameController.text =
                            firstName;
                        studentProtectionController.positionController.text =
                            secondName;
                        studentProtectionController.designationController.text =
                            thirdName;
                        showDialogueStudentProtection(context, 'Edit', () {
                          Get.find<StudentProtectionController>()
                              .updateStudentProtectionMemberDetail(
                                  memberid,
                                  StudentProtectionGroupModel(
                                    name: studentProtectionController
                                        .nameController.text,
                                    position: studentProtectionController
                                        .nameController.text,
                                    designation: studentProtectionController
                                        .nameController.text,
                                    id: memberid,
                                    imageUrl: studentProtectionController
                                            .imageData["imageUrl"] ??
                                        imageUrl ??
                                        "",
                                    imageId: imageId,
                                  ),
                                  context);
                        }, memberid, imageId, imageUrl ?? "");
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
