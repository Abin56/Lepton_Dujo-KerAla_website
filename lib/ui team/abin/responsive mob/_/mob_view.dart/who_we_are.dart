import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../view/colors/colors.dart';
import '../../../../../view/fonts/google_monstre.dart';
import '../../../../../view/web/widgets/Iconbackbutton.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, webSize) {
      return Scaffold(
        backgroundColor: adminePrimayColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: cWhite),
          backgroundColor: adminePrimayColor,
          // preferredSize: Size(double.infinity, 100),
          // child: Expanded(
          //   child: Container(
          //     color: Colors.amber.withOpacity(.5),
          //     height: 100,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: const [
          //         // IconButtonBackWidget(color: cWhite),
          //         Icon(Icons.arrow_back,
          //             color: Colors.black, size: 23, weight: 900),
          //         Spacer()
          //       ],
          //     ),
          //   ),
          // ),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          shrinkWrap: true,

          children: const [
            WhoWeAre_01(),
            // const SizedBox(height: 10),
            WhoWeAre_02(),
          ],
        ),
      );
    });
  }
}

class WhoWeAre_01 extends StatelessWidget {
  const WhoWeAre_01({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 50, right: 50, top: 80),
        child: SizedBox(
          // height: 250,
          width: double.infinity,
          // color: Colorshite,
          child: GoogleMonstserratWidgets(
              text:
                  "With a focus on IoT Solutions, Mobile Application Development and Software Development Lepton Plus Communications stands for high tech innovation and intelligence in digital transformation."
                  "We create a positive vision of where we want to head and actively bring about a sustainable change in the society through our products and services. We aim to be the most trusted and creative IT Solution Company."
                  "Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications, Home Automation and Social Networking. We are committed to providing high end sustainable products and services that enhances the quality of life.",
              fontsize: 18,
              letterSpacing: 3,
              color: cWhite),
        ),
      ),
    );
  }
}

class WhoWeAre_02 extends StatelessWidget {
  const WhoWeAre_02({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, top: 10),
      child: SizedBox(
          // height: 250,
          width: double.infinity,
          child: GoogleMonstserratWidgets(
            fontsize: 18,
            text:
                "Lepton  DuJo - the ultimate digitalized school infra app that streamlines infrastructure management and enhances school operations. With DuJo, schools can easily manage their facilities, assets, and resources with just a few clicks."
                "DuJo provides a comprehensive range of features to manage schools' infrastructure, including live updates of attendance, a list of classes, a list of teachers, and notices and events as notifications. DuJo also offers online payment facilities, with a bill generation option for easy payment processing."
                "DuJo also facilitates seamless learning through recorded and live classes. With student, parent, admin, teacher, and guardian logins, DuJo provides a customizable and secure platform for all stakeholders to manage and access information relevant to them."
                "Join us on this exciting journey towards a more streamlined and efficient school infrastructure management system with DuJo. Experience the convenience and flexibility of a digitalized school infra app that takes your school's operations to the next level.",
            color: cWhite,
            letterSpacing: 3,
          )),
    );
  }
}
