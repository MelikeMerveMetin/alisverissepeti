import 'package:alisverissepeti/pages/loginPage.dart';
import 'package:alisverissepeti/pages/mainPage.dart';
import 'package:alisverissepeti/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class sepetim extends StatefulWidget {
  @override
  _sepetimState createState() => _sepetimState();
}

class _sepetimState extends State<sepetim> {
  String url = '';
  String kullanici_adi;
  AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("SEPETİM"),
      ),
      body:
      Column(
        children: [
    ]  ),
     drawer: Drawer(
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
          buildDrawer("NOT", "/notPage"),
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
          ListTile(
              title: Text(
                "ÇIKIŞ YAP",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                _auth.signOut().then((user){
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            loginPage()),

                  );
                });
              }),


        ],
      )),
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


