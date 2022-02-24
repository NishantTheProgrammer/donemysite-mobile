import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/main.dart';
import 'package:mobile/models/gig.dart';

Future<List<Gig>> all() async {
  final response = await http.get(Uri.parse('$baseURL/gig/'));

  if (response.statusCode == 200) {
    List<Gig> result = [];
    jsonDecode(response.body).forEach((gig) {
      result.add(Gig.fromJson(gig));
    });
    return result;
  } else {
    throw Exception(jsonDecode(response.body));
  }
}
