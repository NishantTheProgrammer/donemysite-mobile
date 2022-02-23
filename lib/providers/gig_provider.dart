import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/gig.dart';

Future<List<Gig>> all() async {
  final response = await http.get(
      Uri.parse('https://nishanttheprogrammer.pythonanywhere.com/api/gig/'));

  print(response.toString());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Gig> result = [];
    jsonDecode(response.body).forEach((gig) {
      result.add(Gig.fromJson(gig));
    });
    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(jsonDecode(response.body));
  }
}
