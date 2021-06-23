import 'package:alisverissepeti/pages/loginPage.dart';
import 'package:alisverissepeti/service/auth.dart';
import 'package:flutter/material.dart';

class kayitPage extends StatefulWidget {
  @override
  kayitPageState createState() => kayitPageState();
}

class kayitPageState extends State<kayitPage> {
  String cinsiyet="";
  AuthService _auth=AuthService();
  bool sifreGorunurluk = true;
  bool kadin = false;
  bool erkek = false;
  String kullanici_adi = "";
  String kullanicimaili = "";
  String parola = "";
  String parolatekrar = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("KAYIT OL"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Form(

      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SingleChildScrollView(
          //TAŞMA HATASINI ÖNLEMEK İÇİN
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all()),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.purple),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: "Kullanıcı Adı",
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            //value nullsa
                            return "LÜTFEN KULLANICI ADINIZI GİRİNİZ";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          kullanici_adi = value;
                        },
                      ),

                      SizedBox(height: 10.0),
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
                         kullanicimaili = value;
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
                          prefixIcon:
                              Icon(Icons.vpn_key_rounded, color: Colors.black),
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
                              child: Icon(Icons.remove_red_eye,
                                  color: Colors.black)),
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
                      TextFormField(
                        obscureText: sifreGorunurluk ? true : false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.purple),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: "Parola Tekrar",
                          prefixIcon:
                              Icon(Icons.vpn_key_rounded, color: Colors.black),
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
                          parolatekrar = value;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            //taşmayı önlemek için ekrana sığdırıyor
                            child: CheckboxListTile(
                                activeColor: Colors.purple,
                                title: Text("Kadın"),
                                value: kadin,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                //işaretlme başa gelsin
                                onChanged: (newValue) {
                                  setState(() {
                                    kadin = newValue;

                                    if (kadin == true) {
                                      erkek = false;
                                    }
                                  });
                                }),
                          ),
                          Expanded(
                            //taşmayı önlemek için ekrana sığdırıyor
                            child: CheckboxListTile(
                                activeColor: Colors.purple,
                                title: Text("Erkek"),
                                value: erkek,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                //işaretleme başa gelsin
                                onChanged: (newValue) {
                                  setState(() {
                                    erkek = newValue;
                                    if (erkek == true) {
                                      kadin = false;
                                    }
                                  });
                                }),
                          ),
                        ],
                      ),

                      buildButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                "KAYIT OL",
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
                  } else if (parola.length < 5||parolatekrar.length<5) {
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
                  }
                  else if (parola!=parolatekrar) {
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
                            Text("PAROLALAR EŞLEŞMİYOR"),
                            actions: <Widget>[
                              MaterialButton(
                                  child: Text("Geri Dön"),
                                  onPressed: () => Navigator.pop(context))
                            ],
                          );
                        });
                  }else {
                    if(kadin){
                      cinsiyet="Kadın";
                    }
                    else{
                      cinsiyet="Erkek";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content:new Text("Kayıt Olundu")));
                    _auth.createPerson(kullanici_adi, parola, kullanicimaili,cinsiyet).then((user){
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                loginPage()),

                      );
                    });
                  }
                }
              }),
        ),
      );


}
