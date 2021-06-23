import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class sepetim extends StatefulWidget {
  @override
  _sepetimState createState() => _sepetimState();
}

class _sepetimState extends State<sepetim> {
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("SEPETİM"),
      ),
      body: Text(""),
     /* drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 15),
        children: [
          buildDrawer("TEKNOLOJİ","/teknoloji"),
          buildDrawer("GİYİM", "/giyim"),
          buildDrawer("MUTFAK GEREÇLERİ", "/mutfakgerecleri"),
          buildDrawer("KOZMETİK", "/kozmetik"),
          buildDrawer("EV TEKSTİL", "/evtekstil"),
          buildDrawer("BEYAZ EŞYA", "/beyazesya"),
          buildDrawer("HAKKINDA", "/hakkindaPage"),
          buildDrawer("ÇALIŞANLARIMIZ", "/calisan_view"),
          ListTile(
              title: Text(
                "BİZE ULAŞIN",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                url = 'tel:+90 507 035 99 14';
                urlLauncher(url);
              }),
          buildDrawer("İSTATİSTİK", "/LineChartSample"),
          buildDrawer("ÇIKIŞ YAP", "/"),

        ],
      )),*/
    );
  }
  void urlLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildDrawer(String title, String routeName) => ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 17),
    ),
    onTap: () => Navigator.pushNamed(context, routeName),
  );

}


