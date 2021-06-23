import 'package:flutter/material.dart';
import 'package:alisverissepeti/functions/listeolusturma.dart';
import 'package:alisverissepeti/urunListeleri.dart';

class teknoloji extends StatefulWidget {
  final kategori;

  const teknoloji({Key key, @required this.kategori}) : super(key: key);

  @override
  _teknolojiState createState() => _teknolojiState();
}

class _teknolojiState extends State<teknoloji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text(widget.kategori)),
      body: buildList(teknolojiUrunleri),
    );
  }
}
