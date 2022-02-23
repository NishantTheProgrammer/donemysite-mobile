import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/auth_resoponse.dart';

Future<LoginResponse> login(
    {required String username, required String password}) async {
  final response = await http.post(
      Uri.parse(
          'https://nishanttheprogrammer.pythonanywhere.com/api/account/token/'),
      body: {
        "username": username,
        "password": password,
      });

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(jsonDecode(response.body)['detail']);
  }
}
