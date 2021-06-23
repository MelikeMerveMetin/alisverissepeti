import 'package:alisverissepeti/pages/hakkindaPage.dart';
import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';

orderPdfView(context, String hakkinda) async {
  final Document pdf = Document();
  pdf.addPage(Page(
      orientation: PageOrientation.natural,
      build: (context) => Column(
            children: [
              Text("HAKKINDA", style: TextStyle(fontSize: 32)),
              Text(hakkinda, style: TextStyle(fontSize: 32))
            ],
          )));
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/urun.pdf';
  final File file = File(path);
  await file.writeAsBytes((await pdf.save()));

  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewer(path: path),
    ),
  );
  print(path);
}
