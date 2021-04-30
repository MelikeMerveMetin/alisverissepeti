import 'package:flutter/material.dart';

class sepetim extends StatefulWidget {
  @override
  _sepetimState createState() => _sepetimState();
}

class _sepetimState extends State<sepetim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("SEPETİM"),
      ),
      body: Text(""),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 15),
        children: [
          buildDrawer("TEKNOLOJİ", "/teknoloji"),
          buildDrawer("GİYİM", "/giyim"),
          buildDrawer("MUTFAK GEREÇLERİ", "/mutfakgerecleri"),
          buildDrawer("KOZMETİK", "/kozmetik"),
          buildDrawer("EV TEKSTİL", "/evtekstil"),
          buildDrawer("BEYAZ EŞYA", "/beyazesya"),
          buildDrawer("HAKKINDA", "/hakkindaPage"),
        ],
      )),
    );
  }

  Widget buildDrawer(String title, String routeName) => ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 17),
        ),
        onTap: () => Navigator.pushNamed(context, routeName),
      );
}
