import 'package:mobile/models/contact.dart';

class Message {
  final int id;
  final Contact receiver;
  // final Contact sender;
  final String? createdAt;
  final String? text;
  String? attachment;

  Message({
    required this.id,
    required this.receiver,
    // required this.sender,
    this.createdAt,
    this.text,
    this.attachment,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    print(json);
    return Message(
      id: json['id'],
      receiver: Contact.fromJson(json['receiver']),
      // sender: Contact.fromJson(json['sender']),
      createdAt: json['created_at'],
      text: json['text'],
      attachment: json['attachment'],
    );
  }
}
