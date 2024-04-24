
import 'package:flutter/material.dart';

import '../../../google_poppins_widget/google_poppins_widget.dart';
import '../../../style/glassmorphism.dart';

functionc(BuildContext context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return const SizedBox(
        height: 100,
        width: 200,
      );
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.elasticIn.transform(a1.value);
      var offset = FractionalOffset(
          1.0 - curve, 0.0); // Adjust the offset for left-side animation
      return Transform.translate(
        offset: Offset(
            offset.dx * 800, 0.0), // Adjust the distance of the animation
        child: Dialog(
          insetAnimationCurve: Curves.bounceIn,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: 800,
                height: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const GlassMorphism(
                          start: 0.6,
                          end: 0.6,
                          child: SizedBox(
                            height: 30,
                            width: 80,
                            child: Center(
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // color: Colors,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () { 
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const AdminHomeScreen();
                            // }
                            // )),
                            },
                            child: GlassMorphism(
                              start: 0.3,
                              end: 0,
                              child: SizedBox(
                                height: 100,
                                width: 150,
                                child: SizedBox(
                                  height: 180,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          // width: 80,
                                          child: Image.asset(
                                              'assets/png/admin (1).png')),
                                      GooglePoppinsWidgets(
                                        text: "ADMIN",
                                        fontsize: 14,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () { 
                            //   Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const TeachersHomeScreen();
                            // })),
                            },
                            child: GlassMorphism(
                              start: 0.3,
                              end: 0,
                              child: SizedBox(
                                height: 100,
                                width: 150,
                                child: SizedBox(
                                  height: 180,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          // width: 80,
                                          child: Image.asset(
                                              'assets/png/teacher (1).png')),
                                      GooglePoppinsWidgets(
                                        text: "TEACHER",
                                        fontsize: 14,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () { 
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const StudentHomeScreen();
                            // })),
                            },
                            child: GlassMorphism(
                              start: 0.3,
                              end: 0,
                              child: SizedBox(
                                height: 100,
                                width: 150,
                                child: SizedBox(
                                  height: 180,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          // width: 80,
                                          child: Image.asset(
                                              'assets/png/graduating-student.png')),
                                      GooglePoppinsWidgets(
                                        text: "STUDENT",
                                        fontsize: 14,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () { 
                            //   Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const ParentHomeScreen();
                            // }));
                            },
                            child: GlassMorphism(
                              start: 0.3,
                              end: 0,
                              child: SizedBox(
                                height: 100,
                                width: 150,
                                child: SizedBox(
                                  height: 180,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          // width: 80,
                                          child: Image.asset(
                                              'assets/png/parents.png')),
                                      GooglePoppinsWidgets(
                                        text: "PARENT",
                                        fontsize: 14,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // color: Colors.amber,
                // alignment: FractionalOffset.center,
                // padding: const EdgeInsets.all(20.0),
              )
            ],
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 3000),
  );
}
