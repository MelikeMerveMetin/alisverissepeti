import 'package:alisverissepeti/pages/kayitPage.dart';
import 'package:flutter/material.dart';

Widget kayitButton(BuildContext context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
        width: 180,
        height: 60,
        child: RaisedButton(
          color: Colors.purple,
          child: Text(
            "KAYIT OL",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => kayitPage()),
            );
          },
        )));
