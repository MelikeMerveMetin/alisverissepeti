import 'dart:convert';
import 'package:alisverissepeti/models/calisan_model.dart';
import 'package:http/http.dart' as http;

Future<List<Calisan>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode((response.body));
    return jsonResponse.map((data) => new Calisan.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
