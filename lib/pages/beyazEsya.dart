import 'package:alisverissepeti/functions/listeolusturma.dart';
import 'package:alisverissepeti/urunListeleri.dart';
import 'package:flutter/material.dart';

class beyazesya extends StatefulWidget {
  final kategori;

  const beyazesya({Key key, @required this.kategori}) : super(key: key);

  @override
  _beyazesyaState createState() => _beyazesyaState();
}

class _beyazesyaState extends State<beyazesya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.kategori),
      ),
      body: buildList(beyazEsyaUrunleri),
    );
  }
}
