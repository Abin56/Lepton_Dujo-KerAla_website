import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../model/alumni_association_model/alumni_association_model.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../widgets/Iconbackbutton.dart';
import 'alumni_association_card_widget.dart';

class AlumniAssociationLeftCardWidget extends StatelessWidget {
  const AlumniAssociationLeftCardWidget({
    super.key,
    required this.headMasterModel,
    required this.presidentModel,
    required this.vicePresidentModel,
    required this.chairPersonModel,
    required this.representativeModel,
  });

  final AlumniAssociationModel? headMasterModel;
  final AlumniAssociationModel? presidentModel;
  final AlumniAssociationModel? vicePresidentModel;
  final AlumniAssociationModel? chairPersonModel;
  final AlumniAssociationModel? representativeModel;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
                "Alumni Association",
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
                width: screenSize.width * 0.4,
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
                      AlumniAssociationCardWidet(
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
                            child: AlumniAssociationCardWidet(
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
                            child: AlumniAssociationCardWidet(
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
                            child: AlumniAssociationCardWidet(
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
                            child: AlumniAssociationCardWidet(
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
