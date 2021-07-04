import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class notPage extends StatefulWidget {
  notPage({Key key}) : super(key: key);

  @override
  _notPageState createState() => _notPageState();
}

class _notPageState extends State<notPage> {
  String urun, id, kategori;
  int fiyat;

  idAl(idDegeri) {
    this.id = idDegeri;
  }

  isimAl(isimDegeri) {
    this.urun = isimDegeri;
  }

  kategoriAl(kategoriDegeri) {
    this.kategori = kategoriDegeri;
  }

  sayfaSayisiAl(fiyatDegeri) {
    this.fiyat = int.parse(fiyatDegeri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("NOTLARIM"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String idDegeri) {
                  idAl(idDegeri);
                },
                decoration: InputDecoration(
                  labelText: "Id",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String isimDegeri) {
                  isimAl(isimDegeri);
                },
                decoration: InputDecoration(
                  labelText: "ÜRÜN ADI",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String kategoriDegeri) {
                  kategoriAl(kategoriDegeri);
                },
                decoration: InputDecoration(
                  labelText: "KATEGORİ",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String fiyatDegeri) {
                  sayfaSayisiAl(fiyatDegeri);
                },
                decoration: InputDecoration(
                  labelText: "FİYAT",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      veriEkle();
                    },
                    child: Text("Ekle"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      veriOku();
                    },
                    child: Text("Oku"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      veriGuncelle();
                    },
                    child: Text("Güncelle"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      veriSil();
                    },
                    child: Text("Sil"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("NOTLAR").snapshots(),
              builder: (context, alinanVeri) {
                if (alinanVeri.hasError) {
                  return Text("Aktarim Basarisiz!");
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: alinanVeri.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot satirVerisi = alinanVeri.data.docs[index];

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              satirVerisi["Id"],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              satirVerisi["Ad"],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              satirVerisi["Kategori"],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              satirVerisi["Fiyat"],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void veriEkle() {
    DocumentReference veriYolu =
        FirebaseFirestore.instance.collection("NOTLAR").doc(id);

    Map<String, dynamic> notlar = {
      "Id": id,
      "Ad": urun,
      "Kategori": kategori,
      "Fiyat": fiyat.toString(),
    };

    veriYolu.set(notlar).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
          new SnackBar(content: new Text(id + "ID numarali kitap eklendi.")));
    });
  }

  void veriOku() {
    DocumentReference veriOkumaYolu =
        FirebaseFirestore.instance.collection("NOTLAR").doc(id);

    veriOkumaYolu.get().then((alinanDeger) {
      Map<String, dynamic> alinanVeri = alinanDeger.data();

      String idTutucu = alinanVeri["Id"];
      String adTutucu = alinanVeri["Ad"];
      String kategoriTutucu = alinanVeri["Kategori"];
      String fiyatTutucu = alinanVeri["Fiyat"];

      ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(
          content: new Text("ID: " +
              idTutucu +
              " Ad: " +
              adTutucu +
              " Kategori: " +
              kategoriTutucu +
              " Sayfa Sayisi: " +
              fiyatTutucu),
        ),
      );
    });
  }

  void veriGuncelle() {
    DocumentReference veriGuncellemeYolu =
        FirebaseFirestore.instance.collection("NOTLAR").doc(id);

    Map<String, dynamic> guncellenecekVeri = {
      "Id": id,
      "Ad": urun,
      "Kategori": kategori,
      "Fiyat": fiyat.toString(),
    };

    veriGuncellemeYolu.update(guncellenecekVeri).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: new Text(id + " ID numarali kitap güncellendi!")));
    });
  }

  void veriSil() {
    DocumentReference veriSilmeYolu =
        FirebaseFirestore.instance.collection("NOTLAR").doc(id);

    veriSilmeYolu.delete().whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
          new SnackBar(content: new Text(id + " ID numarali kitap silindi!")));
    });
  }
}
