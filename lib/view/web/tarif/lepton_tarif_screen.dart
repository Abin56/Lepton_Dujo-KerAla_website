import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/payment_tarif/checking_tarif_controller.dart';
import 'package:dujo_kerala_website/model/tarif_purchase_model/tarif_purchase_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/widgets/button_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../google_poppins_widget/google_poppins_widget.dart';
import '../widgets/drop_DownList/get_tarif.dart';

class LeptonTarifScreen extends StatefulWidget {
  const LeptonTarifScreen({super.key});

  @override
  State<LeptonTarifScreen> createState() => _LeptonTarifScreenState();
}

class _LeptonTarifScreenState extends State<LeptonTarifScreen> {
  TarifController tarifController = Get.put(TarifController());

  @override
  Widget build(BuildContext context) {
    String totalpayment = '';
    double gst = 0;
    //total = totalpayment+(totalpayemt)*18/100
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 71, 164, 235).withOpacity(0.1)),
        height: 700,
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 600,
              width: 550,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/leptondujokerala.appspot.com/o/files%2FLepton%2Fleptonlogo.png?alt=media&token=2e71233e-58a5-42b7-abc7-b51e56774854',
                        height: 100,
                        width: 100,
                      ),
                      GoogleMonstserratWidgets(
                        text: "Lepton Dujo Tarif",
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ],
                  ),
                  sizedBoxH20,
                  GoogleMonstserratWidgets(
                    text: "Choose your school type",
                    fontsize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GooglePoppinsWidgets(
                        color: Colors.grey,
                        text: "*Based on student strength*",
                        fontsize: 11,
                      ),
                    ],
                  ),
                  sizedBoxH20,
                  SizedBox(
                      height: 50,
                      width: 400,
                      child: Row(
                        children: [
                          GooglePoppinsWidgets(
                            color: Colors.white,
                            text: "Select Student Strenght :  ",
                            fontsize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                          Expanded(child: GetTarifListDropDownButton()),
                        ],
                      )),
                  sizedBoxH20,
                  Obx(() {
                    if (tarifController.price.value.isEmpty) {
                      return Center(
                        child: GooglePoppinsWidgets(
                          color: Colors.white,
                          text: "Select Plan ↑ ",
                          fontsize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    } else {
                      totalpayment = tarifController.price.value;
                      double d = double.parse(tarifController.price.value);
                      gst = d+(d)*18/100;

                      // totalpayment = totalpayment +
                      //     tarifController.additionalFeatures[0].price +
                      //     totalpayment +
                      //     tarifController.additionalFeatures[1].price;

                      if (tarifController
                          .additionalFeatures[0].price.isNotEmpty) {
                        int result0 = int.parse(
                                tarifController.additionalFeatures[0].price) +
                            int.parse(totalpayment);
                        totalpayment = result0.toString();
                        gst = result0 + (result0) * 18 / 100;
                        // log("message$result0");
                        // log("Resuktsss${result0.toString()}");
                      }

                      if (tarifController
                          .additionalFeatures[1].price.isNotEmpty) {
                        int result0 = int.parse(
                                tarifController.additionalFeatures[1].price) +
                            int.parse(totalpayment);
                        totalpayment = result0.toString();
                        gst = result0 + (result0) * 18 / 100;
                      }

                      return Column(
                        children: [
                          GooglePoppinsWidgets(
                            color: Colors.white,
                            text:
                                "Selected Plan : ${tarifController.selectedPlan.value} ",
                            fontsize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                          GooglePoppinsWidgets(
                            color: Colors.white,
                            text:
                                "Maximum Students: ${tarifController.maxstudents.value} ",
                            fontsize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                          GooglePoppinsWidgets(
                            color: Colors.white,
                            text: "Price :  ${tarifController.price.value} INR",
                            fontsize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                          GestureDetector(
                            onTap: () async {
                              return showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: const Color.fromARGB(
                                        255, 141, 191, 232),
                                    title: const Text('Dujo Features'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          GooglePoppinsWidgets(
                                            text:
                                                '''The above mentioned Tariff include following features\n
• Digitalized infra of school
• Live updates of attendance
• List of classes
• List of teachers
• Notices and Events as notifications
• Online payment facilities
• Generate bill option
• Recorded classes
• Student login
• Parent login
• Admin login
• Teacher login
• Guardian Login
• Generate TC
• Generate student summary
• Chat
• Progress Report
• Exam Notifications
• PTA
• Mother PTA
• School Protection Group
• Time Table
• Live classes''',
                                            fontsize: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: GooglePoppinsWidgets(
                              color: Colors.white,
                              text: "View Features",
                              fontsize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxH20,
                          GestureDetector(
                            onTap: () async {
                              selectcount(
                                context,
                              );
                            },
                            child: ButtonContainerWidget(
                                curving: 10,
                                colorindex: 0,
                                height: 40,
                                width: 200,
                                child: Center(
                                  child: GooglePoppinsWidgets(
                                    color: Colors.amber,
                                    text: "Add Aditional Featuers",
                                    fontsize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          Obx(() => SizedBox(
                                height: 100,
                                child: tarifController
                                        .additionalFeatures.isEmpty
                                    ? const Text("Nodata")
                                    : ListView.separated(
                                        itemBuilder: (context, index) {
                                          // log('TotalSum ===${tarifController.extraFeatureTotalPrice.value}');
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  GooglePoppinsWidgets(
                                                    text:
                                                        "Product : ${tarifController.additionalFeatures[index].product}",
                                                    fontsize: 12,
                                                    color: Colors.white,
                                                  ),
                                                  sizedBoxW20,
                                                  GooglePoppinsWidgets(
                                                    text:
                                                        "qty : ${tarifController.additionalFeatures[index].quantity}",
                                                    fontsize: 11,
                                                    color: Colors.white,
                                                  ),
                                                  sizedBoxW20,
                                                  GooglePoppinsWidgets(
                                                    text:
                                                        "Price : ${tarifController.additionalFeatures[index].price}",
                                                    fontsize: 11,
                                                    color: Colors.white,
                                                  ),
                                                  const Spacer(),
                                                  TextButton.icon(
                                                      onPressed: () async {
                                                        if (index == 0) {
                                                          tarifController
                                                                  .additionalFeatures[0] =
                                                              TarifPurchaseModel(
                                                                  quantity: 0,
                                                                  totalamount:
                                                                      0,
                                                                  product: '',
                                                                  price: '');
                                                        } else {
                                                          tarifController
                                                                  .additionalFeatures[1] =
                                                              TarifPurchaseModel(
                                                                  quantity: 0,
                                                                  totalamount:
                                                                      0,
                                                                  product: '',
                                                                  price: '');
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      label:
                                                          const Text('Remove'))
                                                ],
                                              ),
                                              // Text(
                                              //     "Total price :${tarifController.extraFeatureTotalPrice}"),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const Divider();
                                        },
                                        itemCount: tarifController
                                            .additionalFeatures.length),
                              )),
                          Row(
                            children: [
                              const Spacer(),
                              GooglePoppinsWidgets(
                                color: Colors.white,
                                text: "Total  :  ₹ $totalpayment ",
                                fontsize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          GooglePoppinsWidgets(
                            color: Colors.white,
                            text: "Total Price Including GST  :  ₹ $gst ",
                            fontsize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      );
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> selectcount(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('productName'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 400,
                  width: 400,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("DujoAditionalFeatures")
                          .snapshots(),
                      builder: (context, snapss) {
                        int addfeature1Price = 0;
                        int addfeature2Price = 0;
                        if (snapss.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      GooglePoppinsWidgets(
                                        text:
                                            "${snapss.data?.docs[index]['deviceName'] ?? ''}",
                                        fontsize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      TextButton.icon(
                                          onPressed: () async {
                                            // final pricedata = int.parse(snapss
                                            //     .data?.docs[index]['price']);
                                            //     tarifController.additionalFeatures.add(snapss
                                            //     .data?.docs[index]['deviceName']);
                                            // if (index == 0) {
                                            //   TarifdetailSaver.index0 =
                                            //       pricedata *
                                            //           tarifController
                                            //               .counnterIndex.value;
                                            //   log('index  = 0 ${TarifdetailSaver.index0.toString()}');
                                            // } else {
                                            //   TarifdetailSaver.index1 =
                                            //       pricedata *
                                            //           tarifController
                                            //               .counnterIndex1.value;
                                            //   log('index  = 1 ${TarifdetailSaver.index1.toString()}');
                                            // }
                                            getclickonAdd(
                                                context,
                                                snapss.data?.docs[index]
                                                    ['deviceName'],
                                                snapss.data?.docs[index]
                                                    ['price'],
                                                index);
                                          },
                                          icon: const Icon(Icons.add),
                                          label: const Text("Add"))
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: snapss.data!.docs.length);
                        } else {
                          return Center(
                            child: circularProgressIndicator,
                          );
                        }
                      }),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                // tarifController
                //     .additionalFeatures
                //     .add(snapss
                //         .data
                //         ?.docs[index]['deviceName']);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getclickonAdd(BuildContext context, String productName,
      String productPrice, int index) async {
    int price = int.parse(productPrice);
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(productName),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(productName),
                Row(
                  children: [
                    const Text('Select quantity :: '),
                    IconButton(
                        onPressed: () async {
                          final pricedata = int.parse(productPrice);

                          if (index == 0) {
                            if (tarifController.counnterIndex.value > 1) {
                              tarifController.counnterIndex - 1;
                              tarifController.extraFeature1Total.value =
                                  pricedata *
                                      tarifController.counnterIndex.value;
                              // tarifController.extraFeatureTotalPrice.value =
                              //     price -
                              //         tarifController.extraFeature1Total.value;
                            }
                          } else {
                            if (tarifController.counnterIndex1.value > 1) {
                              tarifController.counnterIndex1 - 1;
                              tarifController.extraFeature2Total.value =
                                  pricedata *
                                      tarifController.counnterIndex1.value;
                              // tarifController.extraFeatureTotalPrice.value =
                              //     price -
                              //         tarifController.extraFeature2Total.value;
                            }
                          }
                        },
                        icon: const Icon(Icons.remove)),
                    ////
                    index == 0
                        ? Obx(
                            () => Text(
                              tarifController.counnterIndex.value.toString(),
                            ),
                          )
                        : Obx(
                            () => Text(
                              tarifController.counnterIndex1.value.toString(),
                            ),
                          ),

                    /////
                    IconButton(
                        onPressed: () async {
                          final pricedata = int.parse(productPrice);
                          if (index == 0) {
                            tarifController.counnterIndex + 1;
                            tarifController.extraFeature1Total.value =
                                pricedata * tarifController.counnterIndex.value;
                          } else {
                            tarifController.counnterIndex1 + 1;
                            tarifController.extraFeature2Total.value =
                                pricedata *
                                    tarifController.counnterIndex1.value;
                            // final result =  tarifController.additionalFeatures.forEach((element) {element.price. });
                            // log(result);
                          }
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
                Obx(() {
                  log("Total Price Gps :: ${tarifController.extraFeature1Total.value}");
                  log("Total Price Bio :: ${tarifController.extraFeature2Total.value}");
                  return SizedBox(
                      height: 50,
                      child: index == 0
                          ? Text(
                              "Total Price :: ${tarifController.extraFeature1Total.value}")
                          : Text(
                              "Total Price :: ${tarifController.extraFeature2Total.value}"));
                }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok to conform'),
              onPressed: () {
                if (index == 0) {
                  // tarifController.additionalFeatures.clear();
                  TarifPurchaseModel tarifPurchaseModelindex0 =
                      TarifPurchaseModel(
                          quantity: tarifController.counnterIndex.value,
                          totalamount: tarifController.extraFeature1Total.value,
                          product: productName,
                          price: tarifController.extraFeature1Total.toString());
                  tarifController.additionalFeatures[0] =
                      tarifPurchaseModelindex0;

                  // tarifController.extraFeatureTotalPrice.value =
                  //     price + tarifController.extraFeatureTotalPrice.value;
                  // log('price ${price.toString()}');
                  // log('getxprice ${tarifController.extraFeatureTotalPrice.value.toString()}');
                }
                // else if (index == 0 && index == 1) {
                //   TarifPurchaseModel tarifPurchaseModelindex0 =
                //       TarifPurchaseModel(
                //           quantity: tarifController.counnterIndex.value,
                //           totalamount: tarifController.extraFeature1Total.value,
                //           product: productName,
                //           price: productPrice);
                //   TarifPurchaseModel tarifPurchaseModelindex1 =
                //       TarifPurchaseModel(
                //           quantity: tarifController.counnterIndex1.value,
                //           totalamount: tarifController.extraFeature2Total.value,
                //           product: productName,
                //           price: productPrice);
                //   tarifController.additionalFeatures.insertAll(index,
                //       [tarifPurchaseModelindex0, tarifPurchaseModelindex1]);
                //   // tarifController.extraFeatureTotalPrice.value =
                //   //     price + tarifController.extraFeatureTotalPrice.value;
                // }
                else if (index == 1) {
                  // tarifController.additionalFeatures.clear();
                  TarifPurchaseModel tarifPurchaseModelindex1 =
                      TarifPurchaseModel(
                          quantity: tarifController.counnterIndex1.value,
                          totalamount: tarifController.extraFeature2Total.value,
                          product: productName,
                          price: tarifController.extraFeature2Total.toString());
                  tarifController.additionalFeatures[1] =
                      tarifPurchaseModelindex1;
                  // tarifController.extraFeatureTotalPrice.value =
                  //     price + tarifController.extraFeatureTotalPrice.value;
                }
                //final data = TarifPurchaseModel.fromJson(tarifController.additionalFeatures[index])
                // log('priceeeeeee${tarifController.extraFeatureTotalPrice.value}');
                // log('List model${tarifController.additionalFeatures.toString()}');
              },
            ),
          ],
        );
      },
    );
  }
}
