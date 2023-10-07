import 'package:bookly/domain/entities/book.dart';

class BooksModel extends Books {
  const BooksModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.authors,
    required super.image,
    required super.url,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
    BooksModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['subtitle'],
      authors: json['authors'],
      image: json['image'],
      url: json['url'],
    );

}
