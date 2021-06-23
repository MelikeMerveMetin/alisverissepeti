import 'package:flutter/material.dart';
import '../pages/beyazEsya.dart';
import '../pages/evTekstil.dart';
import '../pages/giyim.dart';
import '../pages/kozmetik.dart';
import '../pages/mutfakGerecleri.dart';
import '../pages/teknoloji.dart';

Widget buildButton(context,String kategori)=> Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: RaisedButton(
         color: Colors.purple,
          elevation: 10,
          child: Text(
           kategori,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (kategori == "TEKNOLOJİ") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => teknoloji(kategori: kategori)),
              );
            } else if (kategori == "GİYİM") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => giyim(kategori: kategori)),
              );
            } else if (kategori == "MUTFAK GEREÇLERİ") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mutfakgerecleri(kategori: kategori)),
              );
            } else if (kategori == "KOZMETİK") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => kozmetik(kategori: kategori)),
              );
            } else if (kategori == "EV TEKSTİL") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => evtekstil(kategori: kategori)),
              );
            } else if (kategori == "BEYAZ EŞYA") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => beyazesya(kategori: kategori)),
              );
            }
          },
        ),
      ),
    );
