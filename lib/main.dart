import 'package:alisverissepeti/pages/sepetim.dart';

import 'pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'pages/beyazEsya.dart';
import 'pages/evTekstil.dart';
import 'pages/giyim.dart';
import 'pages/kozmetik.dart';
import 'pages/mutfakGerecleri.dart';
import 'pages/teknoloji.dart';
import'pages/hakkindaPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: { // sayfalar arası geçiş işlemleri
        "/":(context)=>loginPage(),  // "/" ilk açıldığındaki yer
        "/teknoloji":(context)=>teknoloji(kategori: "TEKNOLOJİ",),
        "/giyim":(context)=>giyim(kategori: "GİYİM",),
        "/beyazesya":(context)=>beyazesya(kategori: "BEYAZ EŞYA",),
        "/kozmetik":(context)=>kozmetik(kategori: "KOZMETİK",),
        "/mutfakgerecleri":(context)=>mutfakgerecleri(kategori: "MUTFAK GEREÇLERİ",),
        "/evtekstil":(context)=>evtekstil(kategori: "EV TEKSTİL",),
        "/hakkindaPage":(context)=>hakkindaPage(),
        "/sepetim":(context)=>sepetim(),


      },
    );
  }
}

