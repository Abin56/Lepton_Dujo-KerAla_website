import 'package:flutter/material.dart';

import '../../../../constant/responsive_app.dart';

Future<dynamic> hostelComplaintDialogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      content: SizedBox(
        height: ResponsiveApp.height / 2,
        width: ResponsiveApp.width / 2,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Complaint Details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "Coamaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaakjdhsfashdfklhsfkhaskdfhksdhfkljshdfhyefirywehfrkshdfkhsadfkhsfiuywioefrkj;ljl;akjdsflaksdhfkasdhfkljhdklcmnaksfhkshfkshfkadshfkjhfkhjsjuoiuejskjfsjdfl;adjsfasfjjcc,asdfkajsfkl;jasfadsfl;ajsfl;kdjsafkl;jl;adjsfl;dfadsjkfldksjf;palaint Detail"),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {},
                  child: const Text("Mark as solved")),
            )
          ],
        ),
      ),
    ),
  );
}
