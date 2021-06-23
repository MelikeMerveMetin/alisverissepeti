import 'package:flutter/material.dart';
import '../functions/kategoriButton.dart';

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int sekme = 1;
  final List<String> kategoriler = [
    "TEKNOLOJİ,teknoloji()",
    "GİYİM,giyim()",
    "MUTFAK GEREÇLERİ",
    "KOZMETİK",
    "EV TEKSTİL",
    "BEYAZ EŞYA"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOŞ GELDİNİZ"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.add_shopping_cart,
                size: 40,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/sepetim");
              })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 20, 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                buildButton(context, "TEKNOLOJİ"),
                buildButton(context, "GİYİM"),
                buildButton(context, "MUTFAK GEREÇLERİ"),
                buildButton(context, "KOZMETİK"),
                buildButton(context, "EV TEKSTİL"),
                buildButton(context, "BEYAZ EŞYA"),
              ]),
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              title: Text("Çıkış"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Anasayfa"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              title: Text("Sepetim"),
            ),
          ],
          currentIndex: sekme,
          onTap: (int i) {
            switch (i) {
              case 0:
                setState(() {
                  sekme = 0;
                });
                Navigator.pushNamed(context, "/");
                break;
              case 1:
                setState(() {
                  sekme = 1;
                });
                Navigator.pushNamed(context, "/mainPage");
                break;
              case 2:
                setState(() {
                  sekme = 2;
                });
                Navigator.pushNamed(context, "/sepetim");

                break;
            }
          }),
    );
  }
}
