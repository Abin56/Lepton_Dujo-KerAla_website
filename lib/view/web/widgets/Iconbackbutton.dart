// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class IconButtonBackWidget extends StatelessWidget {
  Color? color;
  IconButtonBackWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back,
          color: color, size: MediaQuery.of(context).size.width * 0.01, weight: 900),
    );
  }
}

class IconDashButtonWidget extends StatelessWidget {
  Color? color;
  IconDashButtonWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.dashboard,
          color: color, size: MediaQuery.of(context).size.width * 0.01, weight: 900),
    );
  }
}

class IconLogOutButtonWidget extends StatelessWidget {
  Color? color;
  IconLogOutButtonWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.logout_outlined,
          color: color, size: MediaQuery.of(context).size.width * 0.01, weight: 900),
    );
  }
}
