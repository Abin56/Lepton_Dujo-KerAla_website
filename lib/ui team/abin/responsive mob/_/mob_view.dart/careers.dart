import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Careers extends StatelessWidget {
  const Careers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminePrimayColor,
      body:ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBackWidget(color: cWhite,),
              Center(
                child: SizedBox(
                    height: 140.h,
                    width: 920.w,
                    // color: Colors.amber,
                    child:  GoogleMonstserratWidgets(text: "Are you a determined and friendly professional with an advanced"
                "understanding of human behavior and a desire to help consumers"
                "find exactly the right product or service to suit their needs? If so,"
                "you might be a great fit for our company. We’re a successful startup"
                "with room to grow and we’re looking for a self-starting Marketing"
                "Manager to oversee promotional events and improve client"
                "retention. The ideal candidate for this position has a positive"
                "attitude, a tireless work ethic and an insatiable appetite for growth." ,
                fontsize: 18.w,
                color: cWhite
                ),
                ),
              ),
              sizedBoxH20,
              Center(
                child: SizedBox(
                  height: 240.h,
                  width: 900.w,
                  // color: Colors.blue,
                  child:  GoogleMonstserratWidgets(text: "Lepton Communications\n\n"
                          
                "List of Vacancies\n"
                "1) Flutter Developer\n"
                "2)Marketing Professionals\n"
                "3)Customer Care Executive \n"
                "4) Accountant Cum Secretary\n"
                "5) IOT Engineers\n"
                "6) HR proficiency",fontsize: 18.w,color: cWhite),
                ),
              ),

              Center(
                child: SizedBox(
                  height: 380.h,
                  width: 900.w,
                  // color: Colors.blue,
                  child:GoogleMonstserratWidgets(text:"FLUTTER DEVELOPER\n\n"
              "1) State Management – Bloc, Getx Provider\n"
              "2) Git\n"
              "3) Firebase, Rest Api\n"
              "4) IOS\n"
              "5) Push Notification\n"
              "6) Experience with third – party and libraries\n"
              "7) Strong understanding of flutter frameworks\n"
              "8) DART Programming Language\n"
              "9) Mobile Application\n"
              "10) Architecture\n"
              "11) Fresher :- 1month training without salary , 3 month probation with 12000/month,increment after 1 year based on performance\n"
              "12) Prototype :- interview , 3 month 15000, increment after 3 month based on performance\n"
              "13) Exp :.- 1 – 3 year , 4lk – 6lk / annum\n"
              "14) Project manager :- 3+ yrs exp. , 6lk – 10 lk / annum",fontsize: 18.w,color: cWhite),
                ),
              ),
              sizedBoxH20,
              Center(
                child: SizedBox(
                  height: 300.h,
                  width: 900.w,
                  child:GoogleMonstserratWidgets(text: "MARKETING PROFESSIONALS\n\n"
              "1) Level of experience\n"
              "2) Amount of response\n"
              "3) Organizing and overseas advertising / communication compaigns (social media, TV ,etc), exhibitions and additional events\n"
              "4) Conducting marketing research and analysis to evaluate trends\n"
              "5) Brand awareness\n"
              "6) Completion ventures\n"
              "7) Excellent communications skills\n"
              "8) Team work skills\n"
              "9) Graduates from any degree\n"
              "10) 15000 + / month + allowance",fontsize: 18.w,color: cWhite),
                ),
              ),
              sizedBoxH20,
              Center(
                child: SizedBox(
                  height: 350.h,
                  width: 900.w,
                  child:GoogleMonstserratWidgets(text: "CUSTOMER CARE SERVICE\n\n"
              "1) Bachelor’s degree in business administration or related field\n"
              "2) Good knowledge of managing\n"
              "3) Team performance\n"
              "4) Exceptional Verbal\n"
              "5) Written communication skills\n"
              "6) Handle customer complaints\n"
              "7) Provide appropriate solution\n"
              "8) Alternatives within time limits\n"
              "9) Keep records of customer interaction\n"
              "10) Process customer accounts and file documents\n"
              "11) Follow communication procedures , guidelines and policies\n"
              "12) Able to engage customers\n"
              "13) 12000/month",fontsize: 18.w,color: cWhite),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 540.h,
                  width: 900.w,
                  child:GoogleMonstserratWidgets(text: "EMBEDDED SYSTEM ENGINEER\n\n"
              "1)Bachelor’s degree in computer engineering or science\n"
              "2) Practical Experience\n"
              "3) Knowledge on hardware and software debugging and architecture\n"
              "4) Exp. In working with consumer electronics or embedded system design\n"
              "5) Exp. In writing s/w C or C++\n"
              "6) Must be proficient in at least one programming lng or scripting lng\n"
              "7) Coding knowledge for debugging codes\n"
              "8) Integrate d/b changes\n"
              "9) Good to have Knowledge ADA,RUST,LUA,PYTHON,VERILOG and VHDL\n"
              "10) Should be familiar with ARDUINO,AMTEL AVR ,Raspberry Pi,ESP8266 node Mcu and PIC10FXX\n"
              "11) Familiarising yourself with PCB’s ,debugging, signal , Analysis\n"
              "12) Should be familiar with PCB design &amp; analysis design S/W\n"
              "13) Basic H/W design such as autoCAD\n"
              "14) Knowledge on IOT devices and frameworks ( AZURE,GOOGLE CLOUD PLATFORM , IBM WATSON , AWS\n"
              "15) Ability to process and analyse data using Excel , python and Matlab\n"
              "16) Technical writing – documentation\n"
              "17) Fresher :- 1 month training without salary ,3 month probation with 12000 / month,increment after 1year based on performance\n"
              "18) Experienced :- 1-3 year exp., 4 lk – 6lk/ annum\n",fontsize: 18.w,color: cWhite)
                ),
              ),
              Center(
                child: SizedBox(
                  height: 400.h,
                  width: 900.w,
                  child:GoogleMonstserratWidgets(text: "ACCOUNTANT CUM SECRETRAY\n\n"
              "1) Bachelor’s degree in finance / accounting / commerce\n"
              "2) Advanced MS word, Excel and power point Exp.\n"
              "3) Maintain billing system\n"
              "4) Generating invoice and account statement\n"
              "5) Performing account reconciliation and records\n"
              "6) Producing monthly financial and management reports\n"
              "7) Investigating and resolving any irregularities and enquiries\n"
              "8) Assisting in general financial management and analysis qualification\n"
              "9) Business studies or administration\n"
              "10) Strong knowledge in mathematics\n"
              "11) Ability to priorities and manages expectation\n"
              "12) Keen eye for details\n"
              "13) Ability to work independently\n"
              "14) Ability to communicate\n"
              "15) Fresher :- 0-1 year experience , 15000/ month",fontsize: 18.w,color: cWhite),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 160.h,
                  width: 900.w,
                  // color: Colors.amber,
                  child:GoogleMonstserratWidgets(text: "HR PROFICIENCY\n\n"
              "1) Minimum Graduation required in any field\n"
              "2) Or master’s degree in Human Resource, business administration or Labour Laws\n"
              "3) Ability to explore\n"
              "4) Find new ways to handle people and their concerns\n"
              "5) Fresher:- 12000/month \n",fontsize: 18.w,color: cWhite),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}