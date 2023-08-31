import 'package:flutter/material.dart';

import 'notice_text_card_widget.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.heading,
    required this.chiefGuest,
    required this.dateOfSubmission,
    required this.dateOfOccassion,
    required this.publishedDate,
    required this.signedBy,
    required this.venue,
  });
  final String heading;
  final String chiefGuest;
  final String dateOfSubmission;
  final String dateOfOccassion;
  final String publishedDate;
  final String signedBy;
  final String venue;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: <DataColumn>[
      const DataColumn(
        label: NoticeTextWidget(title: 'Heading'),
      ),
      DataColumn(
        label: NoticeTextWidget(title: heading),
      ),
    ], rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Chief guest'),
          ),
          DataCell(
            NoticeTextWidget(title: chiefGuest),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Date Of submission'),
          ),
          DataCell(
            NoticeTextWidget(title: dateOfSubmission),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Date Of ocassion'),
          ),
          DataCell(
            NoticeTextWidget(title: dateOfOccassion),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Published date'),
          ),
          DataCell(
            NoticeTextWidget(title: publishedDate),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Signed by'),
          ),
          DataCell(
            NoticeTextWidget(title: signedBy),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          const DataCell(
            NoticeTextWidget(title: 'Venue'),
          ),
          DataCell(
            NoticeTextWidget(title: venue),
          ),
        ],
      ),
    ]);
  }
}
