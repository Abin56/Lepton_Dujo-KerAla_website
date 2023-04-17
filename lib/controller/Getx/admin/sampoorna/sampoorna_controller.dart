

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/admin_models/sampoorna/checked_box_model.dart';
import '../../../../model/admin_models/sampoorna/sampoorna_model.dart';
import '../../../../view/constant/constant.dart';
import '../../../../view/web/login/admin/admin_DashBoard/sampoorna/widgets/widgets.dart';

class SampoornaController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool isLoading = RxBool(false);
  final GlobalKey<FormState> sampoornaFormKey = GlobalKey<FormState>();

  ///this varible is creted for sampoorna [TextFormFieldTextWidget] validator function is only work this variable is true
  bool autoValidationIsOn = false;

  final schoolCodecontroller = TextEditingController();
  final identificationMark1Controller = TextEditingController();
  final identificationMark2Controller = TextEditingController();
  final dateOfVaccinationController = TextEditingController();
  final gameOfExtraCurricularActivtyController = TextEditingController();
  final teacherOpinionController = TextEditingController();
  final previousClassAndDivisionController = TextEditingController();
  final stdOnAdmissionController = TextEditingController();
  final divisionOnAdmissionController = TextEditingController();
  final stdAndDivController = TextEditingController();
  final admissionNumberController = TextEditingController();
  final houseNameController = TextEditingController();
  final placeStreetController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();
  final talukcontroller = TextEditingController();
  final districtPanchayathController = TextEditingController();
  final blockPanchayathController = TextEditingController();
  final nameOfLocalBodyController = TextEditingController();
  final postOfficeController = TextEditingController();
  final pincodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfAdmissionController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final dateOfBirhtController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final casteController = TextEditingController();
  final tcNumberController = TextEditingController();
  final previousSchoolDateController = TextEditingController();
  final schoolPreviouslyAttendedController = TextEditingController();
  final nameOfStudentController = TextEditingController();
  final nationalityController = TextEditingController();
  final academicClassController = TextEditingController();
  final academicyearController = TextEditingController();
  final academicresultController = TextEditingController();
  final artsController = TextEditingController();
  final sportsController = TextEditingController();
  final technologyController = TextEditingController();
  final schoolLevelController = TextEditingController();
  final districtLevelController = TextEditingController();
  final stateLevelController = TextEditingController();
  final scholarShipController = TextEditingController();
  final skillsController = TextEditingController();
  final nameOfStudentFatherController = TextEditingController();
  final nameOfStudentMotherController = TextEditingController();
  final specifyRelationController = TextEditingController();
  final nameOfGuardianController = TextEditingController();
  final occupationOfParentController = TextEditingController();
  final annulaIncomeController = TextEditingController();
  final currentClassController = TextEditingController();
  final currentDivisionController = TextEditingController();
  final totalControllerNoOfDays = TextEditingController();

  //radio Button

  RxString genderRadio = ''.obs;
  RxString nationalityRadio = ''.obs;
  RxString aplOrBplRadio = ''.obs;
  RxString addressRadio = ''.obs;
  RxString religionRadio = ''.obs;
  RxString categoryRadio = ''.obs;
  RxString scOrStRadio = ''.obs;
  RxString cswnRadio = ''.obs;
  RxString instructionMediumRadio = ''.obs;
  RxString firstLanguagePaper1Radio = ''.obs;
  RxString firstLanguagePaper2Radio = ''.obs;
  RxString thirdLanguage = ''.obs;
  RxString vaccinationRadio = ''.obs;
  RxString memberShipRadio = ''.obs;

  //checkedBox
  RxList<CheckedBoxModel> disabilityCheckedBoxList = RxList([
    CheckedBoxModel(
        value: false, title: 'Low vision (20%-39% or above disability'),
    CheckedBoxModel(value: false, title: 'Leprosy Cured'),
    CheckedBoxModel(
        value: false, title: 'Hearing Impaired (40% or above disabilty)'),
    CheckedBoxModel(value: false, title: 'Loco Motor Disability'),
    CheckedBoxModel(value: false, title: 'Speech Impairment'),
    CheckedBoxModel(value: false, title: 'Cerebral Pulsy'),
    CheckedBoxModel(value: false, title: 'MR'),
    CheckedBoxModel(value: false, title: 'Mental Illness'),
    CheckedBoxModel(value: false, title: 'Autism'),
    CheckedBoxModel(value: false, title: 'Others'),
    CheckedBoxModel(value: false, title: 'If Learning Disabilty :LD(Dyslexic)'),
    CheckedBoxModel(value: false, title: 'LD(Dygraphia)'),
    CheckedBoxModel(value: false, title: 'LD(Dyscalcuclia)'),
  ]);

  RxList<CheckedBoxModel> clubCheckedBoxList = RxList([
    CheckedBoxModel(value: false, title: 'IT'),
    CheckedBoxModel(value: false, title: 'NGC'),
    CheckedBoxModel(value: false, title: 'Arts Club'),
    CheckedBoxModel(value: false, title: 'Readers Club'),
    CheckedBoxModel(value: false, title: 'Forestry Club'),
    CheckedBoxModel(value: false, title: 'Sports Club'),
    CheckedBoxModel(value: false, title: 'Film Club'),
    CheckedBoxModel(value: false, title: 'Nature Club'),
    CheckedBoxModel(value: false, title: 'Arts Club'),
    CheckedBoxModel(value: false, title: 'Readers Club'),
    CheckedBoxModel(value: false, title: 'Forestry Club'),
    CheckedBoxModel(value: false, title: 'Sports Club'),
    CheckedBoxModel(value: false, title: 'Film Club'),
    CheckedBoxModel(value: false, title: 'Nature Club'),
    CheckedBoxModel(value: false, title: 'Social'),
    CheckedBoxModel(value: false, title: 'Tourism'),
    CheckedBoxModel(value: false, title: 'Career Club'),
    CheckedBoxModel(value: false, title: 'Green Club'),
    CheckedBoxModel(value: false, title: 'Energy Club'),
    CheckedBoxModel(value: false, title: 'Science'),
    CheckedBoxModel(value: false, title: 'Vidhya Rangam'),
    CheckedBoxModel(value: false, title: 'English Club'),
    CheckedBoxModel(value: false, title: 'Maths Club'),
    CheckedBoxModel(value: false, title: 'Work Experience'),
    CheckedBoxModel(value: false, title: 'Eco Club'),
    CheckedBoxModel(value: false, title: 'Filately Club'),
    CheckedBoxModel(value: false, title: 'Hindi Club'),
    CheckedBoxModel(value: false, title: 'Science'),
    CheckedBoxModel(value: false, title: 'Social Club'),
    CheckedBoxModel(value: false, title: 'Gandhi Darshan'),
    CheckedBoxModel(value: false, title: 'Health Club'),
    CheckedBoxModel(value: false, title: 'Social Service'),
    CheckedBoxModel(value: false, title: 'Teen Club'),
    CheckedBoxModel(value: false, title: 'Arabic Club'),
    CheckedBoxModel(value: false, title: 'Junior Red Cross'),
  ]);

  RxList<CheckedBoxWidget> listOfClubCheckedBox = RxList<CheckedBoxWidget>([]);
  RxList<CheckedBoxWidget> listOfDisabilityCheckedBox =
      RxList<CheckedBoxWidget>([]);

  void generateClubWidget() {
    listOfClubCheckedBox.value = List<CheckedBoxWidget>.generate(
      clubCheckedBoxList.length,
      (i) => CheckedBoxWidget(
        title: clubCheckedBoxList[i].title,
        value: clubCheckedBoxList[i].value,
        function: (value) {
          if (value != null) {
            clubCheckedBoxList[i].value = value;
            generateClubWidget();
            listOfClubCheckedBox.refresh();
          }
        },
      ),
    );
  }

  void generateDisabilityWidget() {
    listOfClubCheckedBox.value = List<CheckedBoxWidget>.generate(
      clubCheckedBoxList.length,
      (i) => CheckedBoxWidget(
        title: clubCheckedBoxList[i].title,
        value: clubCheckedBoxList[i].value,
        function: (value) {
          if (value != null) {
            clubCheckedBoxList[i].value = value;
            generateDisabilityWidget();
            listOfClubCheckedBox.refresh();
          }
        },
      ),
    );
  }

  Future<void> addSampoornaToFirebase(String schoolId) async {
    if (genderRadio.isEmpty ||
        nationalityRadio.isEmpty ||
        aplOrBplRadio.isEmpty ||
        addressRadio.isEmpty ||
        religionRadio.isEmpty ||
        categoryRadio.isEmpty ||
        scOrStRadio.isEmpty ||
        cswnRadio.isEmpty ||
        instructionMediumRadio.isEmpty ||
        firstLanguagePaper1Radio.isEmpty ||
        firstLanguagePaper2Radio.isEmpty ||
        thirdLanguage.isEmpty ||
        vaccinationRadio.isEmpty ||
        memberShipRadio.isEmpty) {
      showToast(msg: 'Please select radio Button');
      return;
    }

    try {
      if (sampoornaFormKey.currentState == null) {
        return;
      }
      final validated = sampoornaFormKey.currentState!.validate();
      autoValidationIsOn = true;
      if (validated) {
        isLoading.value = true;
        final sampoornaData = SampoornaModel(
            schoolCode: schoolCodecontroller.text,
            admissionNumber: admissionNumberController.text,
            stdDiv: stdAndDivController.text,
            nameOfStudent: nameOfStudentController.text,
            gender: genderRadio.value,
            nationality: nationalityController.text,
            academicClass: academicClassController.text,
            academicYear: academicyearController.text,
            academicResult: academicresultController.text,
            arts: artsController.text,
            sports: sportsController.text,
            technology: technologyController.text,
            schoolLevelAchievements: schoolLevelController.text,
            districtLevelAchievements: districtLevelController.text,
            stateLevelAchievements: stateLevelController.text,
            scholarShip: scholarShipController.text,
            skills: skillsController.text,
            nameOfStudentFather: nameOfStudentFatherController.text,
            nameOfStudentMother: nameOfStudentMotherController.text,
            otherSpecifyRelation: specifyRelationController.text,
            nameOfGuardian: nameOfGuardianController.text,
            occupationOfParent: occupationOfParentController.text,
            annualIncome: annulaIncomeController.text,
            aplOrBpl: aplOrBplRadio.value,
            houseName: houseNameController.text,
            placeOrStreet: placeStreetController.text,
            district: districtController.text,
            state: stateController.text,
            taluk: talukcontroller.text,
            panchayathOrOther: addressRadio.value,
            districtPanchayath: districtPanchayathController.text,
            blockPanchayath: blockPanchayathController.text,
            nameOfLocalBody: nameOfLocalBodyController.text,
            postOffice: postOfficeController.text,
            pinCode: pincodeController.text,
            phoneNumber: phoneNumberController.text,
            studentEmail: emailController.text,
            tcNumber: tcNumberController.text,
            tcDate: previousSchoolDateController.text,
            schoolPreviouslyAttended: schoolPreviouslyAttendedController.text,
            dateOfAdmission: dateOfAdmissionController.text,
            placeOfBirth: placeOfBirthController.text,
            dateOfBirth: dateOfBirhtController.text,
            bloodGroup: bloodGroupController.text,
            relegion: religionRadio.value,
            category: categoryRadio.value,
            belongScOrSt: scOrStRadio.value,
            caste: casteController.text,
            stdOnAdmission: stdOnAdmissionController.text,
            divisionOnAdmission: divisionOnAdmissionController.text,
            previousClassAndDivision: previousClassAndDivisionController.text,
            currentClass: currentClassController.text,
            currentDivision: currentDivisionController.text,
            totalNumberOfWorkingDays: totalControllerNoOfDays.text,
            cswnchildren: cswnRadio.value,
            disability: disabilityCheckedBoxList.map((element) {
              return {element.title: element.value};
            }).toList(),
            instructionMedium: instructionMediumRadio.value,
            firstLanguagePaper1: firstLanguagePaper1Radio.value,
            firstLanguagePaper2: firstLanguagePaper2Radio.value,
            thirdLanguage: thirdLanguage.value,
            vaccination: vaccinationRadio.value,
            identificationMark1: identificationMark1Controller.text,
            identificationMark2: identificationMark2Controller.text,
            memberShip: memberShipRadio.value,
            extraCurriculamActivity:
                gameOfExtraCurricularActivtyController.text,
            teachersOpinion: teacherOpinionController.text,
            clubs: clubCheckedBoxList
                .map((element) => {element.title: element.value})
                .toList(),
            id: '');

        final result = await firebaseFirestore
            .collection('SchoolListCollection')
            .doc(schoolId)
            .collection('sampoorna')
            .add(sampoornaData.toJson());

        await firebaseFirestore
            .collection('SchoolListCollection')
            .doc(schoolId)
            .collection('sampoorna')
            .doc(result.id)
            .update({"id": result.id});
        clearData();
        showToast(msg: 'Sampoorna created successfully');
        isLoading.value = false;
        autoValidationIsOn = false;
      }
    } catch (e) {
      isLoading.value = false;
      showToast(msg: 'Sampoorna not created');
    }
  }

  void clearData() {
    schoolCodecontroller.clear();
    identificationMark1Controller.clear();
    identificationMark2Controller.clear();
    dateOfVaccinationController.clear();
    gameOfExtraCurricularActivtyController.clear();
    teacherOpinionController.clear();
    previousClassAndDivisionController.clear();
    stdOnAdmissionController.clear();
    divisionOnAdmissionController.clear();
    stdAndDivController.clear();
    admissionNumberController.clear();
    houseNameController.clear();
    placeStreetController.clear();
    districtController.clear();
    stateController.clear();
    talukcontroller.clear();
    districtPanchayathController.clear();
    blockPanchayathController.clear();
    nameOfLocalBodyController.clear();
    postOfficeController.clear();
    pincodeController.clear();
    phoneNumberController.clear();
    emailController.clear();
    dateOfAdmissionController.clear();
    placeOfBirthController.clear();
    dateOfBirhtController.clear();
    bloodGroupController.clear();
    casteController.clear();
    tcNumberController.clear();
    previousSchoolDateController.clear();
    schoolPreviouslyAttendedController.clear();
    nameOfStudentController.clear();
    nationalityController.clear();
    academicClassController.clear();
    academicyearController.clear();
    academicresultController.clear();
    artsController.clear();
    sportsController.clear();
    technologyController.clear();
    schoolLevelController.clear();
    districtLevelController.clear();
    stateLevelController.clear();
    scholarShipController.clear();
    skillsController.clear();
    nameOfStudentFatherController.clear();
    nameOfStudentMotherController.clear();
    specifyRelationController.clear();
    nameOfGuardianController.clear();
    occupationOfParentController.clear();
    annulaIncomeController.clear();
    currentClassController.clear();
    currentDivisionController.clear();
    totalControllerNoOfDays.clear();

    //radio Button

    genderRadio.value = '';
    nationalityRadio.value = '';
    aplOrBplRadio.value = '';
    addressRadio.value = '';
    religionRadio.value = '';
    categoryRadio.value = '';
    scOrStRadio.value = '';
    cswnRadio.value = '';
    instructionMediumRadio.value = '';
    firstLanguagePaper1Radio.value = '';
    firstLanguagePaper2Radio.value = '';
    thirdLanguage.value = '';
    vaccinationRadio.value = '';
    memberShipRadio.value = '';
    generateClubWidget();
    generateDisabilityWidget();
  }

  @override
  void onInit() {
    generateClubWidget();
    generateDisabilityWidget();
    super.onInit();
  }
}