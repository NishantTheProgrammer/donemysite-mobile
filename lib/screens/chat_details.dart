import 'package:flutter/material.dart';
import 'package:mobile/models/message.dart';
import 'package:mobile/models/contact.dart';

import 'package:mobile/providers/chat_provider.dart' as chat_provider;

class ChatDetails extends StatefulWidget {
  // const ChatDetails({Key? key}) : super(key: key);
  static const routeName = 'chat-details';
  final Contact contact;
  List<Message> chats = [];

  ChatDetails(this.contact, {Key? key}) : super(key: key);

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  void initState() {
    chat_provider.chatDetails(widget.contact.id).then((chats) {
      setState(() {
        widget.chats = chats;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.username),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Chats',
              style: Theme.of(context).textTheme.headline4,
            ),
            ...widget.chats
                .map(
                  (chat) => Card(
                    child: Text(chat.text ?? ''),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
