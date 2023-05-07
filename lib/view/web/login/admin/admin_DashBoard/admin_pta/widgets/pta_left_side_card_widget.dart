import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../model/admin_models/admin_pta_model/admin_pta_model.dart';
import '../../../../../../../utils/screen_size.dart';
import '../../../../../../colors/colors.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../widgets/Iconbackbutton.dart';
import 'admin_pta_card_widget.dart';

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget({
    super.key,
    required this.headMasterModel,
    required this.presidentModel,
    required this.vicePresidentModel,
    required this.chairPersonModel,
    required this.representativeModel,
  });

  final AdminPtaModel? headMasterModel;
  final AdminPtaModel? presidentModel;
  final AdminPtaModel? vicePresidentModel;
  final AdminPtaModel? chairPersonModel;
  final AdminPtaModel? representativeModel;

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
                "School PTA",
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
                        "PTA Executive Members",
                        style: GoogleFonts.oswald(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: cWhite,
                        ),
                      ),
                      sizedBoxH10,
                      PtaCardWidget(
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
                            child: PtaCardWidget(
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
                            child: PtaCardWidget(
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
                            child: PtaCardWidget(
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
                            child: PtaCardWidget(
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