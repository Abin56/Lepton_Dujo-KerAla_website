import 'package:dropdown_search/dropdown_search.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../controller/fees_bills/fees_status_controller.dart';
import '../../fees_notification/widgets/fees_left_side_widget.dart';

class FeesStstatues extends StatelessWidget {
  FeesStstatues({super.key});
  final FeesStatusController feesStatusController =
      Get.put(FeesStatusController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FeesHalfContainerWidget(
              screenSize: screenSize,
              text: 'Fees Catergories',
            ),
          ),
          Expanded(
            child: Padding(
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
                  DropdownSearch<Map<String, dynamic>>(
                    asyncItems: (String filter) =>
                        feesStatusController.fetchAllSchoolSubCategories(
                            feesStatusController.selectedClass),
                    itemAsString: (Map<String, dynamic> u) => u[""],
                    onChanged: (Map<String, dynamic>? data) => print(data),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Sub Category",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  sizedBoxH20,
                  //select class
                  DropdownSearch<String>(
                    //asyncItems: (String filter) => getData(filter),
                    itemAsString: (String u) => u,
                    onChanged: (String? data) => print(data),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Class",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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