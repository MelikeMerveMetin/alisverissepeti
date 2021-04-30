import 'package:alisverissepeti/functions/listeolusturma.dart';
import 'package:alisverissepeti/urunListeleri.dart';
import 'package:flutter/material.dart';

class evtekstil extends StatefulWidget {
  final kategori;

  const evtekstil({Key key, @required this.kategori}) : super(key: key);

  @override
  _evtekstilState createState() => _evtekstilState();
}

class _evtekstilState extends State<evtekstil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text(widget.kategori)),
      body: buildList(evTekstilUrunleri),
    );
  }
}
