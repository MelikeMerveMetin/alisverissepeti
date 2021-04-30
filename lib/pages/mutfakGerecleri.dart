import 'package:alisverissepeti/functions/listeolusturma.dart';
import 'package:alisverissepeti/urunListeleri.dart';
import 'package:flutter/material.dart';

class mutfakgerecleri extends StatefulWidget {
  final kategori;

  const mutfakgerecleri({Key key, @required this.kategori}) : super(key: key);

  @override
  _mutfakgerecleriState createState() => _mutfakgerecleriState();
}

class _mutfakgerecleriState extends State<mutfakgerecleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text(widget.kategori)),
      body: buildList(mutfakUrunleri),
    );
  }
}
