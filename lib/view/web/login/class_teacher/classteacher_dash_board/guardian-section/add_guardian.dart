import 'package:flutter/material.dart';

import '../../../../../../model/guardian/guardian_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';

class AddGuardian extends StatefulWidget {
  AddGuardian({super.key, required this.schoolId});
  String schoolId;

  @override
  State<AddGuardian> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddGuardian> {
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianPhoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: adminePrimayColor),
      body: Row(
        children: <Widget>[
          //left section

          SizedBox(
            width: size.width / 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ADD NEW GUARDIAN',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxH30,
                      TextField(
                        controller: guardianNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Guardian Name',
                        ),
                      ),
                      sizedBoxH30,
                      TextField(
                        controller: guardianPhoneNoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Guardian PhoneNumber',
                        ),
                      ),
                      sizedBoxH30,
                      SizedBox(
                        width: size.width / 2,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 217, 102, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            final guardianDetails = GuardianAddModel(
                              createdate: DateTime.now().toString(),
                              guardianPhoneNumber:
                                  guardianPhoneNoController.text.trim(),
                              guardianName: guardianNameController.text.trim(),
                            );
                            if (context.mounted) {
                              CreateGuardiansAddToFireBase()
                                  .createSchoolController(guardianDetails,
                                      context, widget.schoolId);
                            }
                          },
                          child: const Text("Add Guardian"),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 2,
            height: size.height,
            child: Image.asset(
              'assets/images/guardian.jpg',
              width: size.width / 2,
              fit: BoxFit.fill,
            ),
          ),
          //right section
        ],
      ),
    );
  }
}
