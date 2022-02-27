import 'package:flutter/material.dart';
import 'package:mobile/models/contact.dart';

import 'package:mobile/providers/chat_provider.dart' as chat_provider;
import 'package:mobile/screens/chat_details.dart';

class Chats extends StatefulWidget {
  static const routeName = 'chats';

  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<Contact> contacts = [];

  @override
  void initState() {
    chat_provider.allContact().then((contacts) {
      setState(() {
        this.contacts = contacts;
      });
    });
    super.initState();
  }

  openChat(Contact contact) {
    Navigator.of(context).pushNamed(ChatDetails.routeName, arguments: contact);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Chats',
            style: Theme.of(context).textTheme.headline4,
          ),
          ...contacts
              .map(
                (contact) => Card(
                  child: InkWell(
                    onTap: () => openChat(contact),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red[700],
                        child: Text(
                          contact.username[0],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      title: Text(contact.username),
                      subtitle: Text(contact.lastMessage ?? ''),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
