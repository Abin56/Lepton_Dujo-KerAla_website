import 'package:flutter/material.dart';

import '../../../../../model/parent/parent_model.dart';
import '../../../../colors/colors.dart';
import '../../../../constant/constant.dart';

class AddParent extends StatefulWidget {
  AddParent({super.key, required this.schoolID});
  String schoolID;

  @override
  State<AddParent> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddParent> {
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentemailController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();

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
                        'ADD NEW PARENT',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxH30,
                      TextField(
                        controller: parentNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Parent Name',
                        ),
                      ),
                      sizedBoxH30,
                      TextField(
                        controller: parentPhoneNumberController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Parent Phone Number',
                        ),
                      ),
                      sizedBoxH30,
                      SizedBox(
                        width: size.width / 2,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 217, 102, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            final parentDetails = ParentModel(
                                parentPhoneNumber:
                                    parentPhoneNumberController.text.trim(),
                                parentName: parentNameController.text,
                                createdate: DateTime.now().toString());

                            CreateParentsAddToFireBase().createSchoolController(
                                parentDetails, context, widget.schoolID);
                          },
                          child: const Text("Add Parent"),
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
              'assets/images/parent.jpg',
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
