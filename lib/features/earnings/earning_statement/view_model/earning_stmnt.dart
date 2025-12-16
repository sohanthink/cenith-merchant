import 'dart:io';
import 'package:flutter/services.dart'; // rootBundle
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class EarningStatement {
  final String storeName;
  final String date;
  final String description;
  final String amount;
  final String bookingId;

  EarningStatement({
    required this.storeName,
    required this.date,
    required this.description,
    required this.amount,
    required this.bookingId,
  });

  static final List<EarningStatement> demoEarningStatements = [
    EarningStatement(
      storeName: 'Sumaia Market',
      date: '28 Feb 2025',
      description: '2 Bags / 1 day',
      amount: '\$5.00',
      bookingId: 'LM2EB858',
    ),
    EarningStatement(
      storeName: 'Green Valley Store',
      date: '27 Feb 2025',
      description: '1 Bag / 1 day',
      amount: '\$2.50',
      bookingId: 'LM2EB859',
    ),
    EarningStatement(
      storeName: 'City Center Shop',
      date: '26 Feb 2025',
      description: '3 Bags / 2 days',
      amount: '\$9.00',
      bookingId: 'LM2EB860',
    ),
  ];

  /// Download PDF using asset font
  static Future<void> downloadEarningTablePdf() async {
    final pdf = pw.Document();

    // Load font from assets
    final catamaranData = await rootBundle.load(
      'assets/fonts/Catamaran-VariableFont_wght.ttf',
    );
    final catamaran = pw.Font.ttf(catamaranData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Earning Details',
                style: pw.TextStyle(
                  font: catamaran,
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        'Store and date',
                        style: pw.TextStyle(
                          font: catamaran,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        'Description',
                        style: pw.TextStyle(
                          font: catamaran,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        'Booking and account',
                        textAlign: pw.TextAlign.right,
                        style: pw.TextStyle(
                          font: catamaran,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.Divider(),
              pw.ListView.builder(
                itemCount: demoEarningStatements.length,
                itemBuilder: (context, index) {
                  final item = demoEarningStatements[index];
                  return pw.Column(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 8),
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Expanded(
                              flex: 2,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    item.storeName,
                                    style: pw.TextStyle(font: catamaran),
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text(
                                    item.date,
                                    style: pw.TextStyle(
                                      font: catamaran,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                item.description,
                                style: pw.TextStyle(font: catamaran),
                              ),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: [
                                  pw.Text(
                                    item.amount,
                                    style: pw.TextStyle(font: catamaran),
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text(
                                    item.bookingId,
                                    style: pw.TextStyle(
                                      font: catamaran,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Divider(),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/earning_details.pdf');
    await file.writeAsBytes(await pdf.save());
    print('PDF saved at: ${file.path}');
  }
}
