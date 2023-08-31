import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeShowUpdateButtonWidget extends StatelessWidget {
  const NoticeShowUpdateButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {},
            child: Text(
              'Update sign'.tr,
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {},
            child: Text(
              'Update image'.tr,
            ),
          ),
        ),
      ],
    );
  }
}
