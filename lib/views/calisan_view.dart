import 'package:alisverissepeti/models/calisan_model.dart';
import 'package:alisverissepeti/service/calisan_service.dart';
import 'package:flutter/material.dart';

class CalisanView extends StatefulWidget {
  @override
  _CalisanViewState createState() => _CalisanViewState();
}

class _CalisanViewState extends State<CalisanView> {
  Future<List<Calisan>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("ÇALIŞANLARIMIZ"),
      ),
      body: Center(
        child: FutureBuilder<List<Calisan>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Calisan> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    // height: 50,
                    color: Colors.purple.shade300,
                    child: Column(
                      children: [
                        Text(
                          "Adı: " + data[index].name,
                          style: TextStyle(color: Colors.white, fontSize: 21),
                        ),
                        Text(
                          "E-mail: " + data[index].email,
                          style: TextStyle(color: Colors.white, fontSize: 21),
                        ),
                        Text(
                          "Telefon: " + data[index].phone,
                          style: TextStyle(color: Colors.white, fontSize: 21),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
