import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../model/admin_models/student_protection_model/student_protection_model.dart';
import '../../../../../../../utils/screen_size.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../widgets/Iconbackbutton.dart';
import 'student_protection_card_widget.dart';

class StudentProtectionLeftCardWidget extends StatelessWidget {
  const StudentProtectionLeftCardWidget({
    super.key,
    required this.headMasterModel,
    required this.presidentModel,
    required this.vicePresidentModel,
    required this.chairPersonModel,
    required this.representativeModel,
  });

  final StudentProtectionGroupModel? headMasterModel;
  final StudentProtectionGroupModel? presidentModel;
  final StudentProtectionGroupModel? vicePresidentModel;
  final StudentProtectionGroupModel? chairPersonModel;
  final StudentProtectionGroupModel? representativeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: adminePrimayColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButtonBackWidget(
                color: cWhite,
              ),
              Text(
                "Student Protection Group",
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: cWhite,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: ScreenSize.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Executive Members",
                        style: GoogleFonts.oswald(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: cWhite,
                        ),
                      ),
                      sizedBoxH10,
                      StudentProtectionCardWidet(
                          designation:
                              headMasterModel?.designation ?? "Headmaster",
                          iconData: Icons.edit,
                          imageId: headMasterModel?.imageId ?? "",
                          imageUrl: headMasterModel?.imageUrl ?? "",
                          memberId: headMasterModel?.id ?? "headMaster",
                          name: headMasterModel?.name ?? "Name",
                          position: headMasterModel?.position ?? "Position"),
                      sizedBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: StudentProtectionCardWidet(
                                designation:
                                    presidentModel?.designation ?? "President",
                                iconData: Icons.edit,
                                imageId: presidentModel?.imageId ?? "",
                                imageUrl: presidentModel?.imageUrl ?? "",
                                memberId: presidentModel?.id ?? "president",
                                name: presidentModel?.name ?? "Name",
                                position:
                                    presidentModel?.position ?? "Position"),
                          ),
                          Flexible(
                            child: StudentProtectionCardWidet(
                                designation: vicePresidentModel?.designation ??
                                    "Vice President",
                                iconData: Icons.edit,
                                imageId: vicePresidentModel?.imageId ?? "",
                                imageUrl: vicePresidentModel?.imageUrl ?? "",
                                memberId:
                                    vicePresidentModel?.id ?? "vicePresident",
                                name: vicePresidentModel?.name ?? "Name",
                                position:
                                    vicePresidentModel?.position ?? "Position"),
                          ),
                        ],
                      ),
                      sizedBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: StudentProtectionCardWidet(
                                designation: chairPersonModel?.designation ??
                                    "ChairPerson",
                                iconData: Icons.edit,
                                imageId: chairPersonModel?.imageId ?? "",
                                imageUrl: chairPersonModel?.imageUrl ?? "",
                                memberId: chairPersonModel?.id ?? "chairPerson",
                                name: chairPersonModel?.name ?? "Name",
                                position:
                                    chairPersonModel?.position ?? "Position"),
                          ),
                          Flexible(
                            child: StudentProtectionCardWidet(
                                designation: representativeModel?.designation ??
                                    "Representative",
                                iconData: Icons.edit,
                                imageId: representativeModel?.imageId ?? "",
                                imageUrl: representativeModel?.imageUrl ?? "",
                                memberId:
                                    representativeModel?.id ?? "representative",
                                name: representativeModel?.name ?? "Name",
                                position: representativeModel?.position ??
                                    "Position"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
