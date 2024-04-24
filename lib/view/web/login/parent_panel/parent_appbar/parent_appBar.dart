// import 'package:dash_board/view/colors/colors.dart';
// import 'package:dash_board/view/fonts/google_poppins.dart';
// import 'package:dash_board/view/fonts/text_widget.dart';
// import 'package:dash_board/view/pages/home/users_panel/admin_panel/admin_appBar/web_hover_dilogues/admin_profile_Box.dart';
// import 'package:dash_board/view/pages/home/users_panel/admin_panel/admin_appBar/web_hover_dilogues/mail_show_dil_Box.dart';
// import 'package:dash_board/view/pages/home/users_panel/admin_panel/admin_appBar/web_hover_dilogues/notification_show_dil_Box.dart';
// import 'package:dash_board/view/widgets/responsive/responsive.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';

class AppBarParentPanel extends StatefulWidget {
  const AppBarParentPanel({
    super.key,
  });

  @override
  State<AppBarParentPanel> createState() => _AppBarParentPanelState();
}

class _AppBarParentPanelState extends State<AppBarParentPanel> {
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  OverlayEntry? overlayEntry2;
  OverlayEntry? overlayEntry3;
  bool showOverlay = false;
  int index = 0;
  final layerLink = LayerLink();
  final textButtonFocusNode = FocusNode();
  final textButtonFocusNode1 = FocusNode();
  final textButtonFocusNode2 = FocusNode();

  @override
  void initState() {
    textButtonFocusNode.addListener(() {
      if (textButtonFocusNode.hasFocus) {
        _showOverlay(context, 0);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode1.addListener(() {
      if (textButtonFocusNode1.hasFocus) {
        _showOverlay(context, 1);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode2.addListener(() {
      if (textButtonFocusNode2.hasFocus) {
        _showOverlay(context, 2);
      } else {
        removeOverlay();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        color: Colors.white24,
        height: 70,
        width: double.infinity,
        child: Row(
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
                              style: TextStyle(
                                  color: cBlack.withOpacity(0.5),
                                  fontSize: 10.7),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          focusNode: textButtonFocusNode2,
                          onPressed: () {
                            // ResponsiveWebSite.isDesktop(context)
                            //     ? textButtonFocusNode2.requestFocus()
                            //     : appBarAdminBox(context);
                            // showOverlay = true;
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
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset(
                'assests/png/avathar.png',
                fit: BoxFit.cover,
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
                              // // if (val) {
                              // ResponsiveWebSite.isDesktop(context)
                              //     ? textButtonFocusNode.requestFocus()
                              //     : appBarMailBox(context);
                              // showOverlay = true;
                              // }
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
                            backgroundColor:
                                const Color.fromARGB(255, 42, 215, 197),
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
                              showOverlay = true;
                              //.................... Notification
                              // ResponsiveWebSite.isDesktop(context)
                              //     ? textButtonFocusNode1.requestFocus()
                              //     : appBarNotificationBox(context);
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
                            backgroundColor:
                                const Color.fromARGB(255, 255, 49, 49),
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 05),
            //   child: SizedBox(
            //     width: 86,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Row(
            //           children: [
            //             const Icon(
            //               Icons.south_america,
            //               color: Colors.amber,
            //             ),
            //             GooglePoppinsWidgets(text: ' EN ', fontsize: 12),
            //             PopupMenuButton(
            //               icon: const Icon(
            //                 Icons.keyboard_arrow_down_rounded,
            //                 color: cBlack,
            //                 size: 17,
            //               ),
            //               itemBuilder: (BuildContext context) {
            //                 return <PopupMenuEntry>[
            //                   PopupMenuItem(
            //                       child: Column(
            //                     children: [
            //                       Container(
            //                         height: 400,
            //                         color: Colors.red,
            //                       ),
            //                     ],
            //                   ))
            //                 ];
            //               },
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
              style: TextStyle(
                  fontSize: 15, color: cWhite, fontWeight: FontWeight.w600),
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
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assests/png/avathar.png'),
                      ),
                    ),
                    const TextFontWidget(
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
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: const Row(
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
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: const Row(
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
                      text: 'Log Ouit',
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
  void _showOverlay(BuildContext context, int index) async {
    overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            right: index == 0
                ? 160
                : index == 2
                    ? 100
                    : 120,
            top: 60,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.unfocus();
                  }
                }
              },
              child: widgets[index],
            ),
          );
        });

    overlayEntry2 = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            right: index == 0
                ? 160
                : index == 2
                    ? 230
                    : 120,
            top: 60,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.unfocus();
                  }
                }
              },
              child: widgets[index + 3],
            ),
          );
        });

    overlayState!.insertAll([
      overlayEntry!,
      overlayEntry2!,
    ]);
  }

  void removeOverlay() {
    overlayEntry!.remove();
    overlayEntry2!.remove();
  }
}
