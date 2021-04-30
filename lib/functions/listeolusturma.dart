import 'file:///D:/AndroidStudioProjeleri/alisverissepeti/lib/pages/sepetim.dart';
import 'package:flutter/material.dart';
import '../urun.dart';

Widget buildList(List<Urun> listeAdi) {
  return (ListView.builder(
    itemCount: listeAdi.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.purple,
        child: ListTile(
          title: Text(
            listeAdi[index].urunadi,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          subtitle: Text(listeAdi[index].urunfiyati.toString() + "TL",
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
      );
    },
  ));
}
