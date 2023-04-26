import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:dujo_kerala_website/view/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class StudentSummary extends StatefulWidget {
  const StudentSummary({super.key});

  @override
  State<StudentSummary> createState() => _StudentSummaryState();
}

class _StudentSummaryState extends State<StudentSummary> {
  @override
  Widget build(BuildContext context) {
 final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: adminePrimayColor,
      appBar: AppBar(
        title: Text('Student Summary'),backgroundColor: adminePrimayColor,

      ),
      body: 
      

      ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi Admin ',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text(
                    'Student Summery',
                    style: ralewayStyle.copyWith(
                      fontSize: 25.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(
                    height: size.width / 5,
                    width: size.width / 2,
                    child: LottieBuilder.network(
                        'https://assets2.lottiefiles.com/packages/lf20_p7ml1rhe.json'),
                  )
                  //       SizedBox(
                  // height: 400,
                  // width: 600,
                  // child: LottieBuilder.asset(
                  //     "assets/images/")),
                ],
              ),
            ),


             Padding(
              padding: EdgeInsets.only(left: size.width / 15),
              child: Container(
                height: size.height * 1 / 1,
                width: size.width * 1 / 3,
                child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                   onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AdminTeacherList(),
                  //       ));
                   },
                  child: Container(
                      height: size.width * 1 / 10,
                      width: size.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create Summary',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AdminTeacherList(),
                  //       ));
                  // },
                  child: Container(
                      height: size.width * 1 / 10,
                      width: size.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Edit Summary',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AdminTeacherList(),
                  //       ));
                  // },
                  child: Container(
                      height: size.width * 1 / 10,
                      width: size.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove Summary',
                        onTap: () {},
                      )
                      ),
                )
            
                    ),
                     ] ),
              ),
             ),
      ]),
      ])

     
);
}
}