
import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GenrateTC extends StatelessWidget {
  String sno;
  String regNo;
  String parentName;
  String studentName;
  String schoolName;
  String schoolPlace;

  GenrateTC(
      {required this.sno,
      required this.regNo,
      required this.parentName,
      required this.studentName,
      required this.schoolName,
      required this.schoolPlace,
      super.key});

  @override
  Widget build(BuildContext context) {
    nextpage(           sno,
   regNo,
   parentName,
   studentName,
   schoolName,
   schoolPlace,);
    var screenSize = MediaQuery.of(context).size;
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

nextpage(
    String sno,
  String regNo,
  String parentName,
  String studentName,
  String schoolName,
  String schoolPlace,
) async {
  await Future.delayed(const Duration(seconds: 1));
  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) {
      return buildPdf(format,
           sno,
   regNo,
   parentName,
   studentName,
   schoolName,
   schoolPlace,
      );
    },
  );
}

Future<Uint8List> buildPdf(PdfPageFormat format,
  String sno,
  String regNo,
  String parentName,
  String studentName,
  String schoolName,
  String schoolPlace,
 ) async {
  final pw.Document doc = pw.Document();

  doc.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Center(
                  child: pw.Container(
                      decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 5, color: PdfColors.blue),
                          color: PdfColors.white),
                      width: 700,
                      height: 700,
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Center(
                                child: pw.Container(
                                    width: 450,
                                    height: 670,
                                    decoration: pw.BoxDecoration(
                                        border: pw.Border.all(
                                            width: 5, color: PdfColors.grey),
                                        color: PdfColors.white),
                                    child: pw.Column(children: [
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            pw.Padding(
                                              padding:
                                                  const pw.EdgeInsets.only(top: 10),
                                              child: pw.Text(
                                               schoolName ,
                                                style: pw.TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              ),
                                            ),
                                          ]),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            pw.Text(
                                              schoolPlace,
                                              style: const pw.TextStyle(fontSize: 15),
                                            ),
                                          ]),
                                      pw.SizedBox(height: 40),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Container(
                                                width: 300,
                                                height: 50,
                                                decoration: pw.BoxDecoration(
                                                  borderRadius:
                                                      pw.BorderRadius.circular(
                                                          10),
                                                  color: PdfColors.blue,
                                                ),
                                                child: pw.Center(
                                                  child: pw.Text(
                                                    'School Leaving Certificate',
                                                    style: const pw.TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ))
                                          ]),
                                      pw.SizedBox(
                                        height: 30,
                                      ),
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.only(right: 30),
                                        child: pw.Row(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.end,
                                            children: [
                                              pw.Text(
                                                'S.No.',
                                                style:
                                                    const pw.TextStyle(fontSize: 14),
                                              ),
                                              pw.SizedBox(
                                                width: 10,
                                              ),
                                              pw.Container(
                                                  width: 50,
                                                  child: pw.Text(sno)),
                                            ]),
                                      ),
                                      pw.SizedBox(
                                        height: 10,
                                      ),
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.only(right: 30),
                                        child: pw.Row(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.end,
                                            children: [
                                              pw.Text(
                                                'Reg.No.',
                                                style:
                                                    const pw.TextStyle(fontSize: 14),
                                              ),
                                              pw.SizedBox(
                                                width: 10,
                                              ),
                                              pw.Container(
                                                  width: 50,
                                                  child:pw.Text(regNo)),
                                            ]),
                                      ),
                                      pw.SizedBox(
                                        height: 30,
                                      ),
                                      pw.Padding(
                                          padding: const pw.EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: pw.Column(
                                              // mainAxisAlignment: pw.MainAxisAlignment.start,
                                              children: [
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(children: [
                                                    pw.Text(
                                                        "THIS IS TO CERTIFY THAT MR./MISS"),
                                                    pw.SizedBox(
                                                      width: 10,
                                                    ),
                                                    pw.Container(
                                                        width: 180,
                                                        child: pw.Text(studentName)),
                                                  ]),
                                                ),
                                                pw.SizedBox(
                                                  height: 10,
                                                ),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(children: [
                                                    pw.Text(
                                                        "SON/DAUGHTER OF MR"),
                                                    pw.SizedBox(
                                                      width: 10,
                                                    ),
                                                    pw.Container(
                                                        width: 170,
                                                        child: pw.Text(parentName)),
                                                    pw.SizedBox(width: 10),
                                                    pw.Text("RESIDING IN"),
                                                    pw.SizedBox(
                                                      width: 10,
                                                    ),
                                                  ]),
                                                ),
                                                pw.SizedBox(height: 10),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(children: [
                                                    pw.Container(
                                                        width: 80,
                                                        child: pw.Divider()),
                                                    pw.SizedBox(width: 10),
                                                    pw.Text(
                                                        "WAS A BONAFIDE STUDENT OF THIS SCHOOL.HE/SHE"),
                                                    pw.SizedBox(height: 10),
                                                  ]),
                                                ),
                                                pw.SizedBox(height: 10),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(
                                                            "PASSED THE SSLC EXAMINATION HELD IN THE YEAR"),
                                                        pw.Container(
                                                            width: 90,
                                                            child:
                                                                pw.Divider()),
                                                      ]),
                                                ),
                                                pw.SizedBox(height: 10),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(children: [
                                                    pw.Text(
                                                        "AND WAS PLACED IN THE"),
                                                    pw.SizedBox(width: 10),
                                                    pw.Container(
                                                        width: 80,
                                                        child: pw.Divider()),
                                                    pw.SizedBox(width: 10),
                                                    pw.Text(
                                                        "DIVISION. HE/SHE BEARS A"),
                                                  ]),
                                                ),
                                                pw.SizedBox(height: 10),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(children: [
                                                    pw.Container(
                                                        width: 100,
                                                        child: pw.Divider()),
                                                    pw.SizedBox(width: 10),
                                                    pw.Text(
                                                        "MORAL CHARACTER.I WISH HIM/HER ALL SUCCESS. "),
                                                  ]),
                                                ),
                                                pw.SizedBox(height: 10),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(children: [
                                                    pw.Text(
                                                        "HIS/HER DATE OF BIRTH ACCORDING TO OUR SCHOOL RECORD IS "),
                                                  ]),
                                                ),
                                                pw.SizedBox(height: 10),
                                                pw.Padding(
                                                  padding: const pw.EdgeInsets.only(
                                                      right: 10, left: 10),
                                                  child: pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text("B.S"),
                                                        pw.SizedBox(width: 10),
                                                        pw.Container(
                                                            width: 80,
                                                            child:
                                                                pw.Divider()),
                                                        pw.SizedBox(width: 10),
                                                      ]),
                                                ),
                                                pw.SizedBox(height: 70),
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      pw.Column(
                                                        children: [
                                                          pw.Container(
                                                              width: 60,
                                                              child:
                                                                  pw.Divider()),
                                                          pw.SizedBox(
                                                              height: 10),
                                                          pw.Text(
                                                              "DATE OF ISSUE")
                                                        ],
                                                      ),
                                                      pw.SizedBox(width: 20),
                                                      pw.Column(
                                                        children: [
                                                          pw.Container(
                                                              width: 60,
                                                              child:
                                                                  pw.Divider()),
                                                          pw.SizedBox(
                                                              height: 10),
                                                          pw.Text("CLERK")
                                                        ],
                                                      ),
                                                      pw.SizedBox(width: 20),
                                                      pw.Column(
                                                        children: [
                                                          pw.Container(
                                                              width: 60,
                                                              child:
                                                                  pw.Divider()),
                                                          pw.SizedBox(
                                                              height: 10),
                                                          pw.Text("HEAD MASTER")
                                                        ],
                                                      ),
                                                      pw.SizedBox(width: 20),
                                                    ])
                                              ]))
                                    ])))
                          ])))
            ]);
      },
    ),
  );
  return await doc.save();
}
