import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../constant/layout_builder_class.dart';
import '../../constant/responsive_app.dart';

class HostelComplaintListPage extends StatelessWidget {
  const HostelComplaintListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobileBuilder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Complaint"),
            backgroundColor: adminePrimayColor,
          ),
          body: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(25),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const ListTile(
                        leading: ComplaintTextWidget(
                          value: 'Date',
                          fontWeight: FontWeight.bold,
                        ),
                        title: Center(
                            child: ComplaintTextWidget(
                          value: 'Title',
                          fontWeight: FontWeight.bold,
                        )),
                        trailing: ComplaintTextWidget(
                          value: 'Student Name',
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return ListTile(
                      leading: const ComplaintTextWidget(
                          value: "dsfsdfdsfadfdsfdsfdsfsdfta"),
                      title: const Center(
                          child: ComplaintTextWidget(
                              value: "ddfdsfdsfdsfdsfsdfata")),
                      trailing: const ComplaintTextWidget(
                          value: "dadsfsdfdsfdsfdsdsdsfdfta"),
                      onTap: () {
                        hostelComplaintDialogue(context);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              ),
            ],
          ),
        );
      },
      webBuilder: (context) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: adminePrimayColor,
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: Text(
                                "Hostel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveApp.width * .04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: Text(
                                "Complaints",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveApp.width * .04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(25),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const ListTile(
                        leading: ComplaintTextWidget(
                          value: 'Date',
                          fontWeight: FontWeight.bold,
                        ),
                        title: Center(
                            child: ComplaintTextWidget(
                          value: 'Title',
                          fontWeight: FontWeight.bold,
                        )),
                        trailing: ComplaintTextWidget(
                          value: 'Student Name',
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return ListTile(
                      leading: const ComplaintTextWidget(value: "data"),
                      title: const Center(
                          child: ComplaintTextWidget(value: "data")),
                      trailing: const ComplaintTextWidget(value: "data"),
                      onTap: () {
                        hostelComplaintDialogue(context);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
}

class ComplaintTextWidget extends StatelessWidget {
  const ComplaintTextWidget({super.key, required this.value, this.fontWeight});
  final String value;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveApp.width * .1,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
