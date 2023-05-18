import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article article) => json.encode(article.toJson());

class Article {
  final String author;
  final String title;
  final String description;
  final String image;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "image": image,
      };
}
