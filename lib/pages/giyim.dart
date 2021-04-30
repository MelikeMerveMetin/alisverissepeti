import 'package:alisverissepeti/functions/listeolusturma.dart';
import 'package:alisverissepeti/urunListeleri.dart';
import 'package:flutter/material.dart';

class giyim extends StatefulWidget {
  final kategori;

  const giyim({Key key, @required this.kategori}) : super(key: key);

  @override
  _giyimState createState() => _giyimState();
}

class _giyimState extends State<giyim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text(widget.kategori)),
      body: buildList(giyimUrunleri),
    );
  }
}
