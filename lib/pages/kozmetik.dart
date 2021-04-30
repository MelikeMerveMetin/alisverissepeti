import 'package:alisverissepeti/functions/listeolusturma.dart';
import 'package:alisverissepeti/urunListeleri.dart';
import 'package:flutter/material.dart';

class kozmetik extends StatefulWidget {
  final kategori;

  const kozmetik({Key key, @required this.kategori}) : super(key: key);

  @override
  _kozmetikState createState() => _kozmetikState();
}

class _kozmetikState extends State<kozmetik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text(widget.kategori)),
      body: buildList(kozmetikUrunleri),
    );
  }
}
