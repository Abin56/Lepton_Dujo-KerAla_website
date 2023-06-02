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
  bool isChecked = false;
  bool showError = false;

  void _validateForm() {
    setState(() {
      showError = true;
    });

    if (isChecked) {
      // Checkbox is checked, perform necessary actions
      // e.g., save data, navigate to a new screen, etc.
      print('Checkbox is checked!');
    }
  }

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 660,
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
                        gst = d + (d) * 18 / 100;

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
                              text:
                                  "Price :  ${tarifController.price.value} INR",
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
                                                        label: const Text(
                                                            'Remove'))
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
                            GestureDetector(
                                onTap: () {
                                  showTermsandCondition(context);
                                },
                                child: const Text('view terms and conditions')),
                            CheckboxListTile(
                              title: const Text(
                                  'I agree to the terms and conditions'),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            if (showError && !isChecked)
                              const Text(
                                'Please agree to the terms and conditions',
                                style: TextStyle(color: Colors.red),
                              ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _validateForm,
                              child: const Text('Submit'),
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
                            }
                          } else {
                            if (tarifController.counnterIndex1.value > 1) {
                              tarifController.counnterIndex1 - 1;
                              tarifController.extraFeature2Total.value =
                                  pricedata *
                                      tarifController.counnterIndex1.value;
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
                  TarifPurchaseModel tarifPurchaseModelindex0 =
                      TarifPurchaseModel(
                          quantity: tarifController.counnterIndex.value,
                          totalamount: tarifController.extraFeature1Total.value,
                          product: productName,
                          price: tarifController.extraFeature1Total.toString());
                  tarifController.additionalFeatures[0] =
                      tarifPurchaseModelindex0;
                } else if (index == 1) {
                  TarifPurchaseModel tarifPurchaseModelindex1 =
                      TarifPurchaseModel(
                          quantity: tarifController.counnterIndex1.value,
                          totalamount: tarifController.extraFeature2Total.value,
                          product: productName,
                          price: tarifController.extraFeature2Total.toString());
                  tarifController.additionalFeatures[1] =
                      tarifPurchaseModelindex1;
                }
              },
            ),
          ],
        );
      },
    );
  }
}

