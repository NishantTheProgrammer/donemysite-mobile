import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/main.dart';
import 'package:mobile/models/auth_resoponse.dart';

Future<LoginResponse> login(
    {required String username, required String password}) async {
  final response = await http.post(Uri.parse('$baseURL/account/token/'), body: {
    "username": username,
    "password": password,
  });

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    storage.write(key: "access_token", value: 'JWT ' + body['access']);
    return LoginResponse.fromJson(body);
  } else {
    throw Exception(jsonDecode(response.body)['detail']);
  }
}

Future<bool> isAuth() async {
  final accessToken = await storage.read(key: 'access_token');
  return Future.value(accessToken != '');
}
