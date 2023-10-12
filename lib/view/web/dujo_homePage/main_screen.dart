import 'package:dujo_kerala_website/view/web/dujo_homePage/home/home.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../constant/responsive_app.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveApp.serMq(context);
    return const Scaffold(
      body: ResponsiveWebSite(
        mobile: HomeScreen(),
        tablet: HomeScreen(),
        desktop: HomeScreen(),
      ),
    );
  }
}
