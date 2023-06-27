
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/meeting_controller.dart';
import '../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class MeetingCreates extends StatelessWidget {
  MeetingCreates({super.key, required this.schoolId});
  final String schoolId;
  final AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());
  @override
  Widget build(BuildContext context) {
    adminMeetingController.clearControllers();
    final Size size = MediaQuery.of(context).size;
    
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('MEETINGS'),
        //   backgroundColor: adminePrimayColor,
        // ),
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
                                        color: adminePrimayColor),
                                    labelText: "Enter date"),
                                readOnly: true,
                                onTap: () async {
                                  adminMeetingController.dateController.text =
                                      await dateTimePicker(context);
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
                              labelText: 'Members to be expected',
                            ),
                            TextFieldMettingWidget(
                              textEditingController:
                                  adminMeetingController.specialGuestController,
                              labelText: 'Special guest',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                controller:
                                    adminMeetingController.timeController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    icon: const Icon(Icons.calendar_today,
                                        color: adminePrimayColor),
                                    labelText: "Time"),
                                readOnly: true,
                                onTap: () async {
                                  adminMeetingController.timeController.text =
                                      await timePicker(context);
                                },
                              ),
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
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: adminePrimayColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButtonBackWidget(color: cWhite),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxH40,
                Text(
                  'Hi ! Admin ',
                  style: ralewayStyle.copyWith(
                    fontSize: 45.0,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                sizedBoxH20,
                Text(
                  'Create Meetings',
                  style: ralewayStyle.copyWith(
                    fontSize: 30.0,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                 SizedBox(
                                        height: screenSize.width/3.5,
                                        width:screenSize.width/2,
                                        child: LottieBuilder.network(
                                            "https://assets1.lottiefiles.com/packages/lf20_q5qvqtnr.json"),
                                      ) 
                
                // LottieBuilder.network(
                //     'https://assets1.lottiefiles.com/packages/lf20_q5qvqtnr.json')
              ],
            ),
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
          color:adminePrimayColor, borderRadius: BorderRadius.circular(14)),
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
            icon: const Icon(Icons.topic, color: adminePrimayColor),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }
}
