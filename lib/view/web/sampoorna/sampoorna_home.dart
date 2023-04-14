import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import 'widgets/address_detail_widget.dart';
import 'widgets/admission_detail_widget.dart';
import 'widgets/club_widget.dart';
import 'widgets/const.dart';
import 'widgets/current_detail_widget.dart';
import 'widgets/parent_details_widget.dart';
import 'widgets/personal_detail_widget.dart';
import 'widgets/school_previously_attended_widger.dart';
import 'widgets/widgets.dart';

class SampoornaHomeScreen extends StatelessWidget {
  SampoornaHomeScreen({super.key, required this.schoolId});
  final SampoornaController sampoornaController =
      Get.put(SampoornaController());
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Obx(
                () => sampoornaController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //title
                          TitleWidget(size: size),
                          kHeight30,
                          TextFormFieldTextWidget(
                            title: 'School Code',
                            controller:
                                sampoornaController.schoolCodecontroller,
                          ),
                          kHeight20,
                          //std admission number
                          const StdAdmissionWidget(),
                          kHeight30,
                          //Personal Detail
                          const ContentTitleWidget(
                            title: '1. Personal Details :',
                          ),
                          kHeight20,
                          const PersonalDetailWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '2. Parent Details :',
                          ),
                          kHeight20,
                          const ParentDetailsWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '3. Address Details :',
                          ),
                          const AddressDetailWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '4. Previous Details :',
                          ),
                          kHeight20,
                          const SchoolPreviouslyAttendedWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '5. Admission Details :',
                          ),
                          const AdmissionDetailWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '6. Class of Admission :',
                          ),
                          kHeight20,
                          const ClassOfAdmissionWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '7. Previous Class Details :',
                          ),
                          kHeight20,
                          const PreviuosClassAndDivisionWidget(),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '8. Current Details :',
                          ),
                          CurrentDetailWidget(),
                          kHeight50,

                          VaccinationDetailWidget(size: size),
                          kHeight50,
                          const ContentTitleWidget(
                            title:
                                '10. Two Identifiaction Marks (In English Only) :',
                          ),
                          kHeight20,
                          TextFormFieldTextWidget(
                              title: 'Identification Mark 1',
                              controller: sampoornaController
                                  .identificationMark1Controller),
                          kHeight20,
                          TextFormFieldTextWidget(
                            title: 'Identification Mark 2',
                            controller: sampoornaController
                                .identificationMark2Controller,
                          ),
                          kHeight50,
                          MemberShipWidget(
                            size: size,
                          ),
                          kHeight50,
                          TeachersOpinionWidget(
                            size: size,
                          ),
                          kHeight50,
                          const ContentTitleWidget(
                            title: '13. Clubs :',
                          ),
                          kHeight30,
                          ClubWidget(),
                          Center(
                            child: SizedBox(
                              width: size.width / 2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () async {
                                  await Get.find<SampoornaController>()
                                      .addSampoornaToFirebase(schoolId);
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                          kHeight50,
                        ],
                      ),
              )),
        ),
      ),
    );
  }
}

class VaccinationDetailWidget extends StatelessWidget {
  const VaccinationDetailWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: <Widget>[
          SizedBox(
            width: size.width * 0.090,
            child: const ContentTitleWidget(
              title: '9. Vaccination :',
            ),
          ),
          RadioButtonWidget(
              title: 'Yes',
              value: 'Yes',
              function: ((groupValue) {
                if (groupValue != null) {
                  Get.find<SampoornaController>().vaccinationRadio.value =
                      groupValue;
                }
              }),
              groupValue:
                  Get.find<SampoornaController>().vaccinationRadio.value),
          RadioButtonWidget(
              title: 'No',
              value: 'No',
              function: ((groupValue) {
                if (groupValue != null) {
                  Get.find<SampoornaController>().vaccinationRadio.value =
                      groupValue;
                }
              }),
              groupValue:
                  Get.find<SampoornaController>().vaccinationRadio.value),
          Flexible(
            child: TextFormFieldTextWidget(
              title: 'Date of vaccination',
              controller:
                  Get.find<SampoornaController>().dateOfVaccinationController,
            ),
          ),
        ],
      ),
    );
  }
}

class MemberShipWidget extends StatelessWidget {
  const MemberShipWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: <Widget>[
          SizedBox(
            width: size.width * 0.090,
            child: const ContentTitleWidget(
              title: '11. MemberShip :',
            ),
          ),
          RadioButtonWidget(
              title: 'NCC Cadet',
              value: 'NCC Cadet',
              function: ((groupValue) {
                if (groupValue != null) {
                  Get.find<SampoornaController>().memberShipRadio.value =
                      groupValue;
                }
              }),
              groupValue:
                  Get.find<SampoornaController>().memberShipRadio.value),
          RadioButtonWidget(
              title: 'Boys Scout',
              value: 'Boys Scout',
              function: ((groupValue) {
                if (groupValue != null) {
                  Get.find<SampoornaController>().memberShipRadio.value =
                      groupValue;
                }
              }),
              groupValue:
                  Get.find<SampoornaController>().memberShipRadio.value),
          RadioButtonWidget(
              title: 'Girls Guide',
              value: 'Girls Guide',
              function: ((groupValue) {
                if (groupValue != null) {
                  Get.find<SampoornaController>().memberShipRadio.value =
                      groupValue;
                }
              }),
              groupValue:
                  Get.find<SampoornaController>().memberShipRadio.value),
          Flexible(
            child: TextFormFieldTextWidget(
              title: 'Games or Extracurricular Activities',
              controller: Get.find<SampoornaController>()
                  .gameOfExtraCurricularActivtyController,
            ),
          ),
        ],
      ),
    );
  }
}

class TeachersOpinionWidget extends StatelessWidget {
  const TeachersOpinionWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width * 0.090,
          child: const ContentTitleWidget(
            title: '12. Teachers Opinion :',
          ),
        ),
        Flexible(
          child: TextFormFieldTextWidget(
            title: '',
            controller:
                Get.find<SampoornaController>().teacherOpinionController,
          ),
        ),
      ],
    );
  }
}

class PreviuosClassAndDivisionWidget extends StatelessWidget {
  const PreviuosClassAndDivisionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldTextWidget(
      title: 'Previous Class & Division',
      controller:
          Get.find<SampoornaController>().previousClassAndDivisionController,
    );
  }
}

class ClassOfAdmissionWidget extends StatelessWidget {
  const ClassOfAdmissionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextFormFieldTextWidget(
              title: 'Std on Admission',
              controller:
                  Get.find<SampoornaController>().stdOnAdmissionController),
        ),
        Flexible(
          child: TextFormFieldTextWidget(
              title: 'Division on Admission',
              controller: Get.find<SampoornaController>()
                  .divisionOnAdmissionController),
        ),
      ],
    );
  }
}

class StdAdmissionWidget extends StatelessWidget {
  const StdAdmissionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'Std & Div',
            controller: Get.find<SampoornaController>().stdAndDivController,
          ),
        ),
        kHeight20,
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'Admission Number',
            controller:
                Get.find<SampoornaController>().admissionNumberController,
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          TitleTextWidget(title: 'KPM HIGHER SECONDARY SCHOOL'),
          TitleTextWidget(title: 'ROADVILA, C.V.NALLOOR P.O'),
          kHeight40,
          TitleTextWidget(title: 'APPLICATION CUM DATA COLLECTION FORM'),
        ],
      ),
    );
  }
}
