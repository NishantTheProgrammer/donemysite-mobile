class Contact {
  final int id;
  final String username;
  String? lastMessage;
  String? picture;

  Contact({
    required this.id,
    required this.username,
    this.lastMessage,
    this.picture,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      username: json['username'],
      lastMessage: json['last_msg'],
      picture: json['picture'],
    );
  }
}
