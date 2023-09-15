// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';

import '../../../../../../ui team/abin/responsive mob/_/cancellation.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 300,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Address',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GooglePoppinsWidgets(
                      text: address[index],
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: address.length),
            ),
          )
        ],
      ),
    );
  }
}

class LegalWidget extends StatelessWidget {
  const LegalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 250,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Legal',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => legal[index].siteLink()))),
                      child: GooglePoppinsWidgets(
                        text: legal[index].label,
                        fontsize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: legal.length),
            ),
          )
        ],
      ),
    );
  }
}

class ConnecWidget extends StatelessWidget {
  const ConnecWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 250,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Connect',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  connect[index].siteLink()))),
                      child: GooglePoppinsWidgets(
                        text: connect[index].label,
                        fontsize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: connect.length),
            ),
          )
        ],
      ),
    );
  }
}

class WhoWeAreWidget extends StatelessWidget {
  const WhoWeAreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'COSTECH DUJO',
            fontsize: 21,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      // onTap: constechDUjo[index].siteLink,

                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  constechDUjo[index].siteLink()))),

                      child: GooglePoppinsWidgets(
                        text: constechDUjo[index].label,
                        fontsize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: constechDUjo.length),
            ),
          )
        ],
      ),
    );
  }
}

class LinkStringModel {
  final String label;
  final Function() siteLink;
  LinkStringModel({
    required this.label,
    required this.siteLink,
  });
}

//
// this is by Rajesh Thanu

List<LinkStringModel> constechDUjo = [
  LinkStringModel(label: 'Who We Are', siteLink: () {}),
  LinkStringModel(label: 'Why choose us', siteLink: () {})
];
List<LinkStringModel> connect = [
  LinkStringModel(label: 'Facebook', siteLink: () {}),
  LinkStringModel(label: 'Instagram', siteLink: () {}),
  LinkStringModel(label: 'Twitter', siteLink: () {}),
  LinkStringModel(label: 'Youtube', siteLink: () {}),
];
List<LinkStringModel> legal = [
  LinkStringModel(label: 'Terms & Conditions', siteLink: () {}),
  LinkStringModel(label: 'Privacy Policy', siteLink: () {}),
  LinkStringModel(label: 'Family Policy', siteLink: () {}),
  LinkStringModel(
      label: 'Trademark Policy', siteLink: () => CancellationPolicy()),
  LinkStringModel(
      label: 'Refund and\nCancellation Policy',
      siteLink: () => CancellationPolicy()),
];

// below by edwinorginal
//

// List<String> constechDUjo = ['Who We Are', 'Why choose us'];
// List<String> connect = ['Facebook', 'Instagram', 'Twitter', 'Youtube'];
// List<String> legal = [
//   'Terms & Conditions',
//   'Privacy Policy',
//   'Family Policy',
//   'Trademark Policy',
//   'Refund and\nCancellation Policy'
// ];
List<String> address = [
  '📌 Lepton Plus Communications (OPC) Pvt.Ltd'
      '5 th Floor,Karimpanal Statue Avenue , G.H. Road '
      'Statue,Thiruvanathapuram - 695001,Kerala,India',
  '📞 +91 97469 66651 | +91 97463 66651 | +91 471 4053483',
  '✉️ info@leptoncommunications.com',
  '✉️ leptoncommunications@gmail.com'
];
