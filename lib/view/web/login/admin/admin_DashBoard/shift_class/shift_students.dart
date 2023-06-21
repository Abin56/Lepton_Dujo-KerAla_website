import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/admin/shitft_class_controller/shift_class_controller.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/Iconbackbutton.dart';

class ShiftClassStudents extends StatelessWidget {
  ShiftClassStudents({super.key});
  ShiftClassController shiftClassController = Get.put(ShiftClassController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Row(children: [
      Container(
        color: const Color.fromARGB(255, 12, 34, 133),
        height: size.height,
        width: size.width * 1 / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButtonBackWidget(color: cWhite),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi  ',
                    style: ralewayStyle.copyWith(
                      fontSize: 45.0.w,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width / 20,
                  ),
                  Text(
                    'promote students to next class',
                    style: ralewayStyle.copyWith(
                      fontSize: 22.0.w,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width / 5.5,
                    width: screenSize.width / 2,
                    child: LottieBuilder.network(
                        "https://assets10.lottiefiles.com/private_files/lf30_6if6i6i8.json"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        //
        height: screenSize.height,
        width: screenSize.width * 1 / 2,

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 50.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GoogleMonstserratWidgets(
                            text: 'Batch :',
                            fontsize: 20.w,
                            fontWeight: FontWeight.w600),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Container(
                            height: 50.w,
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              //borderRadius: BorderRadius.circular(13),
                            ),
                            child: FutureBuilder(
                                future:
                                    shiftClassController.fetchBatchDetails(),
                                builder: (context, snapshot) {
                                  return Obx(() => DropdownButton(
                                        value:
                                            shiftClassController.batchId.value,
                                        hint: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Select Batch",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 18.w),
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        style: TextStyle(
                                          fontSize: 18.w,
                                          color: Colors.black,
                                        ),
                                        icon: const Padding(
                                          padding: EdgeInsets.all(
                                            13,
                                          ),
                                          child: Icon(Icons.arrow_drop_down,
                                              size: 18, color: Colors.grey),
                                        ),
                                        isExpanded: true,
                                        items: snapshot.data?.map(
                                          (val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (val) async {
                                          if (val != null) {
                                            shiftClassController.batchId.value =
                                                val;
                                            await shiftClassController
                                                .fetchNewClasses();
                                          }
                                        },
                                      ));
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GoogleMonstserratWidgets(
                            text: 'Class :',
                            fontsize: 20.w,
                            fontWeight: FontWeight.w600),
                        Container(
                          height: 50.w,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                          ),
                          child: Obx(() => shiftClassController.isLoading.value
                              ? circularProgressIndicator
                              : DropdownButton(
                                  value: shiftClassController.newClassId.value,
                                  hint: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Select Class",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontSize: 18.w),
                                    ),
                                  ),
                                  underline: const SizedBox(),
                                  style: TextStyle(
                                    fontSize: 18.w,
                                    color: Colors.black,
                                  ),
                                  icon: const Padding(
                                    padding: EdgeInsets.all(
                                      13,
                                    ),
                                    child: Icon(Icons.arrow_drop_down,
                                        size: 18, color: Colors.grey),
                                  ),
                                  isExpanded: true,
                                  items:
                                      shiftClassController.newClassesList.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val.docid,
                                        child: Text(val.className),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    shiftClassController.newClassId.value = val;
                                  },
                                )),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.w),
                    height: screenSize.height,
                    width: 650.w,
                    decoration: BoxDecoration(
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(10.w))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.w,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.w),
                                  child: GoogleMonstserratWidgets(
                                    text: 'Admission Number',
                                    fontsize: 14.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GoogleMonstserratWidgets(
                                  text: 'studentname',
                                  fontsize: 14.w,
                                  fontWeight: FontWeight.w600,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.w),
                                    child: Center(
                                      child: GoogleMonstserratWidgets(
                                        text: "ADD",
                                        fontsize: 14.w,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          FutureBuilder(
                              future: shiftClassController.getAllStudents(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Expanded(
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          //checking current data contains addStudentsToNewClassList

                                          return ListTile(
                                            leading: SizedBox(
                                              width: 50,
                                              child: Text(snapshot.data?[index]
                                                      .admissionNumber ??
                                                  ""),
                                            ),
                                            title: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Center(
                                                child: Text(
                                                  snapshot.data?[index]
                                                          .studentName ??
                                                      "",
                                                ),
                                              ),
                                            ),
                                            trailing: ElevatedButton(
                                              onPressed: () {
                                                if (!shiftClassController
                                                    .addStudentstoNewClassList
                                                    .contains(snapshot
                                                        .data![index])) {
                                                  shiftClassController
                                                      .addStudentstoNewClassList
                                                      .add(snapshot
                                                          .data![index]);
                                                  shiftClassController
                                                      .addStudentstoNewClassList
                                                      .refresh();
                                                } else {
                                                  shiftClassController
                                                      .addStudentstoNewClassList
                                                      .remove(snapshot
                                                          .data![index]);
                                                  shiftClassController
                                                      .addStudentstoNewClassList
                                                      .refresh();
                                                }
                                              },
                                              child: Obx(() => shiftClassController
                                                      .addStudentstoNewClassList
                                                      .contains(
                                                          snapshot.data![index])
                                                  ? const Text('Remove')
                                                  : const Text('Add')),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const Divider();
                                        },
                                        itemCount: snapshot.data?.length ?? 0),
                                  );
                                } else {
                                  return const Center(
                                    child: Text("No data found"),
                                  );
                                }
                              }),
                          ElevatedButton(
                            onPressed: () async {
                              await shiftClassController
                                  .addSelectedStudentsToNewBatch();
                            },
                            child: Obx(
                              () {
                                return shiftClassController
                                        .isLoadingSubmit.value
                                    ? circularProgressIndicator
                                    : const Text(
                                        "promote Selected Students to new class");
                              },
                            ),
                          ),
                          sizedBoxH10,
                          FutureBuilder(
                              future: shiftClassController.getAllStudents(),
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (shiftClassController
                                            .addStudentstoNewClassList.length !=
                                        snapshot.data?.length) {
                                      shiftClassController.isLoading.value =
                                          true;
                                      shiftClassController
                                          .addStudentstoNewClassList
                                          .value = snapshot.data!;
                                      shiftClassController.isLoading.value =
                                          false;
                                    } else {
                                      shiftClassController
                                          .addStudentstoNewClassList.value = [];
                                      shiftClassController
                                          .addStudentstoNewClassList
                                          .refresh();
                                    }
                                  },
                                  child: Obx(
                                    () {
                                      return shiftClassController
                                              .isLoadingSubmit.value
                                          ? circularProgressIndicator
                                          : shiftClassController
                                                      .addStudentstoNewClassList
                                                      .length !=
                                                  snapshot.data?.length
                                              ? const Text(
                                                  "Select All Students")
                                              : const Text(
                                                  "Remove All Students");
                                    },
                                  ),
                                );
                              }),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    ])));
  }
}
