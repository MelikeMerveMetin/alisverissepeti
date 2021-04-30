import 'package:flutter/material.dart';

class hakkindaPage extends StatefulWidget {
  @override
  hakkindaPageState createState() => hakkindaPageState();
}

class hakkindaPageState extends State<hakkindaPage> {
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
          child: Text(
            "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen"
            " 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 183301021 numaralı Melike Merve METİN "
            "tarafından 30 Nisan 2021 günü yapılmıştır.",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
