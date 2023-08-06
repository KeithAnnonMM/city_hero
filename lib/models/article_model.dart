import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String? id;
  String? author;
  String? urlToImage;
  String? title;
  String? description;
  String? url;
  String? content;
  String? publishedAt;

  Article({
    this.id,
    this.author,
    this.title,
    this.content,
    this.description,
    this.publishedAt,
    this.url,
    this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      title: json['title'],
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  factory Article.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Article(
      id: document.id,
      author: data['author'],
      title: data['title'],
      content: data['content'],
      description: data['description'],
      publishedAt: data['publishedAt'],
      url: data['url'],
      urlToImage: data['urlToImage'],
    );
  }
}
