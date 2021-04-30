import 'package:alisverissepeti/functions/buildHakkinda.dart';
import 'package:flutter/material.dart';
import 'mainPage.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  String kullanici_adi = "";
  String parola = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("ALIŞVERİŞ SEPETİM"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildText("KULLANICI ADI"),
            SizedBox(height: 10.0),
            buildText("PAROLA"),
            SizedBox(height: 10.0),
            buildButton(),
            buildHakkinda(context),
          ],
        ),
      ),
    );
  }

  Widget buildText(String a) {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.purple),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          labelText: a,
          border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty && a == "KULLANICI ADI") {
          //value nullsa
          return "LÜTFEN KULLANICI ADINIZI GİRİNİZ";
        }

        if (value.isEmpty && a == "PAROLA") {
          return "LÜTFEN PAROLANIZINI GİRİNİZ";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        if (a == "KULLANICI ADI") {
          kullanici_adi = value;
        }
        if (a == "PAROLA") {
          parola = value;
        }
      },
    );
  }

  Widget buildButton() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 150,
          height: 60,
          child: RaisedButton(
              color: Colors.purple,
              child: Text(
                "GİRİŞ YAP",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  if (kullanici_adi.length < 5) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "HATA",
                              style: TextStyle(color: Colors.red),
                            ),
                            content: Text(
                                "KULLANICI ADI EN AZ 5 KARAKTERLİ OLMALIDIR"),
                            actions: <Widget>[
                              MaterialButton(
                                  child: Text("Geri Dön"),
                                  onPressed: () => Navigator.pop(context))
                            ],
                          );
                        });
                  } else if (parola.length < 5) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "HATA",
                              style: TextStyle(color: Colors.red),
                            ),
                            content:
                                Text("PAROLA EN AZ 5 KARAKTERLİ OLMALIDIR"),
                            actions: <Widget>[
                              MaterialButton(
                                  child: Text("Geri Dön"),
                                  onPressed: () => Navigator.pop(context))
                            ],
                          );
                        });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              mainPage(kullaniciadi: kullanici_adi)),
                    );
                  }
                }
              }),
        ),
      );
}
