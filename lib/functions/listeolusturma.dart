import 'file:///D:/AndroidStudioProjeleri/alisverissepeti/lib/pages/sepetim.dart';
import 'package:alisverissepeti/models/urun_models.dart';
import 'package:alisverissepeti/pages/detayPage.dart';
import 'package:flutter/material.dart';

Widget buildList(List<Urun> listeAdi) {
  return (ListView.builder(
    itemCount: listeAdi.length,
    itemBuilder: (context, index) {
      String urunadi = listeAdi[index].urunadi;
      String fotograf = listeAdi[index].fotograf;
      int urunfiyati = listeAdi[index].urunfiyati;
      return Card(
        color: Colors.purple,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => detayPage(
                      urunadi: urunadi,
                      urunfiyati: urunfiyati,
                      fotograf: fotograf)),
            );
          },
          child: ListTile(
            title: Text(
              urunadi,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(urunfiyati.toString() + "TL",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text((index + 1).toString())),
            trailing: RaisedButton(
              child: Text("SEPETE EKLE"),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => sepetim()),
                );
              },
            ),
          ),
        ),
      );
    },
  ));
}
