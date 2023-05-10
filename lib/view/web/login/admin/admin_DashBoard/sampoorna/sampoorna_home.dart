import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/Getx/admin/sampoorna/sampoorna_controller.dart';
import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';
import 'widgets/address_detail_widget.dart';
import 'widgets/admission_detail_widget.dart';
import 'widgets/club_widget.dart';
import 'widgets/current_detail_widget.dart';
import 'widgets/parent_details_widget.dart';
import 'widgets/personal_detail_widget.dart';
import 'widgets/school_previously_attended_widger.dart';
import 'widgets/widgets.dart';

class SampoornaHomeScreen extends StatelessWidget {
  String studentId;

  SampoornaHomeScreen({super.key, required this.schoolId,required this.studentId});
  final String schoolId;

  @override


  final SampoornaController sampoornaController =
      Get.put(SampoornaController());

  @override
  Widget build(BuildContext context) {
 
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sampoorna'),
        backgroundColor: adminePrimayColor,
        elevation: 0,
      ),
      body: Form(
        key: sampoornaController.sampoornaFormKey,
        autovalidateMode: AutovalidateMode.disabled,
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
                          sizedBoxH30,
                          TextFormFieldTextWidget(
                            validator: checkFieldEmpty,
                            title: 'School Code',
                            controller:
                                sampoornaController.schoolCodecontroller,
                          ),
                          sizedBoxH20,
                          //std admission number
                          const StdAdmissionWidget(),
                          sizedBoxH30,
                          //Personal Detail
                          const ContentTitleWidget(
                            title: '1. Personal Details :',
                          ),
                          sizedBoxH20,
                          const PersonalDetailWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '2. Parent Details :',
                          ),
                          sizedBoxH20,
                          const ParentDetailsWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '3. Address Details :',
                          ),
                          const AddressDetailWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '4. Previous Details :',
                          ),
                          sizedBoxH20,
                          const SchoolPreviouslyAttendedWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '5. Admission Details :',
                          ),
                          const AdmissionDetailWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '6. Class of Admission :',
                          ),
                          sizedBoxH20,
                          const ClassOfAdmissionWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '7. Previous Class Details :',
                          ),
                          sizedBoxH20,
                          const PreviuosClassAndDivisionWidget(),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '8. Current Details :',
                          ),
                          CurrentDetailWidget(),
                          sizedBoxH40,

                          VaccinationDetailWidget(size: size),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title:
                                '10. Two Identifiaction Marks (In English Only) :',
                          ),
                          sizedBoxH20,
                          TextFormFieldTextWidget(
                            title: 'Identification Mark 1',
                            controller: sampoornaController
                                .identificationMark1Controller,
                            validator: checkFieldEmpty,
                          ),
                          sizedBoxH20,
                          TextFormFieldTextWidget(
                            title: 'Identification Mark 2',
                            controller: sampoornaController
                                .identificationMark2Controller,
                            validator: checkFieldEmpty,
                          ),
                          sizedBoxH40,
                          MemberShipWidget(
                            size: size,
                          ),
                          sizedBoxH40,
                          TeachersOpinionWidget(
                            size: size,
                          ),
                          sizedBoxH40,
                          const ContentTitleWidget(
                            title: '13. Clubs :',
                          ),
                          sizedBoxH30,
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
                                      .addSampoornaToFirebase(schoolId,studentId);
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                          sizedBoxH40,
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
              validator: checkFieldEmpty,
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
              validator: checkFieldEmpty,
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
            validator: checkFieldEmpty,
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
      validator: checkFieldEmpty,
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
                Get.find<SampoornaController>().stdOnAdmissionController,
            validator: checkFieldEmpty,
          ),
        ),
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'Division on Admission',
            controller:
                Get.find<SampoornaController>().divisionOnAdmissionController,
            validator: checkFieldEmpty,
          ),
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
            validator: checkFieldEmpty,
          ),
        ),
        sizedBoxH20,
        Flexible(
          child: TextFormFieldTextWidget(
            title: 'Admission Number',
            controller:
                Get.find<SampoornaController>().admissionNumberController,
            validator: checkFieldEmpty,
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatefulWidget {
  const TitleWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  String schoolName='';
  String schoolPlace ='';
  @override
  void initState() {
    getSchoolDetails();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("SchoolListCollection")
                  .where('id',
                      isEqualTo:
                          Get.find<AdminLoginScreenController>().schoolID)
                  .snapshots(),
              builder: (context, snap) {
                if (snap.hasData) {
                  if (snap.data!.docs.isEmpty) {
                    return  TitleTextWidget(
                        title: schoolName);
                  } else {
                    return TitleTextWidget(
                        title: snap.data!.docs[0]['schoolName']);
                  }
                } else {
                  return  TitleTextWidget(
                      title: schoolName);
                }
              }),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("SchoolListCollection")
                  .where('id',
                      isEqualTo:
                          Get.find<AdminLoginScreenController>().schoolID)
                  .snapshots(),
              builder: (context, snap) {
                if (snap.hasData) {
                  if (snap.data!.docs.isEmpty) {
                    return  TitleTextWidget(
                        title: schoolPlace);
                  } else {
                    return TitleTextWidget(title: snap.data!.docs[0]['place']);
                  }
                } else {
                  return  TitleTextWidget(
                      title: schoolPlace);
                }
              }),
          sizedBoxH40,
          const TitleTextWidget(title: 'APPLICATION CUM DATA COLLECTION FORM'),
        ],
      ),
    );
  }
   void getSchoolDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue!['docid'])
        .get();
    setState(() {
      schoolName = vari.data()!['schoolName'];
        schoolPlace = vari.data()!['place'];
});
}
}
