import 'package:flutter/material.dart';

import '../../../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import 'notice_text_card_widget.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.adminNoticeModel,
  });
  final AdminNoticeModel adminNoticeModel;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: <DataColumn>[
          const DataColumn(
            label: NoticeTextWidget(title: 'Heading'),
          ),
          DataColumn(
            label: NoticeTextWidget(title: adminNoticeModel.heading ?? ""),
          ),
        ],
        rows: adminNoticeModel.customContent!
                .isNotEmpty //this for some notice have custom content so that time it will shows only one cell
            ? <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Custom Content'),
                    ),
                    DataCell(
                      NoticeTextWidget(
                          title: adminNoticeModel.customContent ?? ""),
                    ),
                  ],
                ),
              ]
            : <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Chief guest'),
                    ),
                    DataCell(
                      NoticeTextWidget(
                          title: adminNoticeModel.chiefGuest ?? ""),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Date Of submission'),
                    ),
                    DataCell(
                      NoticeTextWidget(
                          title: adminNoticeModel.dateOfSubmission ?? ""),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Date Of ocassion'),
                    ),
                    DataCell(
                      NoticeTextWidget(
                          title: adminNoticeModel.dateofoccation ?? ""),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Published date'),
                    ),
                    DataCell(
                      NoticeTextWidget(
                          title: adminNoticeModel.publishedDate ?? ""),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Signed by'),
                    ),
                    DataCell(
                      NoticeTextWidget(title: adminNoticeModel.signedBy ?? ""),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(
                      NoticeTextWidget(title: 'Venue'),
                    ),
                    DataCell(
                      NoticeTextWidget(title: adminNoticeModel.venue ?? ""),
                    ),
                  ],
                ),
              ]);
  }
}
