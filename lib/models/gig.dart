class Gig {
  // final String author;
  final String title;
  final int price;
  final String photo;
  final String? video;
  final int rating;
  // final int delivery_days;
  final String description;
  // final tags;
  // final String created_at;
  // final String updated_at;
  // final likes;

  const Gig({
    // required this.author,
    required this.title,
    required this.price,
    required this.photo,
    this.video = '',
    required this.rating,
    // final int delivery_days;
    required this.description,
    // final tags;
    // required this.created_at,
    // required this.updated_at,
  });

  factory Gig.fromJson(Map<String, dynamic> json) {
    return Gig(
      // author: json['author'],
      title: json['title'],
      price: json['price'],
      photo: json['photo'],
      video: json['video'],
      rating: json['rating'],
      description: json['description'],
    );
  }
}
