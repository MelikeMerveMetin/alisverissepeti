import 'package:flutter/material.dart';
import '../pages/beyazEsya.dart';
import '../pages/evTekstil.dart';
import '../pages/giyim.dart';
import '../pages/kozmetik.dart';
import '../pages/mutfakGerecleri.dart';
import '../pages/teknoloji.dart';

Widget buildButton(BuildContext context, String i) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: RaisedButton(
          color: Colors.purple,
          elevation: 10,
          child: Text(
            i,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (i == "TEKNOLOJİ") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => teknoloji(kategori: i)),
              );
            } else if (i == "GİYİM") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => giyim(kategori: i)),
              );
            } else if (i == "MUTFAK GEREÇLERİ") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mutfakgerecleri(kategori: i)),
              );
            } else if (i == "KOZMETİK") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => kozmetik(kategori: i)),
              );
            } else if (i == "EV TEKSTİL") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => evtekstil(kategori: i)),
              );
            } else if (i == "BEYAZ EŞYA") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => beyazesya(kategori: i)),
              );
            }
          },
        ),
      ),
    );
