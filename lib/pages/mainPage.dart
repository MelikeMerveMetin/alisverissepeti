import 'package:alisverissepeti/pages/sepetim.dart';
import 'package:flutter/material.dart';
import '../functions/kategoriButton.dart';

class mainPage extends StatefulWidget {
  final kullaniciadi;

  const mainPage({Key key, @required this.kullaniciadi}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int sekme = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOŞGELDİN " + widget.kullaniciadi),
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
            child: Column(
              children: [
                buildButton(context, "TEKNOLOJİ"),
                buildButton(context, "GİYİM"),
                buildButton(context, "MUTFAK GEREÇLERİ"),
                buildButton(context, "KOZMETİK"),
                buildButton(context, "EV TEKSTİL"),
                buildButton(context, "BEYAZ EŞYA"),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text("Hakkında"),
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
                Navigator.pushNamed(context, "/hakkindaPage");
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
