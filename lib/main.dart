import 'package:alisverissepeti/grafik_olustur.dart';
import 'package:alisverissepeti/pages/detayPage.dart';
import 'package:alisverissepeti/pages/mainPage.dart';
import 'package:alisverissepeti/pages/notPage.dart';
import 'package:alisverissepeti/pages/sepetim.dart';
import 'package:alisverissepeti/views/calisan_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'pages/beyazEsya.dart';
import 'pages/evTekstil.dart';
import 'pages/giyim.dart';
import 'pages/kozmetik.dart';
import 'pages/mutfakGerecleri.dart';
import 'pages/teknoloji.dart';
import 'pages/hakkindaPage.dart';
import 'pages/kayitPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //köşedeki debug yazısını kaldırmak için
      routes: {
        // sayfalar arası geçiş işlemleri
        "/": (context) => loginPage(), // "/" ilk açıldığındaki yer
        "/teknoloji": (context) => teknoloji(
              kategori: "TEKNOLOJİ",
            ),
        "/giyim": (context) => giyim(
              kategori: "GİYİM",
            ),
        "/beyazesya": (context) => beyazesya(
              kategori: "BEYAZ EŞYA",
            ),
        "/kozmetik": (context) => kozmetik(
              kategori: "KOZMETİK",
            ),
        "/mutfakgerecleri": (context) => mutfakgerecleri(
              kategori: "MUTFAK GEREÇLERİ",
            ),
        "/evtekstil": (context) => evtekstil(
              kategori: "EV TEKSTİL",
            ),
        "/hakkindaPage": (context) => hakkindaPage(),
        "/sepetim": (context) => sepetim(),
        "/kayitPage": (context) => kayitPage(),
        "/detayPage": (context) => detayPage(),
        "/calisan_view": (context) => CalisanView(),
        "/mainPage":(context)=>mainPage(),
        "/notPage":(context)=>notPage(),
        "/LineChart":(context)=>LineChartSample(),
      },
    );
  }
}
