import 'package:alisverissepeti/pages/hakkindaPage.dart';
import 'package:flutter/material.dart';

Widget buildHakkinda(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 180,
        height: 60,
        child: RaisedButton(
          color: Colors.purple,
          child: Text(
            "HAKKINDA",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => hakkindaPage()),
            );
          },
        ),
      ),
    );
