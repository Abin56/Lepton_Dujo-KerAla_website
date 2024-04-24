import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';

// ignore: must_be_immutable
class AppBarStudentPanel extends StatelessWidget {
  AppBarStudentPanel({
    super.key,
  });

  final int index = 0;

  final layerLink = LayerLink();

  final textButtonFocusNode = FocusNode();

  final textButtonFocusNode1 = FocusNode();

  final textButtonFocusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        color: Colors.white24,
        height: ResponsiveWebSite.isMobile(context) ? 105 : 70,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Color.fromARGB(255, 61, 94, 225)),
                      child: const DrawerIcon(),
                    ),
                  ],
                ),
                const Spacer(),
                ////
                ///....
                ///
                ResponsiveWebSite.isMobile(context)
                    ? const SizedBox(
                        height: 0,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Container(
                                height: 45,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    // const TextFontWidget(text: '🗓️', fontsize: 12),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.calendar_month_outlined),
                                    ),
                                    TextFontWidget(
                                        text: '{UserCredentialsController.batchId}', fontsize: 12),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 34,
                                          width: 34,
                                          decoration: BoxDecoration(
                                              color: cWhite,
                                              borderRadius: BorderRadius.circular(20)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.settings_outlined,
                                              color: cBlack,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 109,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Stevne Zone',
                                style: TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  'Admin',
                                  style: TextStyle(color: cBlack.withOpacity(0.5), fontSize: 10.7),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              focusNode: textButtonFocusNode2,
                              onPressed: () {
                              //  showPopupMenu(context);
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 18,
                                color: cBlack,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                   // adminProfileshowlist(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20,
                    child: Image.asset(
                      'webassets/png/avathar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: IconButton(
                                focusNode: textButtonFocusNode,
                                onPressed: () {
                                //  messagesShowingFunction(context);
                                },
                                icon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: cBlack.withOpacity(0.4),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 07, left: 22),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12,
                              child: CircleAvatar(
                                backgroundColor: const Color.fromARGB(255, 42, 215, 197),
                                radius: 10,
                                child: GooglePoppinsWidgets(
                                  text: '5',
                                  fontsize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: cWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: IconButton(
                                focusNode: textButtonFocusNode1,
                                onPressed: () {
                                  //notificationShowingFunctionOnAppBar(context);
                                },
                                icon: Icon(
                                  Icons.notifications_none_outlined,
                                  color: cBlack.withOpacity(0.4),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 07, left: 22),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12,
                              child: CircleAvatar(
                                backgroundColor: const Color.fromARGB(255, 255, 49, 49),
                                radius: 10,
                                child: GooglePoppinsWidgets(
                                  text: '8',
                                  fontsize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: cWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ResponsiveWebSite.isMobile(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: Container(
                          height: 45,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              // const TextFontWidget(text: '🗓️', fontsize: 12),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.calendar_month_outlined),
                              ),
                              TextFontWidget(
                                  text: '{UserCredentialsController.batchId}', fontsize: 12),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    height: 34,
                                    width: 34,
                                    decoration: BoxDecoration(
                                        color: cWhite, borderRadius: BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.settings_outlined,
                                        color: cBlack,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    width: 0,
                  )
            /////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  List<Widget> widgets = [
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 42, 215, 197),
          width: 500,
          height: 40,
          child: const Center(
            child: Text(
              'All Messages',
              style: TextStyle(
                fontSize: 16,
                color: cWhite,
              ),
            ),
          ),
        ),
        Container(
          color: themeColorGreen.withOpacity(0.1),
          width: 500,
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 05,
                    ),
                    title: Text(
                      'Title',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Messages',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 20),
        ),
      ],
    ),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 49, 49),
          width: 400,
          height: 40,
          child: const Center(
            child: Text(
              'All Notifications',
              style: TextStyle(
                fontSize: 15,
                color: cWhite,
              ),
            ),
          ),
        ),
        Container(
          color: themeColorGreen.withOpacity(0.1),
          width: 400,
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 05,
                    ),
                    title: Text(
                      'Title',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Messages',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 20),
        ),
      ],
    ),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 160, 1),
          width: 200,
          height: 40,
          child: const Center(
            child: Text(
              'Steven Zone',
              style: TextStyle(fontSize: 15, color: cWhite, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('webassets/png/avathar.png'),
                      ),
                    ),
                   TextFontWidget(
                      text: 'Stevne Zone',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(border: Border.all(color: cBlack.withOpacity(0.4))),
                child:  Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 24,
                        color: cBlack,
                      ),
                    ),
                    TextFontWidget(
                      text: 'My Profile',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.power_settings_new,
                        size: 24,
                        color: cBlack,
                      ),
                    ),
                    TextFontWidget(
                      text: 'Log Out',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];
}
