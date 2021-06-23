import 'package:alisverissepeti/pages/full_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'full_pdf.dart';

class hakkindaPage extends StatefulWidget {
  @override
  hakkindaPageState createState() => hakkindaPageState();
}

class hakkindaPageState extends State<hakkindaPage> {
  String hakkinda =
      "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen"
      " 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 183301021 numaralı Melike Merve METİN "
      "tarafından 25 Haziran 2021 günü yapılmıştır.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Hakkında"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Text(
                hakkinda,
                style: TextStyle(fontSize: 20),
              ),
              RaisedButton(
                  elevation: 10,
                  color: Colors.purple,
                  child: Text("pdf"),
                  onPressed: () {
                    orderPdfView(context, hakkinda);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String path;

  PdfViewer({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}
