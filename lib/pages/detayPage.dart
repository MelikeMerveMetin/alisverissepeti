import 'package:alisverissepeti/pages/sepetim.dart';
import 'package:flutter/material.dart';

class detayPage extends StatefulWidget {
  String urunadi;
  int urunfiyati;
  String fotograf;

  detayPage({this.urunadi, this.urunfiyati, this.fotograf});

  @override
  _detayPageState createState() => _detayPageState();
}

class _detayPageState extends State<detayPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple, title: Text("ÜRÜN İNCELEMESİ")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SingleChildScrollView(
          child: Container(
            width: 550,
            height: 550,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Image.asset(
                      widget.fotograf,
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      widget.urunadi,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    SizedBox(height: 10.0),
                    Text(widget.urunfiyati.toString() + " TL",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.purple)),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.purple,
                      child: Text("SEPETE EKLE",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sepetim()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
