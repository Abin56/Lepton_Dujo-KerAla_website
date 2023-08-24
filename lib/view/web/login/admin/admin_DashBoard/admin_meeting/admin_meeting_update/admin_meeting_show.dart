import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/admin/meeting_controller.dart';
import '../../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../../../../../utils/utils.dart';
import '../../../../../../constant/constant.dart';

class AdminMeetingShowPage extends StatelessWidget {
  AdminMeetingShowPage(
      {super.key, required this.schoolId, required this.adminMeetingModel});
  final String schoolId;
  final AdminMeetingModel adminMeetingModel;

  final AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    addTextToController();
    return Obx(
      () {
        return SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              width: screenSize.width / 3,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: adminMeetingController.isLoadingUpdate.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Form(
                        key: formKey,
                        child: Column(children: [
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: adminMeetingController.dateController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Date',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              adminMeetingController.dateController.text =
                                  await dateTimePicker(context);
                            },
                          ),
                          sizedBoxH20,
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller:
                                adminMeetingController.headingController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Heading',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ),
                          sizedBoxH20,
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: adminMeetingController
                                .categoryOfMeetingController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Category of meeting',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ),
                          sizedBoxH20,
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: adminMeetingController
                                .membersTobeExpectedController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Members to be expected',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ),
                          sizedBoxH20,
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller:
                                adminMeetingController.specialGuestController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Special guest',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          sizedBoxH20,
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: adminMeetingController.timeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Time',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            readOnly: true,
                            onTap: () async {
                              adminMeetingController.timeController.text =
                                  await timePicker(context);
                            },
                          ),
                          sizedBoxH20,
                          TextFormField(
                            validator: checkFieldEmpty,
                            controller: adminMeetingController.venueController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Venue',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ),
                          sizedBoxH20,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Checkbox(
                                      value: adminMeetingController
                                          .studentCheckBox.value,
                                      onChanged: (value) {
                                        adminMeetingController.studentCheckBox
                                            .value = value ?? false;
                                      },
                                    ),
                                    const Text('Students')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: adminMeetingController
                                          .teacherCheckBox.value,
                                      onChanged: (value) {
                                        adminMeetingController.teacherCheckBox
                                            .value = value ?? false;
                                      },
                                    ),
                                    const Text('Teachers')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: adminMeetingController
                                          .guardianCheckBox.value,
                                      onChanged: (value) {
                                        adminMeetingController.guardianCheckBox
                                            .value = value ?? false;
                                      },
                                    ),
                                    const Text('Parents')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: screenSize.width * 1 / 30,
                            width: screenSize.width * 1 / 5,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(14)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(9.0),
                                textStyle: const TextStyle(fontSize: 17),
                              ),
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  adminMeetingController.updateMeetingData(
                                    schoolId: schoolId,
                                    adminMeetingModel: AdminMeetingModel(
                                      date: adminMeetingController
                                          .dateController.text,
                                      heading: adminMeetingController
                                          .headingController.text,
                                      categoryOfMeeting: adminMeetingController
                                          .categoryOfMeetingController.text,
                                      membersToBeExpected:
                                          adminMeetingController
                                              .membersTobeExpectedController
                                              .text,
                                      specialGuest: adminMeetingController
                                          .specialGuestController.text,
                                      time: adminMeetingController
                                          .timeController.text,
                                      venue: adminMeetingController
                                          .venueController.text,
                                      meetingId: adminMeetingModel.meetingId,
                                      visibleGuardian: adminMeetingController
                                          .guardianCheckBox.value,
                                      visibleStudent: adminMeetingController
                                          .studentCheckBox.value,
                                      visibleTeacher: adminMeetingController
                                          .teacherCheckBox.value,
                                    ),
                                    documentId: adminMeetingModel.meetingId,
                                    context: context,
                                  );
                                }
                              },
                              child: const Text('Update'),
                            ),
                          ),
                        ]),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  void addTextToController() {
    adminMeetingController.dateController.text = adminMeetingModel.date;
    adminMeetingController.categoryOfMeetingController.text =
        adminMeetingModel.categoryOfMeeting;
    adminMeetingController.headingController.text = adminMeetingModel.heading;
    adminMeetingController.membersTobeExpectedController.text =
        adminMeetingModel.membersToBeExpected;
    adminMeetingController.timeController.text = adminMeetingModel.time;
    adminMeetingController.venueController.text = adminMeetingModel.venue;
    adminMeetingController.specialGuestController.text =
        adminMeetingModel.specialGuest;
    adminMeetingController.studentCheckBox.value =
        adminMeetingModel.visibleStudent;
    adminMeetingController.teacherCheckBox.value =
        adminMeetingModel.visibleTeacher;
    adminMeetingController.guardianCheckBox.value =
        adminMeetingModel.visibleGuardian;
  }
}
