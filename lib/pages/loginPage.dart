import 'package:alisverissepeti/functions/buildHakkinda.dart';
import 'package:alisverissepeti/functions/kayitButton.dart';
import 'package:alisverissepeti/service/auth.dart';
import 'package:flutter/material.dart';
import 'mainPage.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String kullanici_maili = "";
  bool sifreGorunurluk = true;
  String parola = "";
  final _formKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();

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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.purple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    labelText: "Kullanıcı Maili",
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      //value nullsa
                      return "LÜTFEN MAİL ADRESİNİZİ GİRİNİZ";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    kullanici_maili = value;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: sifreGorunurluk ? true : false,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.purple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    labelText: "Parola",
                    prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.black),
                    suffixIcon: InkWell(
                        //ıcona tıklama özelliği veriyor
                        onTap: () {
                          if (sifreGorunurluk == true) {
                            setState(() {
                              //tıkladığımızı anlasın diye
                              sifreGorunurluk = false;
                            });
                          } else {
                            setState(() {
                              sifreGorunurluk = true;
                            });
                          }
                        },
                        child: Icon(Icons.remove_red_eye, color: Colors.black)),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      //value nullsa
                      return "LÜTFEN PAROLANIZI GİRİNİZ";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    parola = value;
                  },
                ),
                SizedBox(height: 10.0),
                buildButton(),
                kayitButton(context),
                buildHakkinda(context),
                AnimatedBuilder(
                  animation: _controller.view,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value *3, //hız
                      child: child,
                    );
                  },
                  child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.purple,
                      child: Center(
                        child: Text(
                          "ALIŞVERİŞ SEPETİM",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),

                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 180,
          height: 60,
          child: RaisedButton(
            color: Colors.purple,
            onPressed: () {}, //renk verebilmek için tıklama özelliği verdim
            child: Container(
              child: GestureDetector(
                  child: Text(
                    "GİRİŞ YAP",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: new Text("Giriş Yapmak İçin Çift Tıklayın.")));
                  },
                  onDoubleTap: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _auth.signIn(kullanici_maili, parola).then((user) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            new SnackBar(content: new Text("Giriş Yapıldı")));
                        return Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mainPage()),
                        );
                      });
                    }
                  }),
            ),
          ),
        ),
      );
}
