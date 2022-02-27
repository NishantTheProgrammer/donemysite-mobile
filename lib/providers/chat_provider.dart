import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/main.dart';
import 'package:mobile/models/message.dart';
import 'package:mobile/models/contact.dart';
import 'package:mobile/models/gig.dart';

Future<List<Contact>> allContact() async {
  final accessToken = await storage.read(key: 'access_token');
  if (accessToken == null) throw Exception('Please login to see content');
  final response = await http.get(Uri.parse('$baseURL/message/'),
      headers: {'Authorization': accessToken});

  if (response.statusCode == 200) {
    List<Contact> result = [];
    jsonDecode(response.body).forEach((gig) {
      result.add(Contact.fromJson(gig));
    });
    return result;
  } else {
    throw Exception(jsonDecode(response.body));
  }
}

Future<List<Message>> chatDetails(chatId) async {
  final accessToken = await storage.read(key: 'access_token');
  if (accessToken == null) throw Exception('Please login to see content');
  final response = await http.get(Uri.parse('$baseURL/message/$chatId/'),
      headers: {'Authorization': accessToken});

  if (response.statusCode == 200) {
    List<Message> result = [];
    jsonDecode(response.body).forEach((chat) {
      result.add(Message.fromJson(chat));
    });
    return result;
  } else {
    throw Exception(jsonDecode(response.body));
  }
}