showTermsandCondition(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return SizedBox(
        width: 300,
        child: AlertDialog(
          title: GooglePoppinsWidgets(
              text: 'Terms and Conditions',
              fontsize: 18,
              fontWeight: FontWeight.bold),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GooglePoppinsWidgets(
                  text: '''
      Terms &amp; Conditions
      
      1. Lepton DuJo - The School App, all of its forms, whether it be featured on any of DuJo
      mobile application or on the www.leptondujo.com online website services (“App”), is
      a product of Lepton Plus Communications (OPC) Private Ltd (“Lepton”).
      2. By using the Lepton DuJo - The School App services, you are agreeing to be bound
      by the following terms and conditions.
      3. Lepton reserves the right to update and change the terms and conditions that apply to
      all clients without notice. The updated terms and conditions will only be in effect
      once they are published on the Play Store/Apple Store. Continued use of the App after
      any such changes shall constitute your consent to such changes.
      
      4. The definition of “Client” used in this document pertains at all times to the
      organization that is the intended party requesting service from the App of Lepton.
      5. Any App offer made by Lepton is limited to the duration advertised or in the absence
      of such time or in the event of any error or omission shall be valid for 24 hours from
      when it first appeared unless Lepton in its sole discretion decides to change the extent
      or duration of any offer.
      6. Any reference to a sum charged by Lepton is in Indian Currency (INR) unless
      otherwise noted and is subject, where applicable, to the addition of the applicable
      Goods &amp; Services Tax (GST).
      7. The Client is responsible for maintaining the security of their online account and
      password.
      8. While entering into an Agreement to use the App or by using the App, the Client
      asserts itself to have the capacity to enter in to the Agreement. In the event that the
      right to enter the Agreement is shown to be non-existent, or a competing claim of
      right is proven to be stronger, Lepton reserves the right to remove the application
      from its systems, or alter the Agreement to be with the proper right holder instead. No
      refund will be issued.
      9. Lepton will use reasonable efforts to have the App approved by the Apple Store and
      Google Play app stores. Although there is generally a high likelihood of approval, we
      do not and cannot guarantee approval. If the app is continually denied by the app
      stores because the Client has not accepted App advice on what changes are required
      for the approval of the app in the app stores, the Client will not be entitled to a refund
      of the initial fees or any other charges incurred up to that point.
      10. It is understood and agreed by the Client that issues can occur and that in the event of
      any customer complaint or concern the Client shall refer it, or them, to App, either via
      
      App support or directly. This will not be a basis for voiding its obligation to pay for
      App or withholding payment.
      11. It is understood by the Client that the apps will operate on iPhone, iPads, Android
      Phones and Android Tablets (Compatible with Android 7 and beyond) if the complete
      package of these platforms is purchased from App.
      12. Lepton warrants that the App service shall be performed with reasonable care in a
      diligent and competent manner. To the fullest extent permitted by law, this clause is
      Lepton’s only warranty concerning the services and is made expressly in lieu of all
      other warranties and representations, express or implied, including warranties of
      merchantability, non-infringement or fitness for a particular purpose, or otherwise.
      13. Lepton may issue an update to the Client’s App which may add, modify and/or
      remove app features. These updates may be pushed out automatically without notice,
      although Lepton intends to notify the Client in advance of an upcoming update with
      details on what the update includes.
      14. Lepton warrants that the GPS and Biometric devices (“Hardware”) provided if any, is
      free from defects in materials and workmanship. The warranty period for provided
      hardware is a fixed period of one year commencing from the date of contracting.
      15. Lepton does not warrant and is not responsible for any products or services, including
      delivery of messages by carriers, on other networks or on other providers systems or
      infrastructure which is beyond the best efforts of Lepton, which it is accepted to have
      been made by Lepton on its own systems.
      16. Lepton does not warrant to any client the benefit of App or services that any client
      shall acquire from Lepton.
      17. The Client warrants that it has not relied on any representations in writing or
      otherwise by App or Lepton and that it is bound by these terms and conditions as a
      precondition of doing business with Lepton which it accepts by making any payment
      to Lepton or requests for its products or services.
      18. If the Client register for a trial use of services, access to services will be for the
      specified period of the trial free of charge until the end of the free trial period.
      19. Where Lepton should incur any additional charges for any in app purchases, Lepton
      will notify Client of any such charges as soon as practicable thereafter.
      20. The Payment Terms shall be governed by the Agreement made between the Client
      and Lepton prior to providing the services unless agreed otherwise.
      21. Lepton reserves the right to terminate the service for any reason by giving 30 days’
      notice to the client, including but not limited to the payment is not received within 7
      
      days of it being due. The decision to terminate shall be communicated to Client as
      soon as practicable. Further, in the event that the service is discontinued due to failure
      to pay, Lepton reserves the right to charge a reactivation fee if The Client requests
      that the service be reactivated and Lepton were to agree to reactivate it.
      22. In no event shall the total aggregate liability of Lepton extend 50% of the Annual fees
      received as part of the Agreement for providing services.
      23. Any internet domains, app development, app names or registrations in the Apple
      Store, Google Play Store or otherwise used in conjunction with the client’s app or
      phone numbers or other addresses that App establishes and maintains in the operation
      of the services remain the property of Lepton.
      24. Any app designs or app functions or recommendations or other intellectual property
      arising from this Agreement and/or the Services outlined herein continue to be held
      by Lepton.
      25. In the event of service termination, the Client agrees that Lepton has the right to
      destroy any customer data.
      26. All industrial and intellectual property rights in and relating to any inventions, patents,
      applications for patents, design applications, designs (whether registered or
      unregistered) all copyrights, (including copyright conferred by the Copyright Act
      1957 as amended from time to time, all trade or service marks (whether registered or
      unregistered), Confidential Information, integrated circuits, any rights that presently
      exist or may arise in the future anywhere in the world in respect of the services that
      the Client shall use belong to Lepton. The Client obtains no rights to this intellectual
      property though using the services of App.
      27. Where Client specifically uses or requests the use of material that may be protected
      under copyright laws, the Client agrees to indemnify Lepton for any infringement on
      such copyright.
      28. The Client indemnifies Lepton from and against all losses, any claim, demand, action,
      suit or proceeding that may be bought by any person against them or their employees
      or agents or any of them in respect of personal injury to or the death of any person
      whatsoever or loss of or damage to any property or any other loss or damage
      whatsoever arising out of or as a consequence of an unlawful act or negligent act or
      omission by the Client, or by their use of their account, and also from any costs and
      expenses that may be incurred with any such claim, demand, action suit or proceeding
      29. The Client agrees to comply with all applicable laws and regulations when using
      Lepton’s services.
      30. The Client is to provide its own hardware and internet connections required to use the
      service and are solely responsible for all costs and fees associated with that usage.
      
      31. Lepton is permitted to assign or license its associated services to any third party
      without the prior consent or notification to the Client.
      32. The Client does not have an exclusive right to use or distribute the service in any
      industry or territory and nothing in this agreement or relationship shall give rise to
      access to the source code or intellectual property of App.
      33. Lepton will not accept responsibility for any server down time, server delayed
      response time, network issues, or any other issues caused by interruption or
      intermittent issues of the underlying hosting service provider.
      34. The Client must not hack the App service or modify another website so as to falsely
      imply that it is associated with App or Lepton.
      35. Lepton expressly makes NO claim or representation that:
      a. will be relied upon or warranty that the App service is or will be error free or that
      the information or the apps it supplies will be timely, uninterrupted or secure in part
      or whole during service provision;
      b. oral or written advice afforded by App in any way create any warranty or
      representation under any circumstance.
      36. Lepton will not under any circumstances accept liability for any damages or losses
      occurring be they direct, indirect, incidental, identifiable, special or consequential
      arising from not being able to use or fully use the App servers or apps or arising from
      any mistake, omission, interruption, deletion to data or loss of data or virus or
      howsoever occurring which affects the performance or availability of the app or being
      able to transact via the app.
      37. Lepton will not accept liability for any damages for loss of business or loss of profits
      arising from breach of this agreement or breach of any stated or perceived warranty
      and such exclusion of liability is to be read and understood as applying directly or
      indirectly with any party obtaining services of the App platform. Such exclusion of
      liability by Lepton shall apply whether it otherwise would arise pursuant to contract
      or tort or construed as arising from this agreement. The exclusion of liability shall
      survive any termination of this Agreement for any reason.
      38. Force Majeure shall apply to this relationship between Lepton and the party receiving
      or seeking to receive App services. Accordingly, it is agreed that if by reason of
      failures of servers, telecommunications or internet service providers, failures of
      mobile operating systems, labour disputes, riots, inability to obtain labour or
      materials, earthquake, fire or other action of the elements, accidents, governmental
      restrictions or other causes beyond the control of Lepton it is unable to perform in
      whole or in part its obligations as set forth in this Agreement, then Lepton shall be
      
      relieved of those obligations to the extent it is so unable to perform its services and
      shall not make Lepton liable to any affected party.
      39. This Agreement is governed by the laws of the Union of India and the state of Kerala,
      without reference to rules governing choice of laws. If any dispute arises concerning
      this Agreement, venue shall be laid exclusively under the jurisdiction of Hon’ble High
      Court of Kerala which shall have exclusive jurisdiction over such dispute and the
      Parties consent to the personal jurisdiction of such courts.
      40. In the event that any provisions of this Agreement shall be held to be invalid or
      unenforceable for any reason, the remaining provisions shall continue to be valid and
      enforceable. If a court finds that any provision of this Agreement is invalid or
      unenforceable, but that by limiting such provision it would become valid or
      enforceable, then such provision will be deemed to be written, construed and enforced
      as so limited.
      41. It is agreed between the parties that the terms of this Agreement apply to those
      obligations that survive any cancellation, termination, or rescission which shall
      include all rights and obligations following termination and or assignment, terms
      pursuant to liability and limits as stated, indemnification and warranty as well as the
      right of not facilitating services at the discretion of Lepton without being required to
      give reason for same.
      42. In the event that Lepton were to delay any right of action arising pursuant to these
      terms and conditions, any updated changes to these terms and conditions or arising
      from its contractual rights or in tort it shall not give rise to any waiver by Lepton to
      seek protection and enforcement of such rights.
      43. EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE SERVICES
      TO BE PURCHASED UNDER THIS AGREEMENT ARE FURNISHED AS IS,
      WHERE IS, WITH ALL FAULTS AND WITHOUT WARRANTY OF ANY KIND,
      EXPRESS OR IMPLIED, INCLUDING ANY WARRANTY OF
      MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE.
      ''',
                  fontsize: 12,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                )
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
        ),
      );
    },
  );
}
