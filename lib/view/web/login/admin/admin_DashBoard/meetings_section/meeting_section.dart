
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/meeting_controller.dart';
import '../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

AdminMeetingController adminMeetingController =
    Get.put(AdminMeetingController());

class MeetingCreates extends StatelessWidget {
  const MeetingCreates({super.key, required this.schoolId});
  final String schoolId;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('MEETINGS'),
          backgroundColor: adminePrimayColor,
        ),
        body: Obx(() {
          if (adminMeetingController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        width: size.width * .4,
                        height: size.height,
                        child: const AdminMeetingCreateLeftSideWidget()),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size.width * .6,
                      height: size.height,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            //seperated text field for date time picker
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                controller:
                                    adminMeetingController.dateController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    icon: const Icon(Icons.calendar_today,
                                        color:
                                           adminePrimayColor),
                                    labelText: "Enter Date", labelStyle: TextStyle(color: Colors.black)),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyy')
                                            .format(pickedDate);
                                    adminMeetingController.dateController.text =
                                        formattedDate;
                                  }
                                },
                              ),
                            ),
                            TextFieldMettingWidget(
                              textEditingController:
                                  adminMeetingController.headingController,
                              labelText: 'Heading',
                            ),
                            TextFieldMettingWidget(
                              textEditingController: adminMeetingController
                                  .categoryOfMeetingController,
                              labelText: 'Category',
                            ),
                            TextFieldMettingWidget(
                              textEditingController: adminMeetingController
                                  .membersTobeExpectedController,
                              labelText: 'Members to be Expected',
                            ),
                            TextFieldMettingWidget(
                              textEditingController:
                                  adminMeetingController.specialGuestController,
                              labelText: 'Special Guest',
                            ),
                            TextFieldMettingWidget(
                              textEditingController:
                                  adminMeetingController.timeController,
                              labelText: 'Time',
                            ),
                            TextFieldMettingWidget(
                              textEditingController:
                                  adminMeetingController.venueController,
                              labelText: 'Venue',
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CheckedBoxMeetingWidget(
                                adminMeetingController: adminMeetingController,
                              ),
                            ),
                            sizedBoxH30,
                            SubmitButtonMeetinWidget(
                              size: size,
                              adminMeetingController: adminMeetingController,
                              schoolId: schoolId,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]);
          }
        }));
  }
}

class AdminMeetingCreateLeftSideWidget extends StatelessWidget {
  const AdminMeetingCreateLeftSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: adminePrimayColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi Admin ',
              style: ralewayStyle.copyWith(
                fontSize: 48.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Create Meetings',
              style: ralewayStyle.copyWith(
                fontSize: 25.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            LottieBuilder.network(
                'https://assets1.lottiefiles.com/packages/lf20_q5qvqtnr.json')
          ],
        ),
      ),
    );
  }
}

class SubmitButtonMeetinWidget extends StatelessWidget {
  const SubmitButtonMeetinWidget({
    super.key,
    required this.size,
    required this.adminMeetingController,
    required this.schoolId,
  });

  final Size size;
  final AdminMeetingController adminMeetingController;
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 1 / 30,
      width: size.width * 1 / 5,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(14)),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(9.0),
          textStyle: const TextStyle(fontSize: 17),
        ),
        onPressed: () {
          adminMeetingController.addAdminMeeting(
              schoolId,
              AdminMeetingModel(
                date: adminMeetingController.dateController.text,
                heading: adminMeetingController.headingController.text,
                categoryOfMeeting:
                    adminMeetingController.categoryOfMeetingController.text,
                membersToBeExpected:
                    adminMeetingController.membersTobeExpectedController.text,
                specialGuest:
                    adminMeetingController.specialGuestController.text,
                time: adminMeetingController.timeController.text,
                venue: adminMeetingController.venueController.text,
                meetingId: '',
                visibleGuardian: adminMeetingController.guardianCheckBox.value,
                visibleStudent: adminMeetingController.studentCheckBox.value,
                visibleTeacher: adminMeetingController.teacherCheckBox.value,
              ));
        },
        child: const Text('Create'),
      ),
    );
  }
}

class CheckedBoxMeetingWidget extends StatelessWidget {
  const CheckedBoxMeetingWidget({
    super.key,
    required this.adminMeetingController,
  });

  final AdminMeetingController adminMeetingController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Checkbox(
                value: adminMeetingController.studentCheckBox.value,
                onChanged: (value) {
                  adminMeetingController.studentCheckBox.value = value ?? false;
                },
              ),
              const Text('Students')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: adminMeetingController.teacherCheckBox.value,
                onChanged: (value) {
                  adminMeetingController.teacherCheckBox.value = value ?? false;
                },
              ),
              const Text('Teacher')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: adminMeetingController.guardianCheckBox.value,
                onChanged: (value) {
                  adminMeetingController.guardianCheckBox.value =
                      value ?? false;
                },
              ),
              const Text('Guardian')
            ],
          ),
        ],
      );
    });
  }
}

class TextFieldMettingWidget extends StatelessWidget {
  const TextFieldMettingWidget(
      {super.key,
      required this.textEditingController,
      required this.labelText});

  final TextEditingController textEditingController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            icon: const Icon(Icons.topic,
                color:adminePrimayColor),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }
}
