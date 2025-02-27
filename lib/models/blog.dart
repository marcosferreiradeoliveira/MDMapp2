import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  String? title;
  String? title_en;

  String? description;
  String? description_en;
  String? thumbnailImageUrl;

  String? date;
  String? timestamp;

  Blog(
      {this.title,
      this.description,
      this.date,
      this.timestamp,
      this.title_en,
      this.description_en,
      this.thumbnailImageUrl});

  factory Blog.fromFirestore(DocumentSnapshot snapshot) {
    Map d = snapshot.data() as Map<dynamic, dynamic>;
    return Blog(
      title: d['title'],
      description: d['description'],
      thumbnailImageUrl: d['thumbnailImageUrl'],
      date: d['date'],
      timestamp: d['timestamp'],
      title_en: d['title_en'],
      description_en: d['description_en'],
    );
  }
}
