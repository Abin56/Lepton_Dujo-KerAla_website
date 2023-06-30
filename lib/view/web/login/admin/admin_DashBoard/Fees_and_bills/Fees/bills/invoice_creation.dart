import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

Future<void> createStudentBill(
    {required String studentName,
    required String studentId,
    required String invoiceNumber,
    required String date,
    required String category,
    required num amount}) async {
  final pdf = pw.Document();

  // Add a page to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            // Bill header
            pw.Text(
              'Receipt',
              style: pw.TextStyle(fontSize: 40, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),

            // Student details
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Student Name : ',
                      style: const pw.TextStyle(fontSize: 20)),
                  pw.Text(studentName, style: const pw.TextStyle(fontSize: 20)),
                ]),
            pw.SizedBox(height: 20),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Student ID : ',
                      style: const pw.TextStyle(fontSize: 20)),
                  pw.SizedBox(height: 10),
                  pw.Text(studentId, style: const pw.TextStyle(fontSize: 20)),
                ]),
            // Bill details
            pw.SizedBox(height: 20),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Receipt Number : ',
                      style: const pw.TextStyle(fontSize: 20)),
                  pw.SizedBox(height: 10),
                  pw.Text(invoiceNumber,
                      style: const pw.TextStyle(fontSize: 20)),
                ]),
            pw.SizedBox(height: 20),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Date : ', style: const pw.TextStyle(fontSize: 20)),
                  pw.SizedBox(height: 10),
                  pw.Text(date, style: const pw.TextStyle(fontSize: 20)),
                ]),

            pw.SizedBox(height: 20),

            // Bill items

            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Category : ',
                      style: const pw.TextStyle(fontSize: 20)),
                  pw.Text(category, style: const pw.TextStyle(fontSize: 20)),
                ]),

            // Bill total
            pw.SizedBox(height: 20),

            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Amount : ',
                      style: const pw.TextStyle(
                        fontSize: 20,
                      )),
                  pw.Text('$amount',
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold)),
                ]),
          ],
        );
      },
    ),
  );

  // Generate PDF bytes
  final Uint8List bytes = await pdf.save();

  // Create a download link for the PDF
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = ' ${studentName}_bill.pdf';
  html.document.body?.children.add(anchor);

  // Trigger the download
  anchor.click();

  // Clean up
  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);

  print('Student Bill PDF created successfully!');
}
