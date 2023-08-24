import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../constant/responsive_app.dart';
import 'widgets/complaint_listview_builder_completed.dart';
import 'widgets/complaint_listview_builder_uncompleted.dart';

class ComplaintListPage extends StatelessWidget {
  const ComplaintListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: adminePrimayColor,
          bottom: const TabBar(labelColor: Colors.white, tabs: <Tab>[
            Tab(
              icon: Icon(
                Icons.pending,
                color: Colors.white,
              ),
              text: 'Pending',
            ),
            Tab(
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
              text: 'Completed',
            ),
          ]),
        ),
        body: const TabBarView(children: <Widget>[
          ComplaintListPageBodyWidgetComplete(),
          ComplaintListPageBodyWidgetUnComplete(),
        ]),
      ),
    );
  }
}

class ComplaintListPageBodyWidgetComplete extends StatelessWidget {
  const ComplaintListPageBodyWidgetComplete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        ComplaintListViewBuilderUnCompleted(),
      ],
    );
  }
}

class ComplaintListPageBodyWidgetUnComplete extends StatelessWidget {
  const ComplaintListPageBodyWidgetUnComplete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        ComplaintListViewBuilderCompleted(),
      ],
    );
  }
}
