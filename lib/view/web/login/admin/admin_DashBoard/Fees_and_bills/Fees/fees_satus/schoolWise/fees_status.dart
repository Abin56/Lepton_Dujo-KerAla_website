import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_status_controller.dart';
import '../../../../../../../../../model/class_model/class_model.dart';
import '../../../../../../../../../model/fees_bills_model/fees_subcategory_model.dart';
import '../../fees_notification/widgets/fees_left_side_widget.dart';
import 'fees_class_students.dart';

class FeesStstatues extends StatelessWidget {
  const FeesStstatues({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FeesFilterSecondHalfWidget(),
          ),
          Expanded(
            child: FeesHalfContainerWidget(
              screenSize: screenSize,
              text: 'Fees Catergories',
            ),
          ),
        ],
      ),
    );
  }
}

class FeesFilterSecondHalfWidget extends StatelessWidget {
  FeesFilterSecondHalfWidget({
    super.key,
  });

  final FeesStatusController feesStatusController =
      Get.put(FeesStatusController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          //select category
          DropdownSearch<Map<String, dynamic>>(
            asyncItems: (String filter) =>
                feesStatusController.fetchAllSchoolCategories(),
            itemAsString: (Map<String, dynamic> u) => u["categoryName"],
            onChanged: (Map<String, dynamic>? data) {
              feesStatusController.selectedMainCategory = data?["id"];
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          sizedBoxH20,
          //select sub category
          DropdownSearch<FeesSubCategoryModel>(
            asyncItems: (String filter) =>
                feesStatusController.fetchAllSchoolSubCategories(
                    feesStatusController.selectedMainCategory),
            itemAsString: (FeesSubCategoryModel u) => u.date,
            onChanged: (FeesSubCategoryModel? data) =>
                feesStatusController.selectedSubCategory = data?.id ?? "",
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Sub Category",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          sizedBoxH20,
          //select class
          DropdownSearch<ClassModel>(
            asyncItems: (String filter) => feesStatusController.getAllClasses(),
            itemAsString: (ClassModel u) => u.className,
            onChanged: (ClassModel? data) =>
                feesStatusController.selectedClass = data?.docid ?? "",
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Class",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          sizedBoxH20,

          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeesClassStudents(
                        classId: feesStatusController.selectedClass,
                        feesCategory: feesStatusController.selectedMainCategory,
                        subCategory: feesStatusController.selectedSubCategory,
                      ),
                    ));
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}


//  Expanded(
//             child: FutureBuilder(
//               future: feesBillsController.fetchCategoryList(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return GridView.builder(
//                     itemCount: snapshot.data?.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                     ),
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.all(20.w),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => FeesClassStatus(
//                                       feesCategory: snapshot.data?[index]
//                                           ["id"]),
//                                 ));
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color:
//                                         const Color.fromARGB(211, 122, 117, 117)
//                                             .withOpacity(0.5),
//                                     spreadRadius: 10,
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(3.w),
//                                 )),
//                             height: 80.w,
//                             width: 160.w,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(
//                                   height: 10.w,
//                                 ),
//                                 GoogleMonstserratWidgets(
//                                     text: snapshot.data?[index]["categoryName"],
//                                     fontsize: 15.w,
//                                     color: cBlack,
//                                     fontWeight: FontWeight.w600),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   return const SizedBox();
//                 }
//               },
//             ),
//           ),